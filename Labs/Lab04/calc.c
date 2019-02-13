/* Mitch Gavars
 * Feb 5, 2019  8am
 * lab 04 - calc.c
 * compile with: 
 * notes: creating a command line calculator
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]){
  float answer = 0.0;
  int operation;
  int i;

  if (strcmp(argv[1], "add") == 0){
    operation = 0;
  }
  else if (strcmp(argv[1], "mul") == 0){
    operation = 1;
  }
  else if (strcmp(argv[1], "div") == 0){
    operation = 2;
  }
  else if (strcmp(argv[1], "len") == 0){
    operation = 3;
  }
  else {
    operation = 4;
  }


  switch (operation){
     case 0 :
       for (i = 2; i < argc; ++i){
	 answer += atof(argv[i]);
       }
       break;
     case 1 :
       answer = 1.0;
       for (i = 2; i < argc; ++i){
	 answer *= atof(argv[i]);
       }
       break;
     case 2 :
       answer = atof(argv[2]);
       for (i = 3; i < argc; ++i){
	 answer *= 1.0/atof(argv[i]);
       }
       break;
     case 3 :
       for (i = 2; i < argc; ++i){
	 answer += strlen(argv[i]);
       }
       break;
     default :
       printf("Unsupported function, try: add, mul, div, or len\n");
       break;   
  }
  printf("%f\n", answer);

  return 0;
}


