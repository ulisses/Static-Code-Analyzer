#include <stdio.h>
#include <stdlib.h>

int contaCenas(){return 1;}

int contaCenasdsad(){return 1;}

int main(int argc,char** argv)
{
    int i = 0;
    int total = 0;  //variavel que cenas
    while(i<argc-1){
        total += atoi(argv[i+1]);        i++;
    } 
    
    
    /*
    
    Esto codigo é todo ele um clone MUAHAHAHAHAHHAHAHAHAH
    
    */
    
    printf("%d",total);
    
    
    
    
    return 0;
}