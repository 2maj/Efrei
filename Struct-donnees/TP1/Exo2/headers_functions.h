maillon_t* init(maillon_t *pliste);
maillon_t* ajouter_debut(maillon_t *pliste, int val);
maillon_t* ajouter_fin(maillon_t *pliste, int val);
maillon_t* rechercher(maillon_t *pliste, int val);
maillon_t* supprimer_debut (maillon_t *pliste, int*pval);
maillon_t* supprimer_val(maillon_t *pliste, int val);
void afficher(maillon_t *pliste, int progress);
maillon_t* supprimer_fin(maillon_t *pliste, int*pval);
void free_maillon(maillon_t *pliste);
