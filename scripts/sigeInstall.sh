#!/bin/bash

ATALHO1=/home/$USER/Área\ de\ Trabalho/sige.desktop
ATALHO2=/home/$USER/.wine/drive_c/orant

#ATALHO1
function Asige() {
tee /home/$USER/Área\ de\ Trabalho/sige.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Name[pt_BR]=Sige SEDUC
name=Sige SEDUC
Icon=/var/lib/app-info/seduc/sige.PNG
Exec=wine64 /home/$USER/.wine/drive_c/orant/BIN/F50RUN32.EXE log_on logon/logon@prod
Categories=SEDUC;
EOF

tee /home/$USER/.local/share/applications/sige.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Name[pt_BR]=Sige SEDUC
name=Sige SEDUC
Icon=/var/lib/app-info/seduc/sige.PNG
Exec=wine64 /home/$USER/.wine/drive_c/orant/BIN/F50RUN32.EXE log_on logon/logon@prod
Categories=SEDUC;
EOF

chmod +x /home/$USER/.local/share/applications/sige.desktop
chmod +x /home/$USER/Área\ de\ Trabalho/sige.desktop
}

function regeditW() {
cd /home/$USER/.wine/drive_c/orant/regs
regedit *.reg
sleep 3
zenity --info --width=300 --text="Finalizado instalação, favor verificar."
}

#ATALHO2
function sige() {
winecfg &
sleep 10
pkill -f winecfg.exe

cp -pvrf /usr/local/Dados/apps/orant_work.tar.gz /home/$USER/.wine/drive_c/
mkdir /home/$USER/.wine/drive_c/PLANILHAS
cd /home/$USER/.wine/drive_c/
tar -zxvf orant_work.tar.gz
rm -rf orant_work.tar.gz
mv orant_work orant

cd /home/$USER/.wine/dosdevices/
ln -sf /mnt/sige5 ./o:
ln -sf /mnt/sige ./j:

if [ -d "/home/$USER/.wine/drive_c/orant/regs" ]; then
   regeditW
else
echo ""
fi

}

if [ -f "$ATALHO1" ]; then
echo ""
else
    Asige
fi

if [ -d "$ATALHO2" ]; then
echo ""
else
sige
fi
