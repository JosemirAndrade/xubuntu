
#!/bin/bash#!/bin/bash

zenity --info --width=200 --height=200 --text "<b><span color=\'black\'>OS SEGUINTES PROGRAMAS SERÃO ADICIONADOS</span></b>

<b>* </b> Google Chrome
<b>* </b> Mozilla Firefox
<b>* </b> LibreOffice
<b>* </b> Master PDF
<b>* </b> Reprodutor de Mídia
<b>* </b> Anydesk
<b>* </b> VNC Server
<b>* </b> Sige  Remoto
<b>* </b> Warsaw
<b>* </b> Impressoras
"
if [ $? -ne 0 ]; then
    zenity --width=180 --height=100 --info --text="<span color=\'red\'>O processo de configuração
do perfil foi cancelado.</span>"
exit
fi

pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY bash -c '(

#ATUALIZANDO OS PACOTES
apt update
echo "5" ; sleep 1

#INSTALANDO NAVEGADORES
apt install google-chrome-stable -y firefox firefox-locale-pt
echo "10" ; sleep 1

#INSTALANDO O PACOTE DE ESCRITÓRIO LIBREOOFICE
apt install libreoffice-l10n-pt-br
echo "15" ; sleep 1

# BAIXANDO E INSTALANDO O ANYDESK
wget https://download.anydesk.com/linux/anydesk_6.1.1-1_amd64.deb -O anydesk.deb 
echo "20" ; sleep 1
dpkg -i anydesk.deb
echo "25" ; sleep 1
apt-get install -f
echo "30" ; sleep 1
apt install ./anydesk.deb
echo "35" ; sleep 1

#INSTALANDO O EDITOR DE PDF MASTER PDF
wget https://code-industry.net/public/master-pdf-editor-5.9.50-qt5.9.x86_64.deb
echo "40"; sleep 1
apt install ./master-pdf-editor*.deb
echo "45" ; sleep 1
#ADICIONA A BIBLIOTECA LIBQT5 QUE FALTA PARA EXECUTAR O MASTER PDF
apt-get install libqt5concurrent5
echo "50" ; sleep 1
apt update
echo "55" ; sleep 1

#INSTALANDO REPRODUTOR DE MÍDIAS
apt install vlc -y
echo "60" ; sleep 1

#INSTALANDO SIGE REMOTO




) | zenity --progress --width=180 --height=100 --auto-close --no-cancel --title="Configuração de Perfil" --text="Preparando o dispositivo para uso" --percentage=2

'
if [ $? -ne 0 ]; then
    zenity --info --width=180 --height=100 --text="<span color=\'red\'>O processo de configuração
do perfil foi cancelado.</span>"
exit
fi

zenity --info --width=180 --height=100 --text="Configuração realizada com sucesso!"




