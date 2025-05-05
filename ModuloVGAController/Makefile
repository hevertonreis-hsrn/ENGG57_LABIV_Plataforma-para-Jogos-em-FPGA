# Makefile para simular seu projeto VGA no Verilator com SDL

# Flags do Verilator
VFLAGS = -Wall -O3 --x-assign fast --x-initial fast --noassert --Wno-WIDTH --Wno-UNUSED

# SDL2 flags
SDL_CFLAGS = $(shell sdl2-config --cflags)
SDL_LDFLAGS = $(shell sdl2-config --libs)

# Arquivos Verilog do seu projeto
VERILOG_SOURCES = top.v vgaController.v clockDivider.v doubleBuffer.v

# Nome do executável
EXEC = simvga

# Alvo principal
all: $(EXEC)

# Como gerar o executável
$(EXEC):
	verilator $(VFLAGS) -cc $(VERILOG_SOURCES) --exe sim.cpp -o $(EXEC) \
		-CFLAGS "$(SDL_CFLAGS)" -LDFLAGS "$(SDL_LDFLAGS)" --build

# Limpar a simulação
clean:
	rm -rf obj_dir $(EXEC)

.PHONY: all clean