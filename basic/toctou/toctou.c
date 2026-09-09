#include <stdio.h>

#define WR_OK 2

int main() {
  char file[] = "config.txt";
  void* fp;
  if (access(file, WR_OK) == 0) {
    fp = fopen(file, "w");
    fprintf(fp, "config data");
    fclose(fp);
  }
}
