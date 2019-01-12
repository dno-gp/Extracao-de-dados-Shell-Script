#!/bin/bash

########################
#PROGRAMA BOLSA FAMÍLIA#
########################

if [ -e /usr/bin/figlet ]; then

   figlet Programa
   figlet Bolsa Familia

fi

echo "Beneficiários do Prgrama Bolsa Família."
echo "Processo de extração de dados iniciado..."

#baixar arquivos
for x in $(cat periodo.txt)
do echo -e "\nExecutando download..."
   wget -c --show-progress  http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos/${x}.zip

   echo -e "\nDescompactando arquivo..."
   unzip $x.zip
   echo "Arquivo descompactado."

   touch auxiliar.txt

   echo -e "\nFiltrando dados do  arquivo..."
   for i in $(cat munics.txt)
   do grep -iw "$i" *.csv  > arq.txt
      cat arq.txt >> auxiliar.txt
   done

echo -e "\nRemovendo arquivos desnecessários..."
rm -vr *.csv
rm -vr arq.txt
done


echo -e "\nCriando arquivo com os resultados..."
grep -iw "pb" auxiliar.txt > beneficiarios2018.txt
echo "Arquivo com resultados criado."

echo -e "\nMovendo aquivos .zip..."
mv *.zip ./compactados/
mv beneficiarios2018.txt ./resultados/
echo -e "\nArquivos movidos."

echo -e "\nRemovendo auxiliar.txt..."
rm -vr auxiliar.txt

echo -e "\nProcesso finalizado!"
