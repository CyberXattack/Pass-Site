#!/bin/bash
           echo "_____________________________"
           echo "|        Feito Por:         |"
           echo "|     Dimarinho Dinho       |"
           echo "|___________________________|"

if [ "$1" == "" ];
then
        echo "Analizador de Url"
        echo "Modo de Uso: ./scriptnet.sh globo.com"
else
        wget -q $1
        grep href index.html | cut -d "/" -f3 | grep "\." | cut -d '"' -f1 | sort -u | grep -v '<li' > lista
        for url in $(cat lista);do host -T $url | grep "has address" ;done
        rm lista
        rm index.html
fi

