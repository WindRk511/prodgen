#!/bin/bash
#	0		1		2	3		4    5	    6        7
## syntaxe gen_file [nom de fichier] [rang] [nom de produit] [type] [sol] [saison] [mois] 
gen_file () {
	#nom de produit
	echo -e "	strcy(tub[$2].nom,\"$3\");">>$1

	# type de produit
	echo -e "	tub[$2].type=$p_type;">>$1

	# type de sol favorable
        i=1
	n=$(echo $5 | tr ',' '\n' | wc -l)
        while [[ $i -le $n ]]
        do
                ref=$(echo $5 | cut -d"," -f $i )
                echo "	tub[$2].sol[$((i-1))]=$ref;">>$1
                i=$(($i+1))
        done

	# saison favorable
        i=1
	n=$(echo $6 | tr ',' '\n' | wc -l)
        while [[ $i -le $n ]]
        do
                ref=$(echo $6 | cut -d"," -f $i )
                echo -e "	tub[$2].sais[$((i-1))]=$ref;">>$1
                i=$(($i+1))
        done
	
	# mois favorable
        i=1
	n=$(echo $7 | tr ',' '\n' | wc -l)
        while [[ $i -le $n ]]
        do
                ref=$(echo $7 | cut -d"," -f $i )
                echo -e "	tub[$2].mois[$((i-1))]=$ref;">>$1
                i=$(($i+1))
        done
	echo -e "\n	return tub;\n}">>$1
}

# entete & base
#syntaxe : gen_entete [nom de fichier]
gen_entete () {
	echo -e "/**@file tubercule.c">$1
	echo "* @brief cette programme qui stock les information basique des tubercules">>$1
	echo "* @author Windrick">>$1
	echo "*/">>$1
	echo "#include prod.h">>$1
	echo "#include<stdio.h>">>$1
	echo "#include<stdlib.h>">>$1
	echo "#include<string.h>">>$1
	echo "">>$1
	echo "/** @fn cette fonction qui stock le donnée de $2">>$1
	echo "* @param void">>$1
	echo "* @return prod*">>$1
	echo "*/">>$1
	echo "prod* ${2}()">>$1
	echo "{">>$1
	echo "        int NBR;">>$1
	echo "        NBR=0;">>$1
	echo "        prod* tub = malloc((NBR+1)*sizeof(prod));">>$1
	echo "	for (int i=0; i<NBR; i++)">>$1
	echo "	{">>$1
	echo "		tub[i].ntp=NBR;">>$1
	echo "	}">>$1
	echo "">>$1
	echo -e "	return tub;\n}">>$1
}

