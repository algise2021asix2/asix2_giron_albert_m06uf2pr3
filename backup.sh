#!/bin/bash
#backup.sh

echo -n "Escriu el nom del fitxer a copiar: "
read nom
echo -n "Escriu la ruta on es troba el fitxer: "
read ruta

if [[ ! -d $ruta ]]
then
	echo "Ruta inexistent, comprova-ho"
	exit 1
else
	if [[ ! -e $ruta/$nom ]]
	then
		echo "Nom del fitxer incorrecte o fitxer inexistent, comprova-ho"
		exit 1
	fi
fi
if [[ -d ~/FitxConfBackup ]]
then
	echo "La carpeta FitxConfBackup ja existeix"
else
	echo "Creant la carpeta FitxConfBackup"
	mkdir ~/FitxConfBackup
fi
if [[ -f ~/FitxConfBackup/$nom ]]
then
	echo "Sobreescribint el fitxer"
	cp "$ruta/$nom" ~/FitxConfBackup
else
	echo "Copiant l'arxiu"
	cp "$ruta/$nom" ~/FitxConfBackup
fi

exit 0
