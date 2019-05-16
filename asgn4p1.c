#include<stdio.h>
#include<string.h>
#include<stdlib.h>

char *my_strcat(char a[], char b[]);

int main(int argc, char *argv[]){
        if(argc!=4){
                printf("Incorrect amount of files");    //Tells the user that it needs more files
                return 0;
        }
        merge(argv);
        return 0;
}

int merge(char *a[]){
        FILE *f1, *f2, *f3;
        f1 = fopen(a[1],"w");        //file to write to
        f2 = fopen(a[2],"r");        //file to read usernames from
        f3 = fopen(a[3],"r");        //file to read passwords from
        char u [80], p [80];

        while(fgets(u,80,f2)!= NULL){//while they have not reached end of file
                if(fgets(p,80,f3)!=NULL){//Checks to make sure there is a password the username can me matched wih
                        fputs(my_strcat(u,p),f1);
                }
        }
        return 0;
}

char *my_strcat(char a[], char b[]){
        char *res=malloc(strlen(a)+strlen(b)+5);        //Sets memory size for the pointer
        int i=0,j=0;    //Counters

        while(a[i] !='\n'){     //Runs until \n is found to prevent newline in string
                res[i]=a[i];
                i++;
        }
        strcat(res,"\t");
        i++;
        while(b[j]!='\0'){      //Runs until \0 is found
                res[i]=b[j];
                i++;
                j++;
        }

        res[i+1]='\0';  //Adds \0 to end of string
        return res;
}






