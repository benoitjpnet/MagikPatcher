#!/bin/bash
#MO-F Patcher v0.4
#Script pour patcher les mkv by Benpro pour la MO-F
#GPLv3. benpro82@gmail.com
#Last revision 02-06-11
echo "---MO-F patcher v0.4 pour Linux et MAC OS X, by Benpro---"
v1=""
v2=""
patch="patch.xdelta"
autoxtract=""

verifxd(){
	location=$(which xdelta3 2>/dev/null)
	if [ $? = 1 ]
	then
		echo "Attention pour que le patch fonctionne, tu dois avoir xdelta3 d'installé sur ton système !"
		get_release=$(lsb_release -i 2>/dev/null | grep Ubuntu )
		if [ $? = 0 ]
		then
			echo "Veux-tu que je te l'installe pour toi ?"
			echo "o/n"
			read choix
			if [ $choix = 'o' ]
			then
				echo "Installation de xdelta3 en cours ..."
				sudo aptitude install xdelta3
				echo "Fini :) Maintenant on va patcher"
				sleep 1
				mofpatch
			else
				echo "Il te faut donc installer manuellement xdelta3 :/"
				exit
			fi
		fi
                echo "Il te faut donc installer manuellement xdelta3 :/"
                exit
	fi
}
mofpatch(){
	v2exist=$(ls "$v2" 2>/dev/null)
	if [ $? = 0 ]
	then
		echo "Tu as déjà la v2 !"
	else
		echo "Patch en cours :)"
		"$location" -d -s "$v1" "$patch" "$v2"
		if [ $? = 0 ]
		then
			echo "Fini ! ENJOY =)"
			echo "Souhaites-tu que je suprimme la v1 ? (o/n)"
			read choix
			if [ $choix = 'o' ]
			then
				rm "$v1"
				echo "Et voilà plus de v1 :o"
			fi
		else
			echo "Y'a eu un blème ... Vérifie le nom de ta v1, il doit être :"
			echo "$v1"
		fi
	fi
	rm patch.xdelta
	rm linux_mac_mofpatcher.sh
	echo "Souhaites-tu que je m'auto-détruise ? (Autrement dit plus  de trace du script de patching :p)"
	echo "(o/n)"
	read choix
	if [ $choix = 'o' ]
	then
		rm $autoxtract
		echo "Done :)"
	fi
	echo "Voilà, il est temps d'apprécier la v2 :p"
	exit
}

verifxd
mofpatch
