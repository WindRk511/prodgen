#!/bin/bash

#typedef struct produit {
#	char nom[20];
#	int type;
#	int sol[4];
#	int sais[4];
#	int mois[12];
# prod;


#read -n "Entrer le nom du fichier" fichier
cp tubercule.c tubercule-test.c
fichier=tubercule-test.c

#recupère le variable de contient le nombre de produit disponible
n=$(grep "NBR=" tubercule.c | cut -d"=" -f2 | cut -d";" -f1)
n1=$(($n+1)) 	#incremente le

#changer le nombre de produit
sed -i s/NBR=${n}/NBR=${n1}/ $fichier

#suprime le accolade fermé
sed -i /"}"/d $fichier

### GENERATION DE NOUVEAU PRODUIT ###

#ajout de nouveau produit
read -p "Entrer le nom de produit en français : " p_nom_fr
read -p "Entrer leur nom en malagasy	     : " p_nom_mg
read -p "Entrer leur nom en malagasy          : " p_nom_en

#ajout leur type
echo "___Choisir le type de produit___"

p_type=$((-1))
while [[ ${p_type} -lt 0 ]] || [[ ${p_type} -gt 6 ]] || [[ ! "${p_type}" =~ ^[0-9]+$ ]]
do
	echo "1) Cereale"
	echo "2) Legumineux"
	echo "3) Fruit"
	echo "4) Legume"
	echo "5) Tubercule"
	echo "6) Racine"
	echo "0) INDEFINIT"
	read -n 2 -e -p "Entrer votre choix : " p_type

	if [[ $p_type -lt 0 ]] || [[ $p_type -gt 6 ]] || [[ ! "${p_type}" =~ ^[0-9]+$ ]]
	then
		echo -e "\e[31mCHOIX INCORRECT !!!\e[0m"
		echo -e "\nEntrer le numero de le type"
	fi
done	 

#ajout de type de sol
echo "___Choisir le sol compatible à ce culture___"

p_sol=$((-1))
#while [[ ${p_sol} -lt 0 ]] || [[ ${p_sol} -gt 4 ]] || [[ ! ${p_sol} =~ ^[0-9]+$ ]]
while (true)
do
	echo -e "\n"
	echo "1) Sol sableux"
	echo "2) Sol argileux"
	echo "3) Sol limoneux"
	echo "4)Sol humifère (ou organique)"
	echo "0) INDEFINIT"
	echo -n "Entrer votre choix "
	echo -ne "(NB:Si choix multiple,separer par virgule) : "
	read p_sol
	
	NSOL=$(echo $p_sol | tr ',' '\n' | wc -l)
	echo "le $NSOL"
	i=1
	t=1
	while [[ $i -le $NSOL ]]
	do
		ref=$(echo $p_sol | cut -d"," -f $i )
		if [[ $ref -lt 0 ]] || [[ $ref -gt 4 ]] || [[ ! $ref =~ ^[0-9]+$ ]]
		then
			echo "\e[31mCHOIX ${i} INCORRECT !!!\e[0m\n"
			echo "Rechoisir svp"
			echo "Choix le numero de le type"
			break
		fi
	
		if [[ $i -ge $NSOL ]]; then
			echo "le nombre de choix du type du sol est $NSOL"
			t=0
			break
		fi
		i=$((i+1))
	done
	if [[ $t -e 0 ]]; then
		break
	fi
done

#ajout le saison favorable
echo "___CHOISIR LE SAISON FAVORABLE___"
while (true)
do
	echo -e "\n"
	echo "1) froid" 
	echo "2) chaud" 
	echo "3) pluie" 
	echo "4) sec"
	echo "0) INDEFINIT"
	echo -n "Entrer votre choix "
	echo -ne "(NB:Si choix multiple,separer par virgule) : "
	read p_sais
	
	NSAIS=$(echo $p_sais | tr ',' '\n' | wc -l)
	i=1
	while [[ $i -le $SAIS ]]
	do
		ref=$(echo $p_sais | cut -d"," -f $i )
		if [[ $ref -lt 0 ]] || [[ $ref -gt 4 ]] || [[ ! "$ref" =~ ^[0-9]+$ ]]
		then
			echo "\e[31mCHOIX ${i} INCORRECT !!!\e[0m\n"
			echo "Rechoisir svp"
			echo "Choix le numero de le type"
			break
		fi
	
		if [[ $i -ge $NSAIS ]]; then
			echo "le nombre de choix du type du sol est $NSAIS"
			t=0
			break
		fi

		i=$((i+1))
	done
	if [[ $t -e 0 ]]; then
		break
	fi
done


