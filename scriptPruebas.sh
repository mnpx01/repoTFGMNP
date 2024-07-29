#!/bin/bash

echo "Automatización de Pruebas"

#TINYXML2
#dirtinyxml2="/home/martin/Escritorio/tinyxml2/build/"
#gnome-terminal -- bash -c "cd $dirtinyxml2;
#rm -r klee-* && rm -r Pruebas;
#mkdir Pruebas;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 5 2> Pruebas/tinyxml2_prueba1.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 10 2> Pruebas/tinyxml2_prueba2.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 20 2> Pruebas/tinyxml2_prueba3.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 40 2> Pruebas/tinyxml2_prueba4.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 5 --sym-files 1 8 2> Pruebas/tinyxml2_prueba5.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 10 --sym-files 1 8 2> Pruebas/tinyxml2_prueba6.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 20 --sym-files 1 8 2> Pruebas/tinyxml2_prueba7.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 40 --sym-files 1 8 2> Pruebas/tinyxml2_prueba8.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 5 --sym-files 1 8 --sym-stdout 2> Pruebas/tinyxml2_prueba9.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 10 --sym-files 1 8 --sym-stdout 2> Pruebas/tinyxml2_prueba10.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 20 --sym-files 1 8 --sym-stdout 2> Pruebas/tinyxml2_prueba11.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libtinyxml2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 40 --sym-files 1 8 --sym-stdout 2> Pruebas/tinyxml2_prueba12.txt;
#cp -r klee-* Pruebas;
#cp -r Pruebas ../../repoTFGMNP/apuntesTFG/tinyxml2Program/;
#exit;
#exec bash"






#OPENJPEG
#diropenjpeg="/home/martin/Escritorio/openjpeg/build/bin/"
#gnome-terminal -- bash -c "cd $diropenjpeg;
#rm -r klee-* && rm -r Pruebas;
#mkdir Pruebas;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 8 2> Pruebas/openjpeg_prueba1.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 8 --sym-files 1 64 2> Pruebas/openjpeg_prueba2.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 8 --sym-files 1 64 --sym-stdout 2> Pruebas/openjpeg_prueba3.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 8 --sym-files 1 64 --sym-stdout --sym-stdin 1024 2> Pruebas/openjpeg_prueba4.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 8 --sym-files 1 64 --sym-stdout --sym-stdin 2048 2> Pruebas/openjpeg_prueba5.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc -- -i prueba.png -o outputprueba1.jp2 2> Pruebas/openjpeg_prueba6.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc -- -i prueba.png -o outputprueba2.jp2 -r 40 2> Pruebas/openjpeg_prueba7.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc -- -i prueba.png -o outputprueba3.jp2 -t 1024,1024 2> Pruebas/openjpeg_prueba8.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc -- -i prueba.png -o outputprueba4.jp2 -n 6 2> Pruebas/openjpeg_prueba9.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc -- -i prueba.png -o outputprueba5.jp2 -q 40,60,80 2> Pruebas/openjpeg_prueba10.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc -- -i prueba.png -o outputprueba6.jp2 -q 30,40,50 -n 6 -t 2048,2048 2> Pruebas/openjpeg_prueba11.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc -- -i prueba.png -o outputprueba7.jp2 -r 40 -n 6 -t 1024,1024 --sym-args 0 13 8 --sym-files 1 64 --sym-stdout --sym-stdin 2048 2> Pruebas/openjpeg_prueba12.txt;
#cp -r klee-* Pruebas;
#cp -r Pruebas ../../../repoTFGMNP/apuntesTFG/openjpegProgram/;
#exit;
#exec bash"






#LIBARCHIVE
#dirlibarchive="/home/martin/Escritorio/libarchive/build/bin/"
#gnome-terminal -- bash -c "cd $dirlibarchive;
#rm -r klee-* && rm -r Pruebas;
#mkdir Pruebas;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc --sym-stdin 1024 2> Pruebas/libarchive_prueba1.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc --sym-stdin 2048 2> Pruebas/libarchive_prueba2.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc --sym-stdin 4096 2> Pruebas/libarchive_prueba3.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc --sym-stdin 8192 2> Pruebas/libarchive_prueba4.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- noexiste 2> Pruebas/libarchive_prueba5.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- prueba.zip 2> Pruebas/libarchive_prueba6.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- prueba.sh 2> Pruebas/libarchive_prueba7.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- prueba.png 2> Pruebas/libarchive_prueba8.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- noexiste --sym-stdin 2048 2> Pruebas/libarchive_prueba9.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- prueba.zip --sym-stdin 2048 2> Pruebas/libarchive_prueba10.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- prueba.sh --sym-stdin 2048 2> Pruebas/libarchive_prueba11.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- prueba.png --sym-stdin 2048 2> Pruebas/libarchive_prueba12.txt;
#cp -r klee-* Pruebas;
#cp -r Pruebas ../../../repoTFGMNP/apuntesTFG/libarchiveProgram/;
#exit;
#exec bash"






#TCPDUMP
#dirtcpdump="/home/martin/Escritorio/tcpdump/build"
#gnome-terminal -- bash -c "cd $dirtcpdump;
#rm -r klee-* && rm -r Pruebas;
#mkdir Pruebas;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc --sym-args 0 6 10 2> Pruebas/tcpdump_prueba1.txt; 
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc --sym-args 0 6 50 2> Pruebas/tcpdump_prueba2.txt; 
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc --sym-args 0 6 10 --sym-stdout 2> Pruebas/tcpdump_prueba3.txt; 
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc --sym-args 0 6 50 --sym-stdout 2> Pruebas/tcpdump_prueba4.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc --sym-stdout --sym-stdin 1024 2> Pruebas/tcpdump_prueba5.txt; 
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc --sym-stdout --sym-stdin 2048 2> Pruebas/tcpdump_prueba6.txt; 
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc -- -i wlp2s0 2> Pruebas/tcpdump_prueba7.txt; 
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc -- -i wlp2s0 host 192.168.1.165 2> Pruebas/tcpdump_prueba8.txt; 
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc -- -i wlp2s0 port 443 2> Pruebas/tcpdump_prueba9.txt; 
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc -- -i wlp2s0 host 192.168.1.165 port 80 and not port 443  2> Pruebas/tcpdump_prueba10.txt; 
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc -- -i wlp2s0 host 192.168.1.165 -c 200 -nn port 80 and not port 443 2> Pruebas/tcpdump_prueba11.txt; 
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --watchdog -link-llvm-lib=/home/martin/Escritorio/libpcap/build/libpcap.bca -link-llvm-lib=libnetdissect.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./tcpdump.bc -- -i wlp2s0 host 192.168.1.165 -c 200 -tttt -nn port 80 and not port 443 --sym-stdout --sym-stdin 1024 2> Pruebas/tcpdump_prueba12.txt; 
#cp -r klee-* Pruebas;
#cp -r Pruebas ../../repoTFGMNP/apuntesTFG/tcpdumpProgram/;
#exit;
#exec bash"







#MATCLPRO
#dirmatclpro="/home/martin/Escritorio/matclpro/build/"
#gnome-terminal -- bash -c "cd $dirmatclpro;
#rm -r klee-* && rm -r Pruebas;
#mkdir Pruebas;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 10 2> Pruebas/matclpro_prueba1.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 50 2> Pruebas/matclpro_prueba2.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 100 2> Pruebas/matclpro_prueba3.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 500 2> Pruebas/matclpro_prueba4.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 10 --sym-files 1 8 2> Pruebas/matclpro_prueba5.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 50 --sym-files 1 8 2> Pruebas/matclpro_prueba6.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 100 --sym-files 1 8 2> Pruebas/matclpro_prueba7.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 500 --sym-files 1 8 2> Pruebas/matclpro_prueba8.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 10 --sym-files 1 8 --sym-stdout 2> Pruebas/matclpro_prueba9.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 50 --sym-files 1 8 --sym-stdout 2> Pruebas/matclpro_prueba10.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 100 --sym-files 1 8 --sym-stdout 2> Pruebas/matclpro_prueba11.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./testmat.bc --sym-args 0 6 500 --sym-files 1 8 --sym-stdout 2> Pruebas/matclpro_prueba12.txt;
#cp -r klee-* Pruebas;
#cp -r Pruebas ../../repoTFGMNP/apuntesTFG/matrix_tcl_proProgram/;
#exit;
#exec bash"

