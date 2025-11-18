#!/bin/bash

VERT="\e[42m"
ROUGE="\e[41m"
DEFAUT="\e[0m"

function verfication ()
{
	if [[ $? -eq 0 ]]
	then 
		echo -e "$VERT avec succes$DEFAUT\n"
	else
		echo -e "$ROUGE echoué $DEFAUT\n"
		echo "L'execution interrompu"
		exit
	fi
}

echo "=================================================================================================="
echo -e "\e[1mSTATUS ACTUEL :$DEFAUT"
git status
echo -e "==================================================================================================\n"
echo "Addition de depot dans le dossier courant ..."
git add .
git rm --cached $0
verfication
echo "Ajout de commit ..."
git commit -m "v0"
verfication
echo "Pousser vers github ..."
git push 
verfication
