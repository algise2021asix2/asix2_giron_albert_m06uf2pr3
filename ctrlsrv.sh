#!/bin/bash
# ctrlsrv.sh

if [[ $EUID -ne 0 ]];
then
	echo "No tens permisos per executar l'script" 
	exit 1
fi

function mostra_serveis(){
	clear
	echo "Serveis disponibles:"
	echo "cups"
	echo "ssh"
	echo "apache2"
	echo -n "Selecciona un dels serveis: "
	read servei
}

function ctrl_servei(){
	clear
	case $servei in
		"cups")
			estat="$(systemctl is-active cups.service)"
			if [ "${estat}" = "active" ]
			then
				echo "El servei ja està activat"
			else
				sudo systemctl start cups.service
				echo "Servei iniciat"
				exit 0
			fi
			;;
			
		"ssh")
			estat="$(systemctl is-active ssh.service)"
			if [ "${estat}" = "active" ]
			then
				echo "El servei ja està activat"
			else
				sudo systemctl start ssh.service
				echo "Servei iniciat"
				exit 0
			fi
			;;
		
		"apache2")
			estat="$(systemctl is-active apache2.service)"
			if [ "${estat}" = "active" ]
			then
				echo "El servei ja està activat"
			else
				sudo systemctl start apache2.service
				echo "Servei iniciat"
				exit 0
			fi
			;;
		*)
			echo "Opció incorrecta"
			exit 1
	esac
}
mostra_serveis
ctrl_servei
exit 0
