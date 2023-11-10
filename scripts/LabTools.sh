#!/bin/bash




yad --image="/home/crede03/gov.png" --image-on-center --width=500 --heigth=500 --title="Suporte" --text="<span color=\'green\'><b> Qual setor será atendido? </b></span>" \
    --column="" --column= "" --button="CREDE":2 --button="ESCOLA":3 --button="FINANCEIRO":4 --button="SECRETARIA":5 --button="CEGAF":6




case $? in
    2) cr=$(yad --text="clicou em crede");;
    3) es=$(yad --text="clicou em escola") ;;
    4) cr=$(yad --text="clicou em financeiro");;
    5) es=$(yad --text="clicou em secretaria") ;;
    6) cr=$(yad --text="clicou em CEGAF");;
    
esac


#yad --list --checklist --column "Comprar" --column "Item" VERDADEIRAS Maçãs VERDADEIRAS Laranjas FALSAS Peras FALSAS Pasta de dente
