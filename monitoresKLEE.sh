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
    
    #Configuramos telegraf
    cp /etc/telegraf/telegraf.conf /etc/telegraf/telegraf$1.conf
    
    #Modificamos el nuevo archivo de configuración
    ### Hacer ajustes según apuntes elaborado-s, explicarlos aquí
    
    
    
    
    
    ### KLEE
    
    #Lanzamos el proceso KLEE con el nombre pasado como parámetro
    exec -a $1 $2
        
    #Establecemos una espera de 5 segundos para que el siguiente comando no genere un "No KLEE output directory found"
    sleep 5s

    #Lanzamos con klee-stats el web server que contendrá las estadísticas del proceso KLEE, las cuáles se monitorizarán con Grafana
    klee-stats --grafana $3
    
    
    
    
    
    ### TELEGRAF
    
    #Iniciamos el servicio
    sudo systemctl start telegraf
    
    #Lanzamos un proceso telegraf que use el archivo configuración que se especifica, el cual se encuentra en /etc/telegraf;
    #si cambiamos el archivo de directorio, hay que especificar la ruta absoluta
    telegraf --config telegraf.conf
fi  
     
