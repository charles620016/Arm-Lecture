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
        int f0 = 0;
        int f1 = 1;
        int fn = 0;
        int i = 0;
        for(i = 0; i < number-2; i++){
            fn = f0 + f1;
            f1 = fn;
            f0 = f1;
        }
        return fn;
    }
}