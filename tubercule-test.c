/**@file tubercule.c
 * @brief cette programme qui stock les information basique des tubercules
 * @author Windrick
 */
#include"prod.h"
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/** @fn cette fonction qui stock le donnée de tubercule
 * @param void
 * @return prod*
 */
prod* tubercule() 
{
	int NBR;
	NBR=7;
	prod* tub = malloc(NBR*sizeof(prod));

	strcpy(tub[0].nom,"Pomme de terre");
	tub[0].type = 6;
	tub[0].sol[0] = 0;
	tub[0].mois[3] = 1;
	tub[0].mois[0] = 2;
	tub[0].mois[1] = 3;
	tub[0].mois[1] = 4;
	tub[0].mois[1] = 5;
	tub[0].mois[1] = 10;
	tub[0].mois[1] = 11;
	tub[0].mois[2] = 12;
	tub[0].sais[0] = 1;
	tub[0].sais[0] = 2;

	strcpy(tub[1].nom,"Patate douce");
	tub[1].type = 1;
	tub[1].sol[1] = 2;
	tub[1].mois[0] = 1;
	tub[1].mois[1] = 2;
	tub[1].mois[2] = 3;
	tub[1].mois[3] = 4;
	tub[1].mois[4] = 5;
	tub[1].mois[5] = 6;
	tub[1].mois[6] = 11;
	tub[1].mois[7] = 12;
	tub[1].sais[0] = 0;


