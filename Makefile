CC = cc
CFLAGS = -std=c11 -O3 -Wall -Wextra -march=native -fopenmp
LDFLAGS = -lm
WINCC = x86_64-w64-mingw32-gcc

run: gemma4.c
	$(CC) $(CFLAGS) gemma4.c -o run $(LDFLAGS)

ssa_gemma4: ssa_gemma4.c
	$(CC) $(CFLAGS) ssa_gemma4.c -o ssa_gemma4 $(LDFLAGS)

win64: gemma4.c win.c win.h
	$(WINCC) $(CFLAGS) -static -D_WIN32 gemma4.c win.c -o run.exe $(LDFLAGS) -lshell32

.PHONY: all clean win64 ssa_gemma4
all: run ssa_gemma4
clean:
	rm -f run run.exe ssa_gemma4
