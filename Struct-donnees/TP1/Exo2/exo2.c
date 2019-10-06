#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include "struct.h"
#include "manager_functions.h"



int main(){
    maillon_t *liste;
    maillon_t *node;
    int *x ;
    liste = init(liste);

    liste = ajouter_debut(liste, 5);

    afficher(liste, 0);
    liste = ajouter_debut(liste, 4);
    afficher(liste, 1);


    liste = ajouter_debut(liste, 3);
    liste = ajouter_debut(liste, 2);

    //afficher(liste);
    liste = ajouter_fin(liste, 6);
    //afficher(liste, 1);

    //liste = ajouter_fin(liste, 7);
    afficher(liste, 0);

    node = rechercher(liste, 7);
    if(node != NULL){
        printf("Found %d \n", node->x);
    }else{
        printf("Not found \n");
    }

    liste = supprimer_val(liste, 6);
    afficher(liste, 0);

    liste = supprimer_debut(liste, x);
    afficher(liste, 0);

    liste = supprimer_fin(liste,x);
    afficher(liste, 1);
    free_maillon(liste);

    afficher(liste, 1);

}
