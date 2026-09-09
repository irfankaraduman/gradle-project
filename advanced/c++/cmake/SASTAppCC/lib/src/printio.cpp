#include "printio.hpp"
#include <stdio.h>
#include <wchar.h>

void printIntLine(int intNumber)
{
    printf("%d\n", intNumber);
}

void printLine(const char * line)
{
    if(line != NULL) 
    {
        printf("%s\n", line);
    }
}
