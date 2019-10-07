#include "headers_functions.h"

void init_stack(stack_t* pile){

    pile->top = -1;
}

int push_stack(stack_t * pile, int val){

    if(pile->top < MAX){
        pile->top = pile->top + 1;
        pile->tab[pile->top] = val;
        return 0;

    }
    return -1;


}

int pop_stack(stack_t * pile, int * val){
    if(pile->top >= 0){
        *val = pile->tab[pile->top];
        //printf("%d\n", val);

        pile->top = pile->top -1;
        return 0;
    }
    return -1;

}

int top_stack(stack_t * pile, int * val){
    if(pile->top != -1){
        *val = pile->tab[pile->top];
        return 0;
    }
    return -1;
}

void display_stack(stack_t * pile){
    int i;
    if(pile->top + 1 > 0){ // NULL casted in int is 0 then pile->top != NULL doesn't work
        for(i = 0; i < pile->top+1; i++){
            printf("<%d>\n", pile->tab[i]);
        }
    }else{
        printf("Stack empty \n");
    }

}
