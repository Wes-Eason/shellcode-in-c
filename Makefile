TARGETS := shellcode shellcode.s shellcode.txt shellcode.bin bin2txt

.PHONY: all
all: $(TARGETS)

shellcode.bin: shellcode Makefile
	@./shellcode > shellcode.bin

shellcode.txt: shellcode bin2txt Makefile
	@./shellcode | ./bin2txt > shellcode.txt

shellcode.s: shellcode Makefile
	@gdb -batch -ex 'file shellcode' -ex 'disass shellcode' | \
		sed 's;0x[0-9A-Fa-f]*;;' | \
		sed 's;^[[:space:]]*;;g' | \
		sed 's;\(^[^>]*\)>:;\1>;g' | \
	head -n -1 | \
   	tail -n +2 > shellcode.s
	
shellcode: shellcode.c Makefile  
	@gcc -g shellcode.c -o shellcode

bin2txt: bin2txt.c Makefile
	@gcc bin2txt.c -o bin2txt

.PHONY: clean
clean: 
	@rm -f $(TARGETS)
	
