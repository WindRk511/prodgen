#include<stdio.h>
#include<stdlib.h>
#ifndef PROD_H
#include"prod.h"
#endif

int main () {
	prod *pr;
	pr=tubercule();
	printf("Le nom de ce produit est %s\n",pr->nom);
	free(pr);
	return 0;
}
	
