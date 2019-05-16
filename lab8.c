#include <stdio.h>
#include <stdlib.h>

int main(){
        /**************************************Question one****************************************************/
        int i1, i2;             //Integer variables
        double d1, d2;  //Double variables

        printf("Q1:\nThe addresses of the variables are:\n i1= %p\n i2= %p\n d1= %p\n d2= %p\n", &i1, &i2, &d1, &d2)$


        /**************************************Question Two****************************************************/
        int *intptr1, *intptr2; //interger ponters
        double *dubptr1, *dubptr2;      //double pointers

        printf("\nQ2:\nThe addresses of the variables are:\n intptr1= %p\n intptr2= %p\n dubptr1= %p\n dubptr2= %p\n$


        /**************************************Question Three**************************************************/
        intptr1= &i1;
        intptr2= &i2;
        dubptr1= &d1;
        dubptr2= &d2;

        printf("\nQ3:\nThe addresses of the variables are:\n intptr1= %d\n intptr2= %d\n dubptr1= %f\n dubptr2= %f\n$


        /**************************************Question Four***************************************************/
        intptr1= intptr2;       //intptr1 equals intptr2
        printf("\nQ4:\nintptr1= %p\n", intptr1);
        intptr1= (int*)dubptr1;
        printf("\nQ4:\nintptr1= %p\n", intptr1);


        /**************************************Question Five***************************************************/
        intptr1= NULL;  //intptr1 is equa to null
        printf("\nQ5:\nThe value of intptr1 is= %p\n", intptr1);


        /**************************************Question Six****************************************************/
        int temp2= *intptr2;
        printf("\nQ6:\nThe dereferenced value of intptr2 is= %p\n", temp2);


        /**************************************Question Seven**************************************************/
        *intptr2=100;
        printf("\nQ7:\ni1 is= %p\ni2 is= %p\n", i1, i2);

	/**************************************Question eight**************************************************/
        int temp1= *intptr2+1;
        temp2= *intptr2-1;
        printf("\nQ8:\n The value of *intptr2-1 is %p\nThe value of intptr2+1 is %p\n", temp2, temp1);

        temp1= *dubptr2+1;
        temp2= *dubptr2-1;
        printf("\nQ8:\n The value of *dubptr2-1 is %p\nThe value of dubptr2+1 is %p\n", temp2, temp1);


        /***********************************Question Nine**************************************************/
        printf("\nQ9: intptr1=1l \n");
        intptr1= &i1;

        if(intptr1==intptr2)
                printf("intptr1 equals intptr2\n");
        else
                printf("intptr1 does notequals intptr2\n");

        if(*intptr1==*intptr2)
                printf("*intptr1 equals *intptr2\n");
        else
                printf("*intptr1 does notequals intptr2\n");

        printf("\nQ9: intptr1=i2 \n");
        intptr1= &i2;

        if(intptr1==intptr2)
                printf("intptr1 equals intptr2\n");
        else
                printf("intptr1 does notequals intptr2\n");

        if(*intptr1==*intptr2)
                printf("*intptr1 equals *intptr2\n");
        else
                printf("*intptr1 does notequals intptr2\n");


        /**********************************Question Ten****************************************************/
        double *ptr=(double*)malloc(6);
        *ptr= 3.14156;
        double temp=*ptr;
        printf("\nQ10:\n ptr= %p\n*ptr= %f\n", ptr, temp);


        /**********************************Question Eleven*************************************************/
        free((void*)ptr);
        ptr=(double*)malloc(6);
        printf("\nQ11:\n ptr= %p\n*ptr= %f\n", ptr, temp);

        return 0;
}
