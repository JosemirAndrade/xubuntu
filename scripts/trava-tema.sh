#!/bin/bash
### Script para previnir mudanças na aparecia e papel de parede da solução da seduc.
### Verificar o tema-install.sh para iniciar o boot
### Desenvolvido por Carlos Renê - CREDE16
### Versão 0.1
## Change Log
# 0.1 - Versao inicial
set -x 

UHOME="/home"
#FILE="/etc/xdg/xdg-xubuntu/xfce4/panel/default.xml"
#FILE2="/etc/xdg/xdg-xubuntu/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml"
 # Pega a lista de usuario do sistema
_USERS="$(awk -F':' '{ if ( $3 >= 1000 ) print $1 }' /etc/passwd)"
for u in $_USERS
do
   _dir="${UHOME}/${u}/.config"
   if [ -d "$_dir" ]
   then
#      /bin/cp -r "$FILE" "$_dir/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"
#      /bin/cp -r "$FILE2" "$_dir/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml"
      chown $(id -un $u):$(id -gn $u) "$_dir"
   fi
done
