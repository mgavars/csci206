/* Mitch Gavars
 * February 5th, 8am
 * lab 04 - fileio.c
 * compile with:
 * notes: none
 */
 
#include "fileio.h"

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
