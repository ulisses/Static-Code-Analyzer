#include <stdio.h>
#include <stdlib.h>

int main(int argc,char** argv)
{
    int i = 0;
    int total = 0;
    while(i<argc-1){
        total += atoi(argv[i+1]);
        i++;
    } 
    printf("%d",total);
    return 0;
}