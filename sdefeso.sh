#!/bin/bash

echo -e Processo de extração de dados iniciado...
echo -e Beneficiários seguro defeso-pescador artesanal

#baixar arquivos
echo -e Executando downloads...
for x in $(cat periodo.txt)
do wget -c --show-progress  http://www.portaltransparencia.gov.br/download-de-dados/seguro-defeso/${x}.zip
done

#desconpactar arquivos
echo -e Descompactando arquivos baixados...
for i in $(ls *.zip)
do unzip  $i
done

#filtrar arquivos
echo -e Filtrando arquivos baixados...

touch auxiliar.txt

for i in $(ls *.csv)
do for x in $(cat munics.txt)
   do grep -iw "$x" $i > arq.txt
      cat arq.txt >> auxiliar.txt
   done
done

grep -iw 'pb' auxiliar.txt > sd-beneficiados.csv

echo -e Removendo arquivos desnescessários...
rm -vr arq.txt
rm -vr 201*
rm -vr auxiliar.txt

echo -e Processo finalizado.
