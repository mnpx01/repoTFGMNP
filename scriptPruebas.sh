#!/bin/bash

echo "Automatización de Pruebas"

#TINYXML2
#dirtinyxml2="/home/martin/Escritorio/tinyxml2/build/"
#gnome-terminal -- bash -c "cd $dirtinyxml2;
#rm -r klee-* && rm -r Pruebas;
#mkdir Pruebas;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 5 2> Pruebas/tinyxml2_prueba1.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 10 2> Pruebas/tinyxml2_prueba2.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 20 2> Pruebas/tinyxml2_prueba3.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 40 2> Pruebas/tinyxml2_prueba4.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 5 --sym-files 1 8 2> Pruebas/tinyxml2_prueba5.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 10 --sym-files 1 8 2> Pruebas/tinyxml2_prueba6.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 20 --sym-files 1 8 2> Pruebas/tinyxml2_prueba7.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 40 --sym-files 1 8 2> Pruebas/tinyxml2_prueba8.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 5 --sym-files 1 8 --sym-stdout 2> Pruebas/tinyxml2_prueba9.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 10 --sym-files 1 8 --sym-stdout 2> Pruebas/tinyxml2_prueba10.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 20 --sym-files 1 8 --sym-stdout 2> Pruebas/tinyxml2_prueba11.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./xmltest.bc --sym-args 0 5 40 --sym-files 1 8 --sym-stdout 2> Pruebas/tinyxml2_prueba12.txt;
#cp -r Pruebas ../../apuntesTFG/tinyxml2Program/;
#cp -r klee-* ../../apuntesTFG/tinyxml2Program/;
#exit;
#exec bash"

#OPENJPEG
diropenjpeg="/home/martin/Escritorio/openjpeg/build/bin/"
gnome-terminal -- bash -c "cd $diropenjpeg;
rm -r klee-* && rm -r Pruebas1;
mkdir Pruebas1;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 50 2> Pruebas1/openjpeg_prueba1_1.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 100 2> Pruebas1/openjpeg_prueba1_2.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 200 2> Pruebas1/openjpeg_prueba1_3.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 400 2> Pruebas1/openjpeg_prueba1_4.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 50 --sym-files 1 8 2> Pruebas1/openjpeg_prueba1_5.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 100 --sym-files 1 8 2> Pruebas1/openjpeg_prueba1_6.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 200 --sym-files 1 8 2> Pruebas1/openjpeg_prueba1_7.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 400 --sym-files 1 8 2> Pruebas1/openjpeg_prueba1_8.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 50 --sym-files 1 8 --sym-stdout 2> Pruebas1/openjpeg_prueba1_9.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 100 --sym-files 1 8 --sym-stdout 2> Pruebas1/openjpeg_prueba1_10.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 200 --sym-files 1 8 --sym-stdout 2> Pruebas1/openjpeg_prueba1_11.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-args 0 13 400 --sym-files 1 8 --sym-stdout 2> Pruebas1/openjpeg_prueba1_12.txt;
cp -r klee-* Pruebas1;
cp -r Pruebas1 ../../apuntesTFG/openjpegProgram/;
exit;
exec bash"

gnome-terminal -- bash -c "cd $diropenjpeg;
rm -r klee-* && rm -r Pruebas2;
mkdir Pruebas2;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 5 2> Pruebas2/openjpeg_prueba2_1.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 10 2> Pruebas2/openjpeg_prueba2_2.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 20 2> Pruebas2/openjpeg_prueba2_3.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 40 2> Pruebas2/openjpeg_prueba2_4.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 5 --sym-files 1 8 2> Pruebas2/openjpeg_prueba2_5.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 10 --sym-files 1 8 2> Pruebas2/openjpeg_prueba2_6.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 20 --sym-files 1 8 2> Pruebas2/openjpeg_prueba2_7.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 40 --sym-files 1 8 2> Pruebas2/openjpeg_prueba2_8.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 5 --sym-files 1 8 --sym-stdout 2> Pruebas2/openjpeg_prueba2_9.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 10 --sym-files 1 8 --sym-stdout 2> Pruebas2/openjpeg_prueba2_10.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 20 --sym-files 1 8 --sym-stdout 2> Pruebas2/openjpeg_prueba2_11.txt;
klee --warnings-only-to-file --only-output-states-covering-new --write-kqueries --optimize --libc=uclibc --posix-runtime ./opj_decompress.bc --sym-args 0 13 40 --sym-files 1 8 --sym-stdout 2> Pruebas2/openjpeg_prueba2_12.txt;
cp -r Pruebas2 ../../apuntesTFG/openjpegProgram/
cp -r klee-* ../../apuntesTFG/openjpegProgram/Pruebas2
exit;
exec bash"
