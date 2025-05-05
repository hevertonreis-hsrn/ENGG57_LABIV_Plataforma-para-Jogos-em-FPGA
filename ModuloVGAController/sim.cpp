#include <stdio.h>
#include <SDL.h>
#include <verilated.h>
#include "Vtop.h"  // Mudamos para o seu módulo!

const int H_RES = 640;
const int V_RES = 480;

typedef struct Pixel {
    uint8_t a;
    uint8_t b;
    uint8_t g;
    uint8_t r;
} Pixel;

int main(int argc, char* argv[]) {
    Verilated::commandArgs(argc, argv);

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL init failed.\n");
        return 1;
    }

    Pixel screenbuffer[H_RES*V_RES];

    SDL_Window* sdl_window = NULL;
    SDL_Renderer* sdl_renderer = NULL;
    SDL_Texture* sdl_texture = NULL;

    sdl_window = SDL_CreateWindow("VGA Test", SDL_WINDOWPOS_CENTERED,
        SDL_WINDOWPOS_CENTERED, H_RES, V_RES, SDL_WINDOW_SHOWN);
    if (!sdl_window) {
        printf("Window creation failed: %s\n", SDL_GetError());
        return 1;
    }

    sdl_renderer = SDL_CreateRenderer(sdl_window, -1,
        SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
    if (!sdl_renderer) {
        printf("Renderer creation failed: %s\n", SDL_GetError());
        return 1;
    }

    sdl_texture = SDL_CreateTexture(sdl_renderer, SDL_PIXELFORMAT_RGBA8888,
        SDL_TEXTUREACCESS_TARGET, H_RES, V_RES);
    if (!sdl_texture) {
        printf("Texture creation failed: %s\n", SDL_GetError());
        return 1;
    }

    const Uint8* keyb_state = SDL_GetKeyboardState(NULL);
    
    printf("Simulation running. Press 'Q' to quit.\n");

    Vtop* top = new Vtop;

    top->clk = 0;
    top->eval();

    uint64_t start_ticks = SDL_GetPerformanceCounter();
    uint64_t frame_count = 0;

    while (1) {
        top->clk = 1;
        top->eval();
        top->clk = 0;
        top->eval();

        if (top->vgaRequest) { // Só desenha se dentro da área visível
            if (top->xPos < H_RES && top->yPos < V_RES) {
                Pixel* p = &screenbuffer[top->yPos * H_RES + top->xPos];
                p->a = 0xFF;
                p->r = top->outRed;
                p->g = top->outGreen;
                p->b = top->outBlue;
            }
        }
        // const int H_DISPLAY_START = 144; // exemplo para 640x480 a 60Hz
        // const int V_DISPLAY_START = 35;  // exemplo para 640x480 a 60Hz
        // if (top->vgaRequest) {
        //     int telaX = top->xPos - H_DISPLAY_START;
        //     int telaY = top->yPos - V_DISPLAY_START;
        //     if (telaX >= 0 && telaX < H_RES && telaY >= 0 && telaY < V_RES) {
        //         Pixel* p = &screenbuffer[telaY * H_RES + telaX];
        //         p->a = 0xFF;
        //         p->r = top->outRed;
        //         p->g = top->outGreen;
        //         p->b = top->outBlue;
        //     }
        // }

        // Quando terminar uma linha completa da tela
        if (top->yPos == V_RES && top->xPos == 0) {
            SDL_Event e;
            if (SDL_PollEvent(&e)) {
                if (e.type == SDL_QUIT) break;
            }

            if (keyb_state[SDL_SCANCODE_Q]) break;

            SDL_UpdateTexture(sdl_texture, NULL, screenbuffer, H_RES * sizeof(Pixel));
            SDL_RenderClear(sdl_renderer);
            SDL_RenderCopy(sdl_renderer, sdl_texture, NULL, NULL);
            SDL_RenderPresent(sdl_renderer);

            frame_count++;
        }
    }

    uint64_t end_ticks = SDL_GetPerformanceCounter();
    double duration = ((double)(end_ticks - start_ticks)) / SDL_GetPerformanceFrequency();
    double fps = (double)frame_count / duration;
    printf("Frames per second: %.1f\n", fps);

    top->final();
    SDL_DestroyTexture(sdl_texture);
    SDL_DestroyRenderer(sdl_renderer);
    SDL_DestroyWindow(sdl_window);
    SDL_Quit();
    return 0;
}
