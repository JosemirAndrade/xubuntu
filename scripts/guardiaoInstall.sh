#!/bin/bash
function guardiao() {
tee /home/$USER/Área\ de\ Trabalho/Guardião.desktop <<EOF
[Desktop Entry]
Type=Application
Terminal=false
Name[pt_BR]=Guardião (Antigo)
name=Guardião (Antigo)
Icon=/var/lib/app-info/seduc/guardiao.png
Exec=/usr/lib/fire_fox/firefox https://web3.seplag.ce.gov.br
Categories=SEDUC;
EOF

tee /home/$USER/.local/share/applications/Guardião.desktop <<EOF
[Desktop Entry]
Type=Application
Terminal=false
Name[pt_BR]=Guardião (Antigo)
name=Guardião (Antigo)
Icon=/var/lib/app-info/seduc/guardiao.png
Exec=/usr/lib/fire_fox/firefox https://web3.seplag.ce.gov.br
Categories=SEDUC;
EOF

chmod +x /home/$USER/.local/share/applications/Guardião.desktop
chmod +x /home/$USER/Área\ de\ Trabalho/Guardi?o.desktop
}

guardiao
