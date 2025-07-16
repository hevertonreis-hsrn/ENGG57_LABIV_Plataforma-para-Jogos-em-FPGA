import pygame


class Display:
    def __init__(self, width=256, height=256, pixel_scale=2):
        self.width = width
        self.height = height
        self.scale = pixel_scale

        # Initialize pygame
        pygame.init()
        self.screen = pygame.display.set_mode(
            (width * pixel_scale, height * pixel_scale)
        )
        pygame.display.set_caption("Game Processor Simulator")

        # Colors
        self.colors = {
            0: (0, 0, 0),  # Black
            1: (255, 255, 255),  # White
            2: (255, 0, 0),  # Red
            3: (0, 255, 0),  # Green
            4: (0, 0, 255),  # Blue
            5: (255, 255, 0),  # Yellow
            6: (255, 0, 255),  # Magenta
            7: (0, 255, 255),  # Cyan
        }

    def clear(self):
        self.screen.fill((0, 0, 0))

    def draw_sprite(self, sprite):
        for y, row in enumerate(sprite.shape):
            for x, pixel in enumerate(row):
                if pixel > 0:  # If pixel is not transparent
                    color = self.colors.get(pixel, (255, 255, 255))
                    pygame.draw.rect(
                        self.screen,
                        color,
                        (
                            (sprite.col + x) * self.scale,
                            (sprite.row + y) * self.scale,
                            self.scale,
                            self.scale,
                        ),
                    )

    def render_sprites(self, sprite_manager):
        self.clear()
        # Draw sprites in order of level (lower levels first)
        for level in sorted(sprite_manager.sprites.keys()):
            self.draw_sprite(sprite_manager.sprites[level])
        pygame.display.flip()

    def check_quit(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return True
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_ESCAPE:
                    return True
        return False
