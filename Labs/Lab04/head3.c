/* Mitch Gavars
 * February 5th, 8am
 * lab 04 - head3.c
 * compile with:
 * notes: none
 */
 
 
// for O_RDONLY, etc.
#include "fileio.h"

 
int main(int argc, char* argv[])
{
    int readbytes = 10;         // default to 10 bytes
    char buffer[MAXLINES][MAXBYTES+1];    // buffer to hold file data
    int counter = 0;
    int i;
 
    if (argc < 2){
        // missing required argument
        printf("Usage %s <filename> [<bytes>]\n", 
                argv[0]);
        exit(-1);
    }
    if (argc > 2){
        // process optional bytes argument
        readbytes = atoi(argv[2]);
        if (readbytes > MAXBYTES){            
            printf("bytes is too large, max supported value is %d!\n",
                    MAXBYTES);
            exit(-2);
        }
    }
    counter = read_file_lines(argv[1], readbytes, buffer);
    if (counter > 0){
      for (i = 0; i <= 10; i++){
        printf("%s\n", buffer[i]);
      }
    } else {
        printf("Error: could not read file!\n");
        exit(-3);
    }
    return 0;
}

int read_file_lines(char* filename, int lines, char buffer[MAXLINES][MAXBYTES + 1])
{
  int counter = 0;
  FILE* fileOpened = fopen(filename, "r");

  while (fgets(buffer[counter], lines, fileOpened ) != NULL) {
    if (counter >= MAXLINES){
      break;
    }
    counter += 1;
  }
  return counter;
}
