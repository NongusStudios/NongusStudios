CC = g++
FLAGS = -O0 -g -Wfatal-errors -Wall -pedantic -std=c++20

SRC  = $(wildcard src/*.cpp) $(wildcard src/**/*.cpp) $(wildcard src/**/**/*.cpp)

OBJ = $(SRC:%.cpp=%.o)

OUT = out
CURRENT_EXAMPLE = examples/main.cpp

.PHONY: all clean run

all: build run

build: $(OBJ)
	ar rcs $(LIBCLIAPI) $(OBJ)
	$(CC) -o $(OUT) $(CURRENT_EXAMPLE) $(FLAGS) $(LIBCLIAPI) $(LINKER)

run:
	clear
	./$(OUT)

clean:
	rm $(OBJ)
	rm $(OUT)

src/%.o: src/%.cpp include/%.hpp
	$(CC) -o $@ -c $< $(FLAGS)
