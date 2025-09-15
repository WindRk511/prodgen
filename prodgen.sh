#!/bin/bash
##
#typedef struct produit {
#	char nom[20];
#	int type;
#	int sol[4];
#	int sais[4];
#	int mois[12];
# prod;


#couleur
ROUGE="\e[31m"
VERT="\e[32m"
ORANGE="\e[33m"
BLANC="\e[0m"

#read -n "Entrer le nom du fichier" fichier
cp tubercule.c tubercule-test.c
fichier=tubercule-test.c

#recupère le variable de contient le nombre de produit disponible
n=$(grep "NBR=" tubercule.c | cut -d"=" -f2 | cut -d";" -f1)
RANG=$(($n+1)) 	#incremente le

#changer le nombre de produit
sed -i s/NBR=${n}/NBR=${RANG}/ $fichier

#suprime le accolade fermé
sed -i /"}"/d $fichier

### GENERATION DE NOUVEAU PRODUIT ###

#ajout de nouveau produit
read -p "Entrer le nom de produit en français : " p_nom_fr
read -p "Entrer leur nom en malagasy	     : " p_nom_mg
read -p "Entrer leur nom en anglais          : " p_nom_en

source p_menu.sh
#ajout leur type

echo -e "$ORANGE"
echo -e "___Choisir le type de produit___$BLANC"

p_type=$((-1))
while [[ ${p_type} -lt 0 ]] || [[ ${p_type} -gt 6 ]] || [[ ! "${p_type}" =~ ^[0-9]+$ ]]
do
	mp_type
	read -n 2 -e -p "Entrer votre choix : " p_type

	if [[ $p_type -lt 0 ]] || [[ $p_type -gt 6 ]] || [[ ! "${p_type}" =~ ^[0-9]+$ ]]
	then
		echo -e "\e[31mCHOIX INCORRECT !!!\e[0m"
		echo -e "\nEntrer le numero de le type"
	fi
done	 

#ajout de type de sol
echo -e "$ORANGE"
echo -e "___Choisir le sol compatible à ce culture___$BLANC"

p_sol=$((-1))
while (true)
do
	mp_sol
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
			echo -e "\e[31mCHOIX ${i} INCORRECT !!!\e[0m\n"
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
	if [[ $t -eq 0 ]]; then
		break
	fi
done

#ajout le saison favorable
echo -e "$ORANGE"
echo -e "___CHOISIR LE SAISON FAVORABLE___$BLANC"
while (true)
do
	mp_saison
	echo "0) INDEFINIT"
	echo -n "Entrer votre choix "
	echo -ne "(NB:Si choix multiple,separer par virgule) : "
	read p_sais
	
	NSAIS=$(echo $p_sais | tr ',' '\n' | wc -l)
	i=1
	while [[ $i -le $NSAIS ]]
	do
		ref=$(echo $p_sais | cut -d"," -f $i )
		if [[ $ref -lt 0 ]] || [[ $ref -gt 4 ]] || [[ ! "$ref" =~ ^[0-9]+$ ]]
		then
			echo -e "\e[31mCHOIX ${i} INCORRECT !!!\e[0m\n"
			echo "Rechoisir svp"
			echo "Choix le numero"
			break
		fi
	
		if [[ $i -ge $NSAIS ]]; then
			echo "le nombre de choix du type du sol est $NSAIS"
			t=0
			break
		fi

		i=$((i+1))
	done
	if [[ $t -eq 0 ]]; then
		break
	fi
done

#ajout mois favorable
echo -e "$ORANGE"
echo -e "___CHOISIR Le/LES MOIS___$BLANC"

while (true)
do
	mp_mois
	echo -n "Entrer votre choix "
	echo -ne "(NB:Si choix multiple,separer par virgule) : "
	read p_mois
	
	NMOIS=$(echo $p_mois | tr ',' '\n' | wc -l)
	i=1
	while [[ $i -le $NMOIS ]]
	do
		ref=$(echo $p_mois | cut -d"," -f $i )
		if [[ $ref -lt 1 ]] || [[ $ref -gt 12 ]] || [[ ! "$ref" =~ ^[0-9]+$ ]]
		then
			echo -e "\e[31mCHOIX ${i} INCORRECT !!!\e[0m\n"
			echo "Rechoisir svp"
			echo "Choix le numero "
			break
		fi
	
		if [[ $i -ge $NMOIS ]]; then
			t=0
			break
		fi

		i=$((i+1))
	done
	if [[ $t -eq 0 ]]; then
		break
	fi
done

#**verfiacation de choix
source affichage_conven.sh
echo -e "\n=========================================================="
echo -e "\n\e[2mVERFICATION DE CHOIX\e[0m" 
echo "NOM: $p_nom_fr | $p_nom_mg | $p_nom_en"

#type de produit
echo -n "TYPE:"
conv_ptype $p_type

#sol favorable
		echo ""
echo -n "SOL: "
i=1
while [[ $i -le $NSOL ]]
do
	ref=$(echo $p_sol | cut -d"," -f $i )
	conv_psol $ref
	i=$(($i+1))
done

#saison favorable
echo ""
echo -n "SAISON: "
i=1
while [[ $i -le $NSAIS ]]
do
	ref=$(echo $p_sais | cut -d"," -f $i )
	conv_psaison $ref
	i=$(($i+1))
done

#mois favorable
echo ""
echo -n "MOIS :"
	i=1
	while [[ $i -le $NMOIS ]]
	do
		ref=$(echo $p_mois | cut -d"," -f $i )
		conv_pmois $ref
		i=$(($i+1))
	done

echo ""
while (true)
do
	read -p " Est ce que tout est correcte ? (oui/non) : " v
	if [[ $v == "oui" ]]
	then
		break
	elif [[ $v == "non" ]]
	then
		echo "Le programme s'arretté"
		exit 1
	fi
	echo -e "$ROUGE Veuiller reponde oui ou non $BLANC"
done

echo -e "==========================================================\n"

## generation de text
echo -n "Generation de text ... "
#pour langue fr

#nom de produit
echo -e "		strcy(tub->nom,$p_nom_fr)\;">>tubercule-test.c
#echo "		strcy(tub[$RANG].nom,$p_nom_mg)\;">>tubercule-test.c
#echo "		strcy(tub[$RANG].nom,$p_nom_en)\;">>tubercule-test.c

# type de produit
echo -e "	tub[$RANG].type=$p_type\;">>tubercule-test.c

# type de sol favorable
	i=1
	while [[ $i -le $NSOL ]]
	do
		ref=$(echo $p_sol | cut -d"," -f $i )
		echo "	tub[$RANG].sol[$((i-1))]=$ref\;">>tubercule-test.c
		i=$(($i+1))
	done

# saison favorable
	i=1
	while [[ $i -le $NSAIS ]]
	do
		ref=$(echo $p_sais | cut -d"," -f $i )
		echo -e "	tub[$RANG].sol[$((i-1))]=$ref\;">>tubercule-test.c
		i=$(($i+1))
	done
# mois favorable
 	i=1
	while [[ $i -le $NMOIS ]]
	do
		ref=$(echo $p_mois | cut -d"," -f $i )
		echo -e "	tub[$RANG].sol[$((i-1))]=$ref\;">>tubercule-test.c
		i=$(($i+1))
	done

echo -e "\n}">>tubercule-test.c

#signale de terminaison
if [[ $? -eq 0 ]]
then 
	echo -e "\e[42m succes$BLANC"
else
	echo -e "\e[41m failed$BLANC"
fi
