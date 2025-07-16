from memory import Memory
from utils import load_image_to_memory
from game import Game
import sys

FRAMEBUFFER_START = 0x8000
WIDTH, HEIGHT = 640, 480
FRAMEBUF_SIZE = WIDTH * HEIGHT * 3
MEM_SIZE = FRAMEBUFFER_START + FRAMEBUF_SIZE

def main(img_path: str):
    mem = Memory(MEM_SIZE)
    load_image_to_memory(img_path, mem)
    Game(mem).run()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python main.py <image.png>")
        sys.exit(1)
    main(sys.argv[1])