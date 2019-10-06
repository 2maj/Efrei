#include "headers_functions.h";

maillon_t* ajouter_debut(maillon_t *pliste, int val){
    maillon_t *p = (maillon_t *) malloc(sizeof(maillon_t));
    p->x = val;
    p->suiv = pliste;
    return p;
}
maillon_t* ajouter_fin(maillon_t *pliste, int val){
    maillon_t *end=(maillon_t *) malloc(sizeof(maillon_t));
    end->x = val;
    end->suiv = NULL;

    maillon_t *pcurrent = pliste;

    // cas spécial : liste vide
    if (pliste == NULL){
        return end;
    }

    while (pcurrent != NULL) { // tant que liste pas vide

        if (pcurrent->suiv == NULL) { // arrivé au dernier maillon
          pcurrent->suiv = end;
          return pliste;
        }

        pcurrent = pcurrent->suiv;
    }
}
maillon_t* rechercher(maillon_t *pliste, int val){
    maillon_t *pcurrent, *pnode=NULL;
    if(pliste == NULL){
        return pnode;
    }
    pcurrent = pliste;
    while(pcurrent !=NULL){
        if(pcurrent->x == val){
            pnode=pcurrent;
            return pnode;
        }
        pcurrent = pcurrent->suiv;
    }
    return pnode;
}

maillon_t* supprimer_debut (maillon_t *pliste, int*pval){
    maillon_t*pcurrent;
    if(pliste == NULL){
        return pcurrent;
    }
    pval = pliste->x;
    pcurrent = pliste->suiv;
    free(pliste); //liberation de l'espace
    //printf("%d", pval);
    return pcurrent;
}


maillon_t* supprimer_val(maillon_t *pliste, int val){
    maillon_t *pcurrent, *ppreview=NULL, *pnext=NULL;
    if(pliste == NULL){
        return pnext;
    }
    pcurrent = pliste;

    while(pcurrent !=NULL){
        if(pcurrent->x == val){
            pnext = pcurrent->suiv;
            free(pcurrent);//liberation de l'espace
            ppreview->suiv = pnext;
            return pliste;
        }
        ppreview = pcurrent;
        pcurrent = pcurrent->suiv;
    }
    return pliste;
}

void afficher(maillon_t *pliste){
    maillon_t *p;
    p = pliste;
    //printf("Ici");
    while(p!= NULL){
        printf("%d ->", p->x);
        p = p->suiv;
    }
    printf("end\n");
}


maillon_t* supprimer_fin(maillon_t *pliste, int*pval){
    maillon_t *end;
    maillon_t *pcurrent = pliste;

    if (pliste == NULL){
        return end;
    }

    while (pcurrent != NULL) { // tant que liste pas vide
        pcurrent = pcurrent->suiv;
        if (pcurrent->suiv == NULL) { // arrivé au dernier maillon
            return supprimer_val(pliste, pcurrent->x);
        }
    }
}
void free_maillon(maillon_t *pliste){
    maillon_t *pfree, *pcurrent;
    //p = pliste;

    if(pliste != NULL){
        pcurrent = pliste->suiv;
        pfree = pcurrent;

        printf("start ->\n");
        while(pcurrent != NULL){
            pcurrent = pcurrent->suiv;
            free(pfree);
            printf(" free ->");
            pfree = pcurrent;
        }
         free(pliste);
        printf("end \n");
    }else{
        printf("List empty\n");
    }
}
