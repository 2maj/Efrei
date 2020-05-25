/*
 * Programme permettant de montrer que le code est dupliqué lors d'un fork
 * il y a donc deux instances de la variable globale qui n'est pas partagée
 * entre les deux processus (espace mémoire distinct).
 * 
 * */

#include <sys/types.h>	//pour le type pid_t (entier sur 32bits sur la plupart des UNIX
#include <unistd.h>		//pour le fork()
#include <stdio.h>		//perror() et printf()
#include <stdlib.h>		//pour utiliser le rand() => man 3 rand
#include <time.h>		//pour utiliser le time()

#define ITERATIONS 10

int var_globale = 10;

int mon_rand(int a, int b);

int main(int nbarg, char* argv[])
{
	pid_t num_id = 0;
	int i = 0;
	time_t seed;
	
	seed = time(NULL);
	srand(seed); //à ramener en "locale" dans le pere et le fils sinon on a toujours la meme suite
	
	printf("\nsrand=%d\n",(int)seed);
	printf("Valeur initiale de var_globale=%d\n",var_globale);
	
	//création d'un processus fils
	num_id = fork();
	printf("First %d", num_id);

	switch(num_id)
	{
		case -1 :	//le fork a échoué
					perror("le fork a echoue !");
					exit(EXIT_FAILURE);
				break;
				
		case 0 :	//code execute par le fils
					//seed = time(NULL);
					//seed = time(NULL) + getpid(); //pour être sûr d'avoir une seed différente
					//srand(seed);
					
					printf("\t [fils] PID < %d >, PPID <%d>\n",getpid(),getppid());
					printf("\t [fils] Valeur initiale de var_globale=%d\n",var_globale);
					printf("\t [fils] srand=%d\n",(int)seed);
					
					for(i=0;i<ITERATIONS;i++)
					{
						int alea = 0;
						var_globale *= 2;
						alea = mon_rand(10,1000);
						printf("\t [fils] <%d> : i=%d , var_globale=%d, alea=%d\n",getpid(),i,var_globale,alea);
						usleep(alea);
					}
					//exit(EXIT_SUCCESS); //commenter pour exécuter ce qui est après.
				break;
				
		default :	//code execute par le pere
					//usleep(1000000); //autre solution pour avoir une seed différente
					//seed = time(NULL);
					//seed = time(NULL) + getpid(); //solution préférable : on ajoute le PID
					//srand(seed);
					
					printf("\n[pere] PID < %d >, PPID <%d>, PID fils <%d>\n",getpid(),getppid(),num_id);
					printf("[pere] Valeur initiale de var_globale=%d\n",var_globale);
					printf("[pere] srand=%d\n",(int)seed);
					
					for(i=0;i<ITERATIONS;i++)
					{
						int alea = 0;
						var_globale += 5;
						alea = mon_rand(10,1000);
						printf("[pere] <%d> : i=%d , var_globale=%d, alea=%d\n",getpid(),i,var_globale,alea);
						usleep(alea);
					}
	}

	//code execute par les 2 processus
	printf("\n*** Fin du process <%d> avec a=%d ***\n\n",getpid(),var_globale);
	
	sleep(1); //sinon l'un des affichages peut se retrouver après le prompt !
	
	return 0;
}

int mon_rand(int a, int b)
{
	//on suppose que b>a !
	return ( rand()%(b-a) ) + a;
}