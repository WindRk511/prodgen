#!/bin/bash

file=$(ls | grep -v "push.sh" )
echo -n "Addition de depot dans le dossier courant"
git add $file
if [[ $? -e 0 ]]
then 
	echo -e "$VERT avec succes$DEFAUT"
else
	echo -e "$ROUGE echoué $DEFAUT"
git commit -m "ui"
git push -u origin master
