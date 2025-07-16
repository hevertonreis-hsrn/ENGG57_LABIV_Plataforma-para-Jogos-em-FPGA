class Sprite:
    def __init__(self, sprite_id, shape):
        self.sprite_id = sprite_id
        self.shape = shape  # 16x16 pixels
        self.row = 0
        self.col = 0


class SpriteManager:
    def __init__(self):
        self.sprites = {}

    def set_sprite(self, level, sprite_id):
        self.sprites[level] = Sprite(sprite_id, [[0] * 16 for _ in range(16)])

    def move_sprite(self, level, row, col):
        if level in self.sprites:
            self.sprites[level].row = row
            self.sprites[level].col = col

    def detect_collision(self, level1, level2):
        if level1 not in self.sprites or level2 not in self.sprites:
            return False

        sprite1 = self.sprites[level1]
        sprite2 = self.sprites[level2]

        # Check for overlap in x-axis
        x_overlap = not (
            sprite1.col + 16 <= sprite2.col or sprite1.col >= sprite2.col + 16
        )

        # Check for overlap in y-axis
        y_overlap = not (
            sprite1.row + 16 <= sprite2.row or sprite1.row >= sprite2.row + 16
        )

        # Return True if there's overlap in both axes
        return x_overlap and y_overlap


def check_sprite_bounds(
    mem, position_value, program_addr, display_addr, min_bound=0, max_bound=240
):

    if position_value < min_bound:
        position_value = min_bound
        # Update both program and display memory addresses
        mem.store(program_addr, min_bound)
        mem.store(display_addr, min_bound)
    elif position_value > max_bound:
        position_value = max_bound
        # Update both program and display memory addresses
        mem.store(program_addr, max_bound)
        mem.store(display_addr, max_bound)

    return position_value
