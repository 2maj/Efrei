maillon_t* init(maillon_t *pliste){
    pliste = NULL;
    printf("list initialised \n");
    return pliste;
}

maillon_t* ajouter_debut(maillon_t *pliste, int val){
    maillon_t *current = pliste;
    maillon_t *p = (maillon_t *) malloc(sizeof(maillon_t));

    if ( p != NULL ){
        p->x = val;
        /* on définit les pointeurs du nouvel élément */
        if(pliste != NULL){
            current = pliste->prec;
            current->suiv = p;
            p->prec = current;
            pliste->prec = p;
            printf("Not null \n");
        }else{
            printf("list null \n");
            pliste = p;
            pliste->prec = pliste;
        }
        p->suiv = pliste;
    }
    return p;
}
maillon_t* ajouter_fin(maillon_t *pliste, int val){
    maillon_t *end = (maillon_t *) malloc(sizeof(maillon_t));
    end->x = val;

    maillon_t *pcurrent = pliste->suiv;

    // cas spécial : liste vide
    if (pliste == NULL){
        printf("Zero Elem \n");
        pliste = end;
        pliste->prec = pliste;
        end->suiv = pliste;
        return pliste;
    }
    if(pliste->suiv == pliste){ //elm p suiv == p 1 seul
        printf("One Elem \n");

        end->prec = pliste->prec; // pointer end sur le dernier maillon
        end->suiv = pliste;
        pliste->prec->suiv = end; // pointer le dernier maillon sur le maillon end
        pliste->prec = end;
        return pliste;
    }else{
        printf("More than One Elem \n");
        pcurrent = pliste->prec;//get le dernier maillon
        end->suiv = pcurrent->suiv;
        pcurrent->suiv = end; // pointer le dernier maillon sur le maillon end
        end->prec = pcurrent; // pointer end sur le dernier maillon

        pliste->prec = end; //pointer le prec de la head sur end
    }
}
maillon_t* rechercher(maillon_t *pliste, int val){
    maillon_t *pcurrent, *pnode=NULL;

    if(pliste == NULL){
        return pnode;
    }
    if(pliste->x == val){
        return pliste;
    }else{
        pcurrent = pliste->suiv;
        while(pcurrent != pliste){
            if(pcurrent->x == val){
                pnode=pcurrent;
                return pnode;
            }
            pcurrent = pcurrent->suiv;
        }

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
    pcurrent->prec = pliste->prec;
    free(pliste);
    return pcurrent;
}


maillon_t* supprimer_val(maillon_t *pliste, int val){
    maillon_t *pcurrent, *ppreview = NULL, *pnext = NULL;

    if(pliste == NULL){
        return pnext;
    }
    if(pliste->x == val){
        pcurrent = pliste;
        pliste = pcurrent->suiv;
        pliste->prec = pcurrent->prec;
        free(pcurrent);
        return pliste;
    }else{
        pcurrent = pliste->suiv;
        while(pcurrent != pliste){
            if(pcurrent->x == val){
                pnext = pcurrent->suiv;
                free(pcurrent);//libere l'espace
                ppreview->suiv = pnext;
                pnext->prec = ppreview;
            }
            ppreview = pcurrent;
            pcurrent = pcurrent->suiv;
        }
    }

    return pliste;
}

void afficher(maillon_t *pliste, int progress){
    maillon_t *p, *current;
    p = pliste;
    int i = 0;
    if(pliste != NULL){
        if(progress){
            printf("start ->");
            printf(" %d ->", p->x);
            current = p->suiv;
            while(p != current){
                printf(" %d ->", current->x);
                current = current->suiv;
            }
            printf(" end\n");
        }else{
            printf(" end <-");
            current = p->prec;
            printf(" %d <-", current->x);
            while(p != current){
                current = current->prec;
                printf(" %d <-", current->x);
            }

            printf(" start\n");

        }
    }else{
        printf("List empty\n");
    }


}


maillon_t* supprimer_fin(maillon_t *pliste, int*pval){
    maillon_t *end;

    if (pliste == NULL){
        return end;
    }
    maillon_t *pcurrent = pliste->prec;
    pliste->prec = pcurrent->prec;
    pcurrent->prec->suiv = pliste;
    free(pcurrent);

    return pliste;

}

void free_maillon(maillon_t *pliste){
    maillon_t *pfree, *pcurrent;
    //p = pliste;

    if(pliste != NULL){
        pcurrent = pliste->suiv;
        pfree = pcurrent;

        printf("start ->\n");
        while(pliste != pcurrent){
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


