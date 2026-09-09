#include <stdio.h>
#include <string.h>

#ifdef _WIN32
#include <io.h>
#else
#include <unistd.h>
#endif

#define MAX_SIZE 128

void doMemCpy(char* buf, char* in, int chars) {
  memcpy(buf, in, chars);
}

int main() {
  char buf[64];
  char in[MAX_SIZE];
  int bytes;

  printf("Enter buffer contents:\n");
  read(0, in, MAX_SIZE-1);
  printf("Bytes to copy:\n");
  scanf("%d", &bytes);
  
  doMemCpy(buf, in, bytes);
  
  return 0;
}
