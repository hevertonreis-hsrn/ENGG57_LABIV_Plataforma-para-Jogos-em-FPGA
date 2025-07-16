import pygame
from memory import Memory

FRAMEBUFFER_START = 0x8000
WIDTH, HEIGHT = 640, 480
FRAMEBUF_SIZE = WIDTH * HEIGHT * 3
MEM_SIZE = FRAMEBUFFER_START + FRAMEBUF_SIZE

class Game:
    def __init__(self, memory: Memory):
        pygame.init()
        self.screen = pygame.display.set_mode((WIDTH, HEIGHT))
        pygame.display.set_caption("Simulated Frame-buffer")
        self.clock = pygame.time.Clock()
        self.memory = memory
        self.running = True

    def blit_framebuffer(self):
        try:
            fb = self.memory.read_block(FRAMEBUFFER_START, FRAMEBUF_SIZE)
            surf = pygame.image.frombuffer(fb, (WIDTH, HEIGHT), "RGB")
            self.screen.blit(surf, (0, 0))
        except IndexError as e:
            print(f"[Frame Error] {e}")

    def run(self):
        while self.running:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self.running = False

            self.blit_framebuffer()
            pygame.display.flip()
            self.clock.tick(60)

        pygame.quit()
