//
// Created by moussa_24 on 04/05/2020.
//
#include <stdio.h>
#include <stdlib.h>
#include "gestion_matrice.h"
#include "gestion_tableaux.h"
#include "my_struct.h"

t_matrice* init(t_matrice *mat){
    mat = (t_matrice*) malloc(sizeof(t_matrice*));
    printf("init ! \n");
    return mat;
}

void free_matrix(t_matrice *mat){
    desalloc_tab2D(&mat->tab, mat->l);
    free(mat);
    mat = NULL;
    printf("Matrix free ! \n");
    return;
}


t_matrice* scan_in_matrix(t_matrice *mat){
    if(mat == NULL){
        printf("Init your matrix! \n");
        return;
    }
    if(mat->c == NULL && mat->l == NULL){
        printf("Saisie ligne: ");
        scanf(" %d", &mat->l);
        printf("Saisie colonne: ");
        scanf(" %d", &mat->c);

    }
    alloc_2D_v2(&mat->tab, mat->l, mat->c);
    saisir_tab2D(mat->tab, mat->l, mat->c);
    return mat;
}

void display_matrix(t_matrice *mat){
    int l = mat->l, c= mat->c;
    if (l == NULL && c == NULL){
        printf("Init your matrix! \n");
        return;
    }
    afficher_tab2D(mat->tab, l, c);
}
