#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//#define PRINT_INFO

int shellcode(void) {
	// Put Shellcode Here
	int i = 0xaaaaaaaa;
}

void end_shellcode(void){}

int main(void) {
	unsigned long shellcode_len = (unsigned long)end_shellcode - (unsigned long)shellcode;

#ifdef PRINT_INFO
	fprintf(stderr, "Shellcode begins at %p and is %lu bytes long\n", 
			shellcode,
			shellcode_len);
#endif //PRINT_INFO

	fwrite(shellcode, shellcode_len, 1, stdout);
}
