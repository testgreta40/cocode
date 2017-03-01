#!/bin/sh
# version 1

echo Mon premier script

# creer repertoire ex2 si il n'existe pas
[ ! -e ex2 ] && mkdir -p ex2 # ! non logique, -e existe

# entrer dans le repertoire ex2
cd ex2

#reinitialise le contenu du fichier
echo > ./auth-user.log

#recuperer les lignes correspondant a l'utilisateur courant dans /var/log/auth.log
#iterer sur chacune
sudo grep $USER /var/log/auth.log | while read ligne
do
	if echo $ligne | grep "opened"
		then
		#si Failed dans ligne, sortir avec un code 2
			exit 2
		else
		# sinon ajouter la ligne dans le fichier ./auth-user.log
			echo $ligne >> ./auth-user.log
	fi
done

sudo chown jf:jf ./auth-user.log
