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
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 50 2> Pruebas/openjpeg_prueba1.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 100 2> Pruebas/openjpeg_prueba2.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 200 2> Pruebas/openjpeg_prueba3.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 400 2> Pruebas/openjpeg_prueba4.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 50 --sym-files 1 8 2> Pruebas/openjpeg_prueba5.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 100 --sym-files 1 8 2> Pruebas/openjpeg_prueba6.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 200 --sym-files 1 8 2> Pruebas/openjpeg_prueba7.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 400 --sym-files 1 8 2> Pruebas/openjpeg_prueba8.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 50 --sym-files 1 8 --sym-stdout 2> Pruebas/openjpeg_prueba9.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 100 --sym-files 1 8 --sym-stdout 2> Pruebas/openjpeg_prueba10.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 200 --sym-files 1 8 --sym-stdout 2> Pruebas/openjpeg_prueba11.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=libopenjp2.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./opj_compress.bc --sym-#args 0 13 400 --sym-files 1 8 --sym-stdout 2> Pruebas/openjpeg_prueba12.txt;
#cp -r klee-* Pruebas;
#cp -r Pruebas ../../repoTFGMNP/apuntesTFG/openjpegProgram/;
#exit;
#exec bash"






#LIBARCHIVE
#dirlibarchive="/home/martin/Escritorio/libarchive/build/bin/"
#gnome-terminal -- bash -c "cd $dirlibarchive;
#rm -r klee-* && rm -r Pruebas;
#mkdir Pruebas;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc --sym-stdin 1024 2> Pruebas/libarchive_prueba4.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc --sym-stdin 2048 2> Pruebas/libarchive_prueba5.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc --sym-stdin 4096 2> Pruebas/libarchive_prueba6.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc --sym-stdin 8192 2> Pruebas/libarchive_prueba7.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- noexiste 2> Pruebas/libarchive_prueba8.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- prueba.zip 2> Pruebas/libarchive_prueba9.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- prueba.sh 2> Pruebas/libarchive_prueba10.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- prueba.png 2> Pruebas/libarchive_prueba11.txt;
#klee --warnings-only-to-file --only-output-states-covering-new --external-calls=all --link-llvm-lib=../libarchive/libarchive.bca --write-kqueries --max-solver-time=30 --max-time=3600 --optimize --libc=uclibc --posix-runtime ./bsdcat.bc -- prueba 2> Pruebas/libarchive_prueba12.txt;
#cp -r klee-* Pruebas;
#cp -r Pruebas ../../../repoTFGMNP/apuntesTFG/libarchiveProgram/;
#exit;
#exec bash"
