# Makefile para simular seu projeto VGA no Verilator com SDL

# Flags do Verilator
VFLAGS = -Wall -O3 --x-assign fast --x-initial fast --noassert

# SDL2 flags
SDL_CFLAGS = $(shell sdl2-config --cflags)
SDL_LDFLAGS = $(shell sdl2-config --libs)

# Arquivos Verilog do seu projeto
VERILOG_SOURCES = top.v vgaController.v 

# Nome do executável
EXEC = vga_sim

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
