CC = gcc
FLAGS = -Wfatal-errors -Wall -pedantic -std=c99 -Ilib/ngsc/include
LINKER = -lm -lSDL2 -lSDL2_image -lSDL2_ttf lib/ngsc/libngsc.a

SRC  = $(wildcard src/*.c) $(wildcard src/**/*.c) $(wildcard src/**/**/*.c) $(wildcard src/**/**/**/*.c)

OBJ  = $(SRC:src/%.c=obj/%.o)

OUT = out

.PHONY: all clean run libs

all: libs build run

libs:
	cd lib/ngsc && cmake . && make

build: $(OBJ)
	$(CC) -o $(OUT) $(OBJ) $(FLAGS) $(LINKER)

run:
	./$(OUT)

clean:
	rm -rf obj/*
	rm $(OUT)

obj/%.o: src/%.c
	$(CC) -o $@ -c $< $(FLAGS)