ASM = nasm
FLAGS = -f elf64 -g -I src/
LINKER = ld

SOURCES = src/forth.asm
INCS = src/util.inc src/words.inc src/macro.inc
OBJECTS = obj/forth.o

EXECUTABLE = forth

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) 
	$(LINKER) $(OBJECTS) -o $@

$(OBJECTS): $(SOURCES) $(INCS)
	mkdir -p obj
	$(ASM) $(FLAGS) $(SOURCES)  -o $@

clean:
	rm -rf obj/
	rm $(EXECUTABLE)
