#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <pthread.h>
#include <unistd.h>
int N;

int main() {
    printf("Entrez le nombre de threads : ");
	scanf("%d",&N);
    pthread_t barrier_thread, my_threads[N];

    //création des threads
	pthread_create(&barrier_thread, NULL, (void *) parent, NULL);

//	for(int i=0; i<N; i++){
//        rangs[i]=i+1;
//		pthread_create(&o[i], NULL, (void *) oisillon, (void *) &rangs[i]);
//	}
    return 0;
}


/*

 #include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <pthread.h>
#include <unistd.h>

int N, F, nb_portions;
sem_t mange;
sem_t reveil;

//fonction de l'oisillon qui prend la sémophore, mange, puis la libère
//aprés avoir mangé, l'oisillon vérifie si le nombre de portions restantes n'est pas égale à 0, si oui, il prévient l'oiseau parent.
void *oisillon(void *args){
    int num = *((int *) args);
	while(1){
		sem_wait(&mange);
		nb_portions--;
		printf("L'oisillon %d mange ...\n", num);
		if(nb_portions == 0){
			sem_post(&reveil);
            sleep(3);
		}
		sem_post(&mange);
        sleep(3);
	}
}

//fonction du parent qui se fait "réveiller" par un oisillon pour remettre les portions au nombre souhaité.
void *parent(void *args){
	while(1){
		sem_wait(&reveil);
		nb_portions = F;
		printf("Le plat a ete rempli !\n\n");
	}
}

int main(){
	printf("Entrez le nombre d'oisillons : ");
	scanf("%d",&N);
	pthread_t p, o[N];
    int rangs[N];
	printf("Entrez le nombre de portions : ");
	scanf("%d",&F);
    nb_portions = F;
	sem_init(&mange, 0, 1);
	sem_init(&reveil, 0, 0);


    //création des threads
	pthread_create(&p, NULL, (void *) parent, NULL);

	for(int i=0; i<N; i++){
        rangs[i]=i+1;
		pthread_create(&o[i], NULL, (void *) oisillon, (void *) &rangs[i]);
	}
	while(1){
	}
}

 */
