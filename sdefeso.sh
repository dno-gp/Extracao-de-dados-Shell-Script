#!/bin/bash

#baixar arquivos

for x in $(cat periodo.txt)
do wget -c --show-progress  http://www.portaltransparencia.gov.br/download-de-dados/seguro-defeso/${x}.zip
done


#desconpactar arquivos
for i in $(ls *.zip)
do unzip  $i
done


#filtrar arquivos

touch auxiliar.csv

for i in $(ls *.csv)
do for x in $(cat munics.txt)
   do grep -wi "$x" $i > arq.csv
   cat arq.csv >> auxiliar.csv
   done
done

grep -w "PB" auxiliar.csv > beneficiaos.csv

echo -e Removendo arquivos...
rm -v auxiliar.csv
rm -v arq.csv
rm -v 201*


echo -e Processo finalizado.
