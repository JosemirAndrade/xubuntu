#!/bin/bash
cd /tmp

if [ ! -d hplip ]; then
	mkdir hplip
fi

if [ ! -f hplip.tar.gz ]; then
 wget --trust-server-names https://sourceforge.net/projects/hplip/files/latest/download -O hplip.tar.gz 2>&1 | sed -u 's/.* \([0-9]\+%\)\ \+\([0-9.]\+.\) \(.*\)/\1\n# Baixando a \2\/s, restam apenas \3/' | zenity --width=350 --progress --title="Baixando o HPLIP..." --auto-close --auto-kill
fi

tar -zxvf hplip.tar.gz -C hplip/ --strip-component=1
cd hplip
xterm ./hplip-install &
exit 0

