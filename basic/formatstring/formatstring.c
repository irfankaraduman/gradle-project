#include <string.h>
#include <stdio.h>

#define MAX_SIZE 64

int main(char** argv, int argc)
{	
	char in[MAX_SIZE];
	int chars;
	
	memset(in, 0, MAX_SIZE);
	chars = read(0, in, MAX_SIZE-1);
	printf("You just entered:");
	printf(in);
	return 0;
}
