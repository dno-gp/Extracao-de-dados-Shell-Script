#!/bin/bash

########################
#PROGRAMA BOLSA FAMÍLIA#
########################

echo "Processo de extração de dados iniciado..."
echo "Beneficiários do Prgrama Bolsa Família."

#baixar arquivos
for x in $(cat periodo.txt)
do echo -e "\nExecutando download..."
   wget -c --show-progress  http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/${x}.zip

   echo -e "\nDescompactando arquivo..."
   unzip *.zip
   echo "Arquivo descompactado."

   touch auxiliar.txt

   echo -e "\nFiltrando arquivo..."
   for i in $(cat munics.txt)
   do grep -iw "$i" *.csv  > arq.txt
      cat arq.txt >> auxiliar.txt
   done

echo -e "\nRemovendo arquivos desnecessários..."
rm -vr *.csv
rm -vr arq.txt
done


echo -e "\nCriando arquivo com os resultados..."
grep -iw "pb" auxiliar.txt > beneficiarios.txt
echo "Arquivo com resultados criado."

rm -vr auxiliar.txt

echo -e "\nProcesso finalizado!"
