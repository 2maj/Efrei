#include <stdio.h>
#include <stdlib.h>
#define MAX 100
#include "struct.c"
#include "manager_functions.c"


int main() {
 stack_t p;
 init_stack(&p);
 push_stack(&p, 5);
 push_stack(&p, 6);
 push_stack(&p, 7);
 display_stack(&p);

 int val;
 pop_stack(&p, &val);
 printf("popped value = %d\n", val);
 display_stack(&p);
 return 0;
 }
