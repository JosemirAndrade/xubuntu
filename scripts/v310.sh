#!/bin/bash 

## Configurando o Microfone Lenovo V310
pkexec bash -c 'if [ ! -f /etc/pulse/default.pa.bkp ]; then sudo cp /etc/pulse/default.pa /etc/pulse/default.pa.bkp; echo " ,# Fix Microfone mono Lenovo V310,load-module module-remap-source source_name=record_mono master=alsa_input.pci-0000_00_1f.3.analog-stereo master_channel_map=front-left channel_map=mono,set-default-source record_mono" | sed "s/,/\n/g" >> /etc/pulse/default.pa; else echo "Configuração já existe. Excluindo..."; sudo cp /etc/pulse/default.pa.bkp /etc/pulse/default.pa; sudo rm /etc/pulse/default.pa.bkp; fi'

if [ $? -eq 0 ]; then
    zenity --width=200 --info --text="Instação Concluida."
    else
        zenity --info --text="Instalação falhou!"
fi
