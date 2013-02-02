#!/bin/bash
#############################
##MagikPatch				#
##Script Bash by Benpro     #
##Mail : benpro82@gmail.com #
##Version : 0.1		    	#
##Last Revision : 23/01/11  #
##Licence : GPLv3	    	#
#############################
v1=$1
v2=$2
namepatch="$3"
patch="patch.xdelta"
sysdir="/home/SI_1000/Enco/Softs/patchs"

verif()
{
	if [ -z "$v1" -o -z "$v2" -o -z "$namepatch" ]
	then
		echo "Erreur, paramètre incorrecte !"
		echo "$0 fichierv1 fichierv2 nompatch"
		exit
	fi
}
createPatch()
{
	mkdir tmpPatch
	cd tmpPatch
	xdelta3 -es ../$v1 ../$v2 $patch
}

createLinuxPatch()
{
	cp ${sysdir}/linux_mac_mofpatcher.sh ./
	sed -e 's/v1=\"\"/v1=\"'$v1'\"/' -e 's/v2=\"\"/v2=\"'$v2'\"/' -e 's/autoxtract=\"\"/autoxtract=\"'${namepatch}.sh'\"/' linux_mac_mofpatcher.sh > a
	mv a linux_mac_mofpatcher.sh
	chmod +x linux_mac_mofpatcher.sh
	makeself --notemp ./ "${namepatch}.sh" "MO-F patch" ./linux_mac_mofpatcher.sh
	cp ${sysdir}/readme_linux.txt readme.txt
	zip "${namepatch}_linux.zip" readme.txt "${namepatch}.sh"
}

createWindaubePatch()
{
	cp ${sysdir}/autodelta.exe ${namepatch}.exe
	wine ${sysdir}/deltainjector.exe ${namepatch}.exe ${sysdir}/xdelta3.0u.x86-32.exe $patch
	cp ${sysdir}/readme_win.txt readme.txt
	sed 's/originalfile/'$v1'/' readme.txt > a
	mv a readme.txt
	zip "${namepatch}_windows.zip" readme.txt "${namepatch}.exe"
}

mvPatchs()
{
	mv *.zip ../
	cd ..
	rm -rf tmpPatch
}

verif
createPatch
createLinuxPatch
createWindaubePatch
mvPatchs