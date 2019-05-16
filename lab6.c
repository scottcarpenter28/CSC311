
#include <stdio.h>
#include <stdlib.h>

int main()
{
        int first, second, third;
        first= getNum();        //sets the fist number
        second= getNum();       //sets the second number
        third= getNum();        //sets the third number

        int ans=(first * second)-third; //solves the given math problem with the numbers that where input
        printf("%d times %d minus %d is %d\n", first, second, third, ans);      //Prints the result

        printCProgram();        //Prints result of question two from the lab
        printFiveDigits();      //Gets and prints the result of qestion 3

        return 0;       //End of program
}

int getNum()
{
        //Asks the user for a number then returns it
        int temp;       //temp storage for the input
        printf("Please enter an integer: ");    //Prompts for input
        scanf("%d", &temp);     //Reads the input iint temp
        return temp;
}


int printCProgram()
{
        //prints ou question 2 a-d as intended
        printf("This is a C program\nThis is\n a C program\nThis\nis\na\nC\nprogram\nThis       is      a       C   $
        int i=5;
        //Prints out the the right amount of stars per line
        while (i>0)
        {
                int n=i;
                while(n>0)
                {
                        printf("*");
                        n--;
                }
                i--;
                printf("\n");
        }
        return 0;
}

printFiveDigits()
{
        //Asks user for input then returns returns it spaced out
        printf("Please enter a 5 digit number: ");      //Prompts the user for input
        int temp;       //Input is kept here
        scanf("%d",&temp);      //Reads the input
        if(temp<=9999 || temp>100000){  //Checks to see if the nummber is greater than 9,999 and less then 100,000
                printf("The number you entered is not five digits");
        }
        else{
                printf("%d   ", (temp/10000));  //prints out the ten-thousand place

                temp= temp%10000;
                printf("%d   ", (temp/1000));   //Prints out the one-thousand place

                temp=temp%1000;
                printf("%d   ", (temp/100));    //Prints out the hundred place

                temp= temp%100;
                printf("%d   ", (temp/10));     //Prints out the tenth place

                temp= temp%10;
                printf("%d   ", (temp/1));      //Prints out the ones place

                printf("\n");
        }
        return 0;
}
