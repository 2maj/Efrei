#include <stdlib.h>
#include <stdio.h>
#include "struct.c"
#include "manager_functions.c"

int main(){
    maillon_t *liste;
    maillon_t *node;
    int *x ;
    liste = NULL;
    liste = ajouter_debut(liste, 5);
    //afficher(liste);
    liste = ajouter_debut(liste, 6);
    liste = ajouter_debut(liste, 4);
    //afficher(liste);
    liste = ajouter_fin(liste, 8);
    liste = ajouter_fin(liste, 9);
    afficher(liste);
    node = rechercher(liste, 5);
    if(node != NULL){
        printf("Found %d \n", node->x);
    }else{
        printf("Not found \n");
    }
    liste = supprimer_val(liste, 7);
    liste = supprimer_debut(liste, x);
    //afficher(liste);
    liste = supprimer_fin(liste,x);
    afficher(liste);
    free_maillon(liste);
    afficher(liste);
    return 0;
}
