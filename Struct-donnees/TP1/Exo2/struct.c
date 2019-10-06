typedef struct maillon{
    int x;
    struct maillon *prec;
    struct maillon *suiv;
} maillon_t;
