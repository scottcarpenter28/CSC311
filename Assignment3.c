#include<stdio.h>
#include<stdlib.h>
#include<string.h>

        char output, input;

int main(){
        char again='y';
        char dummy;
        while(again=='y' || again=='Y'){        //Runs again as long as again is y or Y
                printf("Please enter how you are entering the number(b for binary, d for decimal, h for hexadecimal,$
                //char input;
                scanf("%c", &input);    //Reads input base
                scanf("%c", &dummy);    //Garbage collection

                printf("Please enter how you would like the number output(d for decimal, h for hexadicimal, o for oc$
                //char output;
                scanf("%c", &output);   //Reads output base
                scanf("%c", &dummy);    //Garbage collection

                int num;
                char n[33];     //Used in case of binary
                if(input=='b' || input=='B'){   //Used if the entry is in binary
                        printf("Please enter your binary number: \n");
                        scanf("%s", n);
                        scanf("%c", &dummy);    //Garbage collection
                }
                else if(input=='h' || input=='H'){      //Used to read in hex
                        printf("Please enter your hexidecimal number: \n");
                        scanf("%x", &num);
                        scanf("%c", &dummy);    //Garbage collection
                }
                else if(input=='o' || input== 'O'){     //Reads in octal
                        printf("Please enter your octal number: \n");
                        scanf("%o", &num);
                        scanf("%c", &dummy);    //Garbage collection
                }
                else{
                        printf("Please enter your number: \n"); //If they said d or did not specify, reads in decimal
                        scanf("%d", &num);
                        scanf("%c", &dummy);    //Garbage collection
                }

                if(input=='b' || input=='B')    //If input was binary, then convert it
                        printBinary(n);
                else{
                        getInputBase(num);      //Prints out the original input in that base
                        getOutputBase(num);     //Converts to the output base user specified
                }

                printf("Would you like to run again(y for yes, any key for no)?: \n");  //Prompts user to run again
                scanf("%c", &again);    //Reads in user input
                scanf("%c", &dummy);    //Garbage collection
                }
        printf("Have a great day!\n");
        return 0;       //End of Program
}

int getInputBase(int nmbr){     //Gets number and prints it how it was input
        switch(input){
                case 'd':       //Input was decimal
                        printf("The integer %d in decimal ", nmbr);
                        break;
                case 'h':       //Input was hex
                        printf("The integer %x in hexidecimal ",nmbr);
                        break;
                case 'o':       //Input was octal
                        printf("The integer %o in octal ",nmbr);
                        break;
        }
        return 0;
}

int getOutputBase(int nmbr){    //Prints the number converted to user specified base
        switch(output){
                case 'd':       //Converts to decimal
                        printf("is %d in decimal.\n", nmbr);
                        break;
                case 'h':       //Converts to hex
                        printf("is %x in hexidecimal.\n",nmbr);
                        break;
                case 'o':       //Converts to octal
                        printf("is %o in octal.\n",nmbr);
                        break;
        }
        return 0;
}



int printBinary(char n[33]){    //Converts number from binary to decimal
        printf("The integer ");
        int i;
        for(i=0; i<=strlen(n);i++){
                printf("%c", n[i]);     //Prints out the input in binary
        }
        printf(" in binary ");

        i=0;
        int total=0;
        for(i=0;i<strlen(n);i++){
                total=(total*2)+(n[i]-48);
        }
        getOutputBase(total);   //Sends the decimal number to getOutputBase to convert

        return 0;
}
