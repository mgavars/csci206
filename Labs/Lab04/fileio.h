/**
 * Mitch Gavars
 * Lab04: fileio.h
 * 02/12/19
 */


#ifndef __fileio_h_
#define __fileio_h_
 
// for O_RDONLY, etc.
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXBYTES 1024
#define MAXLINES 1024


int read_file_bytes (char* filename, int bytes, char* buffer);
int read_file_lines (char* filename, int lines, char buffed[MAXLINES][MAXBYTES+1]);
 
#endif
