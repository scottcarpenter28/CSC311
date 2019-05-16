#include<stdio.h>
#include<stdlib.h>
#include<string.h>
        char s[80];     //String input
        char t[80];     //String input
        char *my_strcat(char a[], char b[]);
        void my_strreverse(char temp[]);
int main(){
        printf("Please enter string s: ");      //Asks for user input
        scanf("%s",s);  //Gets the user input

        printf("Length is: %d\n",my_strlen(s));//Tells the user of the length of the string

        printf("Please enter string t: ");      //Asks for user input
        scanf("%s",t);  //Gets the user input

        my_strcpy(s,t);
        printf("After my_strcpy, string s is: %s\n", s);

        char *c = my_strcat(s,t);	//Creats a pointer where the string will be stored
        printf("After my_strcat, concatinated string is: %s\n",c);

        printf("After my_strreverse, string s is: ");
        my_strreverse(s);

        return 0;
}

int my_strlen(char s[]){
        int len=0;
        while(s[len]!='\0')		//Counts the amount of characters including end line
                len++;
        return len;
}

int my_strcpy(char s[], char t[]){
        if(my_strlen(s)>= my_strlen(t)){	//If string t is greater than or equal to the lenght of string s, then copy t into s
                int i;
                for(i=0; i<my_strlen(s); i++){
                s[i]=t[i];
                }
                s[i+1]='\0';
                return 1;       //Copied
        }
        else
                return -1;      // Did not copy
}

char *my_strcat(char a[], char b[]){
        char *res=malloc(my_strlen(a)+my_strlen(b)+1);	//Sets memory size for the pointer
        int i=0,j=0;	//Counters

        while(a[i] !='\0'){	//Runs until \0 is found
                res[i]=a[i];
                i++;
        }

        while(t[j]!='\0'){	//Runs until \0 is found
                res[i]=b[j];
                i++;
                j++;
        }

        res[i+1]='\0';	//Adds \0 to end of string
        return res;
}

void my_strreverse(char s[]){
        char *r=malloc(my_strlen(s)+1);	//sets the memory size for the string
        char *b;	//Begining of string
        b=r;	//Stores the begining of string in b
        int i=my_strlen(s)-1;	//Gets the length-1 so that the loop wont end immediatly
        while(i>=0){
                *r=s[i];	//puts the char into r
                r++;
                i--;
        }
        r++;
        *r='\0';	//Puts \0 into the string
        printf("%s\n", b);
}
