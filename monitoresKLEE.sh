#!/bin/bash

###PRE: Los 3 servicios están instalados, los paneles de Grafana ya configurados y se ejecuta en el mismo directorio donde se quiere lanzar
###     el proceso de KLEE
###IN: Recibe el nombre que se le dará al proceso en el sistema y la base de datos ($1), el comando KLEE a ejecutar ($2) y
#      el directorio del proceso KLEE (p.e., klee-out-0) ($3)
###OUT: Archivo de la base de datos con toda la información que ha sido monitorizada.


if [ $# -lt 3 ]
    then
    echo "Entrada script: nombre_proceso comando_KLEE dir_procesoKLEE"
else
    archconf="/etc/telegraf/telegraf$1.conf"
    if [ -e "$archconf" ]; then
    	echo "Ya se ha registrado una recolección de métricas para el proceso $1"
    else
    	echo "Configuración y reinicio de los servicios Telegraf, InfluxDB y Grafana..."
	
    	### GRAFANA
    
    	#Reiniciamos el servicio
    	sudo systemctl restart grafana-server
    
    
    
    
    
    	### InfluxDB
    
    	# Reiniciamos el servicio
    	sudo systemctl restart influxdb
    
    	#Creamos la base de datos con el nombre introducido como parámetro
    	influx -host 127.0.0.1 -port 8000 -execute "CREATE DATABASE $1"
    
    
    
    
    
    	### TELEGRAF
    
    	#Paramos el servicio
    	sudo systemctl stop telegraf
    
    	#Creamos una copia del archivo original de configuración de telegraf
    	sudo cp /etc/telegraf/telegraf.conf $archconf
    
    	#Modificamos el nuevo archivo de configuración
    
    	#Cambiamos el intervalo de recolección de datos, pasando de 10 a 5 segundos
    	sudo sed -i '28s/.*/  interval = "5s"/' $archconf
    
    	#Cambiamos el intervalo de envío de las métrica recopiladas a la/s salida/s configurada/s
    	sudo sed -i '56s/.*/  flush_interval = "5s"/' $archconf
    
    	#Habilitamos la configuración de InfluxDB
    	#1. Descomentamos la etiqueta de InfluxDB para que su configuración sea cargada
    	sudo sed -i '122s/.*/[[outputs.influxdb]]/' $archconf
    	#2. Configuramos el puerto InfluxDB donde se enviarán todas las métricas recolectadas 
    	sudo sed -i "127s/.*/  urls = [\"http:\/\/localhost:8000\"]/" $archconf
    	#3. Configuramos el nombre de la base de datos InfluxDB donde se almacenarán todas las métricas enviadas
    	sudo sed -i "133s/.*/  database = \"$1\"/" $archconf
    
    	#Deshabilitamos la configuración existente de Prometheus
    	sudo sed -i '1589s/.*/# [[outputs.prometheus_client]]/' $archconf
    	sudo sed -i '1591s/.*/#   listen = ":9273"/' $archconf
    	sudo sed -i '1599s/.*/#   metric_version = 2/' $archconf
    
    	#Habiltiamos la monitorización de procesos individuales según el nombre de los mismos
    	#1. Descomentamos la etiqueta de procstat para que su configuración sea cargada
    	sudo sed -i '6306s/.*/[[inputs.procstat]]/' $archconf
    	#2. Configuramos el nombre principal del ejecutable del proceso que estará en ejecución, del cual se recolectarán métricas
    	sudo sed -i '6310s/.*/    exe = "klee"/' $archconf
    	#3. Configuramos el patrón que usará 'pgrep' para buscar el proceso objetivo que está en ejecución, del cual se recolectarán métricas 
    	sudo sed -i "6312s/.*/    pattern = \"$1 --\"/" $archconf
    	#4. Habilitamos la inclusión del PID en la recolección de las métricas 
    	sudo sed -i '6343s/.*/    pid_tag = true/' $archconf
    	#5. Habilitamos la herramienta que se encargaŕa de buscar el PID en función del 'exe' y 'pid' configurados
    	sudo sed -i "6349s/.*/    pid_finder = \"pgrep\"/" $archconf
    
   
   
        
    
    	### KLEE
    
    	#Lanzamos, en segundo plano, el proceso KLEE con el nombre pasado como parámetro
    	gnome-terminal -- bash -c "
    	exec -a $1 $2;
    	exit;
    	exec bash" &
    
   	#Establecemos una espera de 5 segundos para que el siguiente comando no genere un "No KLEE output directory found"
    	sleep 5s

    	#Lanzamos, en segundo plano, con klee-stats el web server que contendrá las estadísticas del proceso KLEE, las cuáles 
    	#se monitorizarán con Grafana
    	gnome-terminal -- bash -c "
    	klee-stats --grafana $3;
    	exit;
    	exec bash" &
    
    
    
    
    
    	### TELEGRAF

    	#Iniciamos el servicio
    	sudo systemctl start telegraf
    
    	#Lanzamos un proceso telegraf que use el archivo configuración que se especifica, el cual se encuentra en /etc/telegraf;
    	#si cambiamos el archivo de directorio, hay que especificar la ruta absoluta
    	telegraf --config $archconf
    fi
fi  

