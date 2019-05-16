#include<stdio.h>
#include<string.h>
#include<stdlib.h>

char *changepw(char l[],char p[]);

int main(int argc, char *argv[]){
        if(argc !=3){
                printf("There must be three arguments\n");
                printf("Usage: a.out file.txt username\n");
                        //argv:{  0     1       2       }
                return 0;
        }
        int b= update(argv);
        if(b==0)
                printf("Password updated for %s\n",argv[2]);
        else
                printf("%s not found.\n", argv[2]);
        return 0;
}

int update(char *a[]){
        int r=1, count=0, tempc=0;
        FILE *f1=fopen(a[1],"r+");
        FILE *f2=fopen("temp.txt","w");
        char line[80];
        char *nl;
        while(fgets(line, 80, f1)!=NULL){
                int f=findUser(line,a);
                if(f!=0){
                        printf("Found user, please enter the new password: ");
                        char ps[80];
                        scanf("%s",ps);
                        nl=changepw(line, ps);
                        fputs(nl,f2);
                        r=0;
                }

                else
                        fputs(line,f2);
        }
        fclose(f1);
        fclose(f2);

        FILE *f3=fopen(a[1],"w");
        FILE *f4=fopen("temp.txt","r");
        while(fgets(line, 80, f4)!=NULL)
                fputs(line, f3);

        return r;
}

int findUser(char l[], char *a[]){
        int counter=0;
        char s[80];
        while(l[counter]!='\t'){
                        s[counter]=l[counter];
                        counter++;
                }
        if(strcmp(s,a[2])==0)
                return counter;
        else
                return 0;

}

char *changepw(char l[],char p[]){
        char *new=(char*)malloc(strlen(l));
        int i=0;
        while(l[i]!=' '){
                new[i]=l[i];
                i++;
        }
        while(l[i]==' '){
                new[i]=l[i];
                i++;
        }
        strcat(strcat(new,"\t"),strcat(p,"\n"));
        return new;
}
