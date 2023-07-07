#!/bin/bash

status=$(/opt/pbis/bin/get-status | grep "Status:" | tail -n 1 | awk '{print $2}')

mudarWallpaper(){

dominio=$(/opt/pbis/bin/get-status | grep "Forest name:" | awk '{print $3}' | head -n 1)

case "$dominio" in

seduc.ce.gov.br)

if [ -f $HOME/.local/.netlogon/AvisoTela.jpg ]; then
 cp -pvrf $HOME/.local/.netlogon/AvisoTela.jpg /usr/local/Dados/wallpaper/
 rm -rf $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
else
 echo "nao encontrado papel de parede!"
fi

;;
escola.seduc)
echo "dominio: $dominio"
;;
*)
echo "Não faz parte dos nossos domínios"
;;
esac
}

if [ $status == Online ]; then
 mudarWallpaper
else
 echo "Nao faz parte do dominio"
fi

