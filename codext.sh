#!/bin/bash
echo -e "Processo iniciado.\n"

cd <diretório A>

###Descompactar arquivos zip###
echo "Descompactar arquivos .zip"

ls *.zip
echo " "
for x in $(ls *.zip)
do unzip $x
done

###converter codificação###

cd <diretório B> ; pwd

rm <arquivo> #Remover arquivos desnecessários

rename 's/a+//' *.csv #Renomear multiplos arquivos

echo "Converter codificação dos arquivos para UTF-8."

for x in $(ls *.csv)
do iconv -f ISO-8859-16 -t UTF-8 $x > _$x
done

rm -v p #Remover arquivos desnecessários

mv *.csv /<diretórios> #Mover multiplos arquivos csv

cd <diretório C> ; pwd

echo "Ajustando colunas dos arquivos"

for x in $(ls /<diretorio>/*.csv)
do  for i in $(cat arquivo.txt)
    do grep -iw "$i" $x > arq.csv
    cut -d ";" -f1,2,3,4,5,8,9,10,11,12,13,14,15,16,17,18,19 arq.csv >> "$i".csv

    done
done

rm -v arq.csv

echo "Processo finalizado."
