/*
 *  file.h
 *
 *  Funcoes que tratam do historico
 *
 *  2006-03-10: created by
 *      Mario Ulisses Pires Araujo Costa        (43175)
 *      Nuno Andre Veloso Matias                (44229)
 *      Vasco Miguel Borges de Almeida Ferreira (43207)
 *
 *  UM - LESI - DI
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "file.h"

#define X printf("%s - %d\n",__FILE__, __LINE__)

ComList * init_hist()
{
	ComList * ret_pointer;
	ret_pointer = NULL;
	return ret_pointer;
}

void free_comlist (ComList*ret_pointer)
{
	ComList *aux; 
	
	if (ret_pointer == NULL)
		return;
	aux = ret_pointer;
	while (ret_pointer != NULL)
	{
		aux=ret_pointer->next;
		free(ret_pointer);
		ret_pointer = aux;
	}
	return;
}

ComList * historico (ComList * ret_pointer, char *input)
{
	ComList * aux = (ComList *)malloc(sizeof(ComList));
	ComList * aux1;
	
	if (ret_pointer == NULL)
	{
		ret_pointer = aux;
		strcpy(ret_pointer->teclado,input);
		ret_pointer->next = NULL;
		
		return ret_pointer;
	}
	else
	{
		ComList * ajudo;
		
		ajudo = ret_pointer;
		aux1 = ajudo;
		while (ajudo != NULL)
		{
			aux1 = ajudo;
			ajudo=ajudo->next;
		}
		aux1->next = aux;
		strcpy(aux->teclado,input);
		aux->next=NULL;
	
	return ret_pointer;
	}
}

int savecomlist(char *ficheiro, ComList * ret_pointer)
{
	if (ret_pointer == NULL)
		return -1;
	
	ComList * aux;
	FILE *f;
	char *comando;
	char mfv[100]="";
	strcat(mfv,ficheiro);
	strcat(mfv,".mfv");
	
	f = fopen (mfv,"a");
	sscanf(ret_pointer->teclado," %s",comando);
	
	if (strcasecmp(comando,"dim")==0)
	{	
		aux = ret_pointer;
		while (aux != NULL)
		{
			fprintf(f,"%s\n",aux->teclado);
			aux=aux->next;
		}
	}
	fclose(f);
	return 0;
}

Retorno * init_retorno()
{
	Retorno * com_pointer;
	com_pointer = NULL;
	return com_pointer;
}

void free_retorno (Retorno *com_pointer)
{
	Retorno *aux; 
	
	if (com_pointer == NULL)
		return;
	aux = com_pointer;
	while (com_pointer != NULL)
	{
		aux=com_pointer->next;
		free(com_pointer->comando);
		free(com_pointer);
		com_pointer = aux;
	}
	return;
}


Retorno *comandos(char *fich, Retorno *com_pointer)
{
	FILE *f = fopen(fich,"r");
	Retorno *aux;
	aux = (Retorno *) malloc(sizeof(Retorno));
	aux->comando = (char *) calloc(100,sizeof(char));
	
	while (fscanf(f,"%[^\n]%*c", aux->comando) != EOF)
	{
		if (com_pointer == NULL)
		{
			aux->next=NULL;
			com_pointer = aux;
		}
		else
		{
			Retorno * ant, *auxiliar;
			ant = com_pointer;
			auxiliar = com_pointer->next;
			
			while (auxiliar != NULL)
			{
				ant = auxiliar;
				auxiliar = auxiliar->next; 
			}
			
			ant->next=aux;
			aux->next = NULL;
		}
		aux = (Retorno *) malloc (sizeof(Retorno));
		aux->comando = (char *) calloc(100,sizeof(char));
	}
	fclose(f);
	return com_pointer;
}

void imprime_retorno (Retorno * com_pointer)
{
	Retorno * aux;
	aux = com_pointer;

	while (aux != NULL)
	{
		printf("%s\n",aux->comando);
		aux= aux->next;
	}
}

int saveobj (char *id,char *ficheiro, Id_list *list_pointer)
{
	char *mfv = (char *) calloc(strlen(ficheiro)+5,sizeof(char));
	int ret=0;
	Id_list *aux = list_pointer;
	FILE *f;
	
	mfv = strcat(strcpy(mfv,ficheiro),".mfv");
	
	if((f = fopen(mfv,"a")) == NULL)
		ret = 1;
	for( ; strcmp(aux->id,id)!=0 ; aux=aux->next);
	if (aux->next_group == NULL)
		fprintf(f,"%s\n",aux->comando);
	else
	{
		for(aux=aux->next_group ; aux != NULL ; aux=aux->next_group)
		{
			if (strcmp(aux->comando,"")!=0)
				fprintf(f,"%s\n",aux->comando);
		}
	}
	free(mfv);
	fclose(f);
	return ret;
}


/*
int main()
{
	ComList * ret_pointer = init_hist();
	Retorno * com_pointer = init_retorno();
	

	ret_pointer = historico(ret_pointer,"circulo");
	ret_pointer = historico(ret_pointer,"bola");
	ret_pointer = historico(ret_pointer,"merda");
	
	//printf("%s\n",ret_pointer->teclado);
	//printf("%s\n",ret_pointer->next->teclado);
	
	savecomlist("ola",ret_pointer);

	com_pointer=comandos("ola.mfv", com_pointer);
	imprime_retorno(com_pointer);
	
	return 0;
}*/
