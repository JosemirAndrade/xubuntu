#!/bin/bash

sigeuser=$(zenity --entry --text "Digite o Usuário PADRÃO para o Sige Remoto\n\nExemplo: crede16remoto")

function sigeRemoto() {
tee /home/$USER/.sige.sh <<EOF
rdesktop -g 100% -u $sigeuser 172.20.11.135
EOF
chmod +x /home/$USER/.sige.sh
}

function sigeRemotoDesktop() {
tee /home/$USER/Área\ de\ Trabalho/SigeRemoto.desktop <<EOF
[Desktop Entry]
Type=Application
Terminal=false
Name[pt_BR]=Sige Remoto
name=Sige Remoto
Icon=/var/lib/app-info/seduc/sige.PNG
Exec=sh /home/$USER/.sige.sh
Categories=SEDUC;
EOF

tee /home/$USER/.local/share/applications/SigeRemoto.desktop <<EOF
[Desktop Entry]
Type=Application
Terminal=false
Name[pt_BR]=Sige Remoto
name=Sige Remoto
Icon=/var/lib/app-info/seduc/sige.PNG
Exec=sh /home/$USER/.sige.sh
Categories=SEDUC;
EOF

chmod +x /home/$USER/Área\ de\ Trabalho/SigeRemoto.desktop
chmod +x /home/$USER/.local/share/applications/SigeRemoto.desktop
}
sigeRemoto
sigeRemotoDesktop
