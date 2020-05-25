#include <stdio.h>
#include "gestion_tableaux.h"

#define DIM1 3
#define DIM2 3

int main(void)
{
    int** mon_tab = NULL;

    afficher_tab2D(mon_tab, DIM1, DIM2);

    mon_tab = alloc_2D(DIM1, DIM2);
    alloc_2D_v2(mon_tab, DIM1, DIM2);
    saisir_tab2D(mon_tab, DIM1, DIM2);
    afficher_tab2D(mon_tab, DIM1, DIM2);

    desalloc_tab2D(&mon_tab,DIM1);

    afficher_tab2D(mon_tab, DIM1, DIM2);

    return 0;
}
