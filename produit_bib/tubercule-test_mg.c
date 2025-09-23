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
        NBR=2;
        prod* tub = malloc((NBR+1)*sizeof(prod));

	strcy(tub->nom,OVY);
	tub[0].type=5;
	tub[0].sol[0]=10;
	tub[0].sol[1]=7;
	tub[0].sol[2]=11;
	tub[0].sais[0]=0;
	tub[0].mois[0]=3;
	tub[0].mois[1]=4;
	tub[0].mois[2]=9;
	tub[0].mois[3]=10;

	strcy(tub->nom,VOAMANGA);
	tub[1].type=5;
	tub[1].sol[0]=1;
	tub[1].sol[1]=3;
	tub[1].sol[2]=4;
	tub[1].sais[0]=2;
	tub[1].mois[0]=10;
	tub[1].mois[1]=11;
	tub[1].mois[2]=12;
	tub[1].mois[3]=2;
	tub[1].mois[4]=3;

	strcy(tub->nom,MANGAHAZO);
	tub[2].type=5;
	tub[2].sol[0]=1;
	tub[2].sol[1]=11;
	tub[2].sais[0]=2;
	tub[2].mois[0]=10;
	tub[2].mois[1]=11;
	tub[2].mois[2]=12;
	tub[2].mois[3]=3;
	tub[2].mois[4]=4;

	strcy(tub->nom,OVIALA);
	tub[3].type=5;
	tub[3].sol[0]=8;
	tub[3].sol[1]=7;
	tub[3].sais[0]=3;
	tub[3].mois[0]=10;
	tub[3].mois[1]=11;
	tub[3].mois[2]=12;

	strcy(tub->nom,SAONJO);
	tub[4].type=5;
	tub[4].sol[0]=2;
	tub[4].sol[1]=3;
	tub[4].sol[2]=5;
	tub[4].sais[0]=0;
	tub[4].mois[0]=11;
	tub[4].mois[1]=12;

	strcy(tub->nom,BETIRAVY);
	tub[5].type=5;
	tub[5].sol[0]=10;
	tub[5].sol[1]=4;
	tub[5].sais[0]=0;
	tub[5].mois[0]=3;
	tub[5].mois[1]=4;
	tub[5].mois[2]=5;
	tub[5].mois[3]=9;
	tub[5].mois[4]=10;
	tub[5].mois[5]=11;
	tub[5].mois[6]=12;

	strcy(tub->nom,KAROTY);
	tub[7].type=5;
	tub[7].sol[0]=10;
	tub[7].sol[1]=7;
	tub[7].sais[0]=5;
	tub[7].mois[0]=3;
	tub[7].mois[1]=4;
	tub[7].mois[2]=5;
	tub[7].mois[3]=9;
	tub[7].mois[4]=10;

	strcy(tub->nom,SAKAY);
	tub[5].type=5;
	tub[5].sol[0]=5;
	tub[5].sais[0]=8;
	tub[5].sais[1]=7;
	tub[5].mois[0]=3;

}
