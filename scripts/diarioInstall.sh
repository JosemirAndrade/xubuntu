#!/bin/bash
function diario() {
tee /home/$USER/Área\ de\ Trabalho/Diário.desktop <<EOF
[Desktop Entry]
Type=Application
Terminal=false
Name[pt_BR]=Diário Oficial (Antigo)
name=Diário Oficial (Antigo)
Icon=/var/lib/app-info/seduc/diario.png
Exec=firefox http://pesquisa.doe.seplag.ce.gov.br
Categories=SEDUC;
EOF

tee /home/$USER/.local/share/applications/Diário.desktop <<EOF
[Desktop Entry]
Type=Application
Terminal=false
Name[pt_BR]=Diário Oficial (Antigo)
name=Diário Oficial (Antigo)
Icon=/var/lib/app-info/seduc/diario.png
Exec=firefox http://pesquisa.doe.seplag.ce.gov.br
Categories=SEDUC;
EOF

chmod +x /home/$USER/Área\ de\ Trabalho/Di?rio.desktop
chmod +x /home/$USER/.local/share/applications/Di?rio.desktop

}

diario
