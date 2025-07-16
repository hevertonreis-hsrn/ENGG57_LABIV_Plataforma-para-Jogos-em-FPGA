from memory import Memory
from PIL import Image

FRAMEBUFFER_START = 0x8000
WIDTH, HEIGHT = 640, 480

def load_image_to_memory(path: str, mem: Memory):
    img = Image.open(path).convert("RGB").resize((WIDTH, HEIGHT))
    pixels = img.tobytes()
    end_addr = FRAMEBUFFER_START + len(pixels)

    if end_addr > len(mem):
        raise ValueError(f"Image too large to fit in framebuffer memory (needs {len(pixels)} bytes)")

    mem.write_block(FRAMEBUFFER_START, pixels)
