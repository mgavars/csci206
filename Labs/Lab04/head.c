/* Mitch Gavars
 * February 5th, 8am
 * lab 04 - head.c
 * compile with:
 * notes: stores the C code
 */
 
 
// for O_RDONLY, etc.
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
#define MAXBYTES 1024
 
int read_file_bytes (char* filename, int bytes, char* buffer)
/*
 * Reads byte data from a file and append a null terminator (byte value of zero, 0).
 * 
 *  filename: full path and filename to read from.
 *  bytes: maximum number of bytes to read.
 *  buffer: where to put the read data (note need bytes+1!).
 *  Return value: number of bytes read or -1 on error.
 */
{
    // your code here
  int fileOpened = open(filename, O_RDONLY);
  int bytesRead = read(fileOpened, buffer, bytes);
  if (bytesRead > 0){
    buffer[bytesRead] = '\0';
  }
  
  else {
    return -1;
  }

  close(fileOpened);
  return bytesRead; 
}

 
int main(int argc, char* argv[])
{
    int readbytes = 10;         // default to 10 bytes
    char buffer[MAXBYTES+1];    // buffer to hold file data
 
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
    if (read_file_bytes(argv[1], readbytes, buffer) >= 0){
        printf("%s\n", buffer);
    } else {
        printf("Error: could not read file!\n");
        exit(-3);
    }
    return 0;
}
