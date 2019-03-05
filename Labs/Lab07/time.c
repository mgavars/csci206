#include <stdio.h>
#include <time.h>
 
extern void add_second(tm);

int main(void)
{
    int i;
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
    
 
    printf ("it is now: %s\n", asctime(tm));

    for (i = 0; i < 2345; ++i) {
      add_second(tm->tm_sec);
    }

    printf ("it is now: %s\n", asctime(tm));

    return 0;
}
