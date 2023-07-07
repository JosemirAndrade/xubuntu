#!/bin/bash
icon="/usr/share/icons/icone.png"

selection=$(zenity --window-icon="$icon" --list --imagelist --print-column=2  \
--width=760 \
--height=400 \
--column="Opção" \
--column="Nome" \
--column="Categoria" \
--column="Descrição" \
--text="Selecione o programa que deseja instalar." \
--title="Instalacão de Programas adicionais" \
--ok-label="Instalar" \
--cancel-label="Sair" \
"/var/lib/app-info/seduc/diario.png"	"Diário"        "SEPLAG"        "Diário Oficial do Estado" \
"/var/lib/app-info/seduc/guardiao.png"	"Guardião"      "SEPLAG"        "Guardião :: Sistema de Controle de Acesso - Seplag" \
"/var/lib/app-info/seduc/sige.PNG"	"SIGE"          "SEDUC"         "Sistema de Gestão Escolar​" \
"/var/lib/app-info/seduc/sige.PNG"	"SIGE REMOTO"   "CREDE"         "Sistema de Gestão Escolar Remoto" \
"/var/lib/app-info/seduc/hp.png"	"Hp"		"Driver"	"Atualiza o HPLIP para a ultima versão disponível" \
"/var/lib/app-info/seduc/lenovo.png"	"Lenovo V310"	"Patch"		"Correção do Microfone para o Lenovo V310")

case "$selection" in
"Diário")/usr/local/Dados/scripts/diarioInstall.sh 2>/dev/null ;;
"Guardião")/usr/local/Dados/scripts/guardiaoInstall.sh 2>/dev/null ;;
"SIGE")/usr/local/Dados/scripts/sigeInstall.sh 2>/dev/null ;;
"SIGE REMOTO")/usr/local/Dados/scripts/sigeRemotoInstall.sh 2>/dev/null ;;
"Hp")/usr/local/Dados/scripts/hpDriver.sh 2>/dev/null ;;
"Lenovo V310")/usr/local/Dados/scripts/v310.sh 2>/dev/null ;;
esac
