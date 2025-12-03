/**@file racine_mg.c
* @brief cette programme qui stock les information basique des tubercules
* @author Windrick
*/
#include "prod.h"
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/** @fn cette fonction qui stock le donnée de racine
* @param void
* @return prod*
*/
prod* racine()
{
        int NBR;
        NBR=2;
        prod* tub = malloc((NBR+1)*sizeof(prod));
	for (int i=0; i<NBR; i++)
	{
		tub[i].ntp=NBR;
	}

	strcpy(tub[0].nom,"KAROTY");
	tub[0].type=6;
	tub[0].sol[0]=10;
	tub[0].sol[1]=1;
	tub[0].sais[0]=2;
	tub[0].sais[1]=5;
	tub[0].mois[0]=3;
	tub[0].mois[1]=4;
	tub[0].mois[2]=5;
	tub[0].mois[3]=6;
	tub[0].mois[4]=7;

	strcpy(tub[1].nom,"PANAISY");
	tub[1].type=6;
	tub[1].sol[0]=4;
	tub[1].sais[0]=5;
	tub[1].mois[0]=3;
	tub[1].mois[1]=4;
	tub[1].mois[2]=5;

	strcpy(tub[2].nom,"ASELERA");
	tub[2].type=6;
	tub[2].sol[0]=8;
	tub[2].sais[0]=3;
	tub[2].sais[1]=5;
	tub[2].mois[0]=5;

	strcpy(tub[3].nom,"BETIRAVY");
	tub[3].type=6;
	tub[3].sol[0]=10;
	tub[3].sol[1]=8;
	tub[3].sais[0]=2;
	tub[3].sais[1]=3;
	tub[3].sais[2]=5;
	tub[3].mois[0]=4;
	tub[3].mois[1]=5;
	tub[3].mois[2]=6;

	strcpy(tub[4].nom,"RADISY");
	tub[4].type=6;
	tub[4].sol[0]=10;
	tub[4].sais[0]=1;
	tub[4].sais[1]=3;
	tub[4].sais[2]=5;
	tub[4].mois[0]=2;
	tub[4].mois[1]=3;
	tub[4].mois[2]=4;
	tub[4].mois[3]=5;
	tub[4].mois[4]=6;
	tub[4].mois[5]=7;

	strcpy(tub[5].nom,"NAVETY");
	tub[5].type=6;
	tub[5].sol[0]=6;
	tub[5].sais[0]=4;
	tub[5].mois[0]=2;
	tub[5].mois[1]=3;
	tub[5].mois[2]=5;

	strcpy(tub[6].nom,"NAVETY");
	tub[6].type=6;
	tub[6].sol[0]=6;
	tub[6].sais[0]=7;
	tub[6].sais[1]=4;
	tub[6].mois[0]=2;
	tub[6].mois[1]=3;
	tub[6].mois[2]=5;

	strcpy(tub[7].nom,"PERSILY");
	tub[7].type=6;
	tub[7].sol[0]=6;
	tub[7].sais[0]=10;
	tub[7].sais[1]=4;
	tub[7].mois[0]=5;

	return tub;
}
