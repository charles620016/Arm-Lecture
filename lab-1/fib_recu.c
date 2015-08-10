#include <stdio.h>

int finonacci(int number)
{
    if(number<=0){
        return 0;
    }
    else if(number==1){
        return 1;
    }
    else{
        return finonacci(number-1) + finonacci(number-2);
    }
}