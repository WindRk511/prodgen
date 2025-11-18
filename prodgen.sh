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
FILE_GEN="racine"
#read -n "Entrer le nom du fichier" fichier
#cp tubercule.c tubercule-test.c

source outil/gen_text.sh # fichier contenant de text à generer

if [[ ! -e "produit_bib" ]]
then
	mkdir "produit_bib"
fi 

for i in fr mg en
do
	fichier="produit_bib/${FILE_GEN}_$i.c"
	if [[ ! -e $fichier ]]
	then
		gen_entete $fichier
	fi
done

### CHOSIR LE NOM & L'AUTE CRITERE ###

#ajout de nouveau produit
read -p "Entrer le nom de produit en français : " p_nom_fr
read -p "Entrer leur nom en malagasy	     : " p_nom_mg
read -p "Entrer leur nom en anglais          : " p_nom_en

source outil/p_menu.sh	# fichier contient de menu
#ajout leur type

echo -e "$ORANGE"
echo -e "___Choisir le type de produit___$BLANC"

p_type=$((-1))
while [[ ${p_type} -lt 0 ]] || [[ ${p_type} -gt 6 ]] || [[ ! "${p_type}" =~ ^[0-9]+$ ]]
do
	mp_type		# menu de type
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
	mp_sol		# menu du sol
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
		if [[ $ref -lt 0 ]] || [[ $ref -gt 11 ]] || [[ ! $ref =~ ^[0-9]+$ ]]
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
	mp_saison	# menu du saison
	echo "0) INDEFINIT"
	echo -n "Entrer votre choix "
	echo -ne "(NB:Si choix multiple,separer par virgule) : "
	read p_sais
	
	NSAIS=$(echo $p_sais | tr ',' '\n' | wc -l)
	i=1
	t=1
	while [[ $i -le $NSAIS ]]
	do
		ref=$(echo $p_sais | cut -d"," -f $i )
		if [[ $ref -lt 0 ]] || [[ $ref -gt 5 ]] || [[ ! "$ref" =~ ^[0-9]+$ ]]
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
	mp_mois		# menu du mois
	echo -n "Entrer votre choix "
	echo -ne "(NB:Si choix multiple,separer par virgule) : "
	read p_mois
	
	NMOIS=$(echo $p_mois | tr ',' '\n' | wc -l)
	i=1
	t=1
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
source outil/affichage_conven.sh
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

#phrase de confirmation
while (true)
do
	read -p " Est ce que tout est correcte ? (oui/non) : " v
	if [[ $v == "oui" ]]
	then
		break
	elif [[ $v == "non" ]]
	then
		echo "processus annulé"
		exit 1
	fi
	echo -e "$ROUGE Veuiller reponde oui ou non $BLANC"
done

echo -e "==========================================================\n"

### GENERATION DE TEXT ###
echo -n "Generation de text ... "

#recupère le variable de contient le nombre de produit disponible
fichier="${FILE_GEN}_fr.c"
RANG=$(grep "NBR=" $fichier | cut -d"=" -f2 | cut -d";" -f1)
n=$(($RANG+1)) 	#incremente le

for i in fr mg en
do
	fichier="produit_bib/tubercule-test_$i.c"
	#changer le nombre de produit
	sed -i s/NBR=${RANG}/NBR=${n}/ $fichier

	#suprime le accolade fermé
	sed -i /"}"/d $fichier

	## ajout de produit
	case $i in
		fr) p_nom=$p_nom_fr ;;
		mg) p_nom=$p_nom_mg ;; 
		en) p_nom=$p_nom_en ;;
		*) ;;
	esac
	gen_file $fichier $RANG $p_nom $p_type $p_sol $p_sais $p_mois 
	echo -e "\n}">>$fichier

done

#signale de terminaison
sleep 0.5
if [[ $? -eq 0 ]]
then 
	echo -e "\e[42m succes$BLANC"
else
	echo -e "\e[41m failed$BLANC"
fi
