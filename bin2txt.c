#include <stdio.h>

int main(void) {
	FILE *fp = stdin;

	if (NULL != fp) {
		while(1) {
			int c = fgetc(fp);
			if(feof(fp)) break;
			printf("\\x%hhX", (char) c);
		}
	}

	printf("\n");
}
