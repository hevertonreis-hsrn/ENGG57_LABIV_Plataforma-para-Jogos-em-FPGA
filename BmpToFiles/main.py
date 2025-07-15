import os
import argparse
import numpy as np
from PIL import Image

NUM_SPRITES = 47
SPRITE_SIZE = 16

def rgb888_to_rgb565(r, g, b):
    r5 = (r >> 3) & 0x1F  # 5 bits
    g6 = (g >> 2) & 0x3F  # 6 bits
    b5 = (b >> 3) & 0x1F  # 5 bits
    return (r5 << 11) | (g6 << 5) | b5

def sprite_data_to_mif(sprite_data, output_mif_path):
    total_pixels = len(sprite_data) * len(sprite_data[0])
    width_bits = 24
    with open(output_mif_path, 'w') as f:
        f.write(f"WIDTH = {width_bits};\n")
        f.write(f"DEPTH = {total_pixels};\n")
        f.write("ADDRESS_RADIX = HEX;\n")
        f.write("DATA_RADIX = HEX;\n")
        f.write("CONTENT\nBEGIN\n")

        addr = 0
        for sprite in sprite_data:
            for pixel_val in sprite:
                f.write(f"{addr:X} : {pixel_val:06X};\n")
                addr += 1

        f.write("END;\n")
    print(f"✅ MIF gerado: {output_mif_path}.")
    
def sprite_data_to_hex(sprite_data, output_hex_path):
    with open(output_hex_path, 'w') as f:
        for sprite in sprite_data:
            for pixel_val in sprite:
                f.write(f"{pixel_val:04X}")

    print(f"✅ HEX gerado: {output_hex_path}.")

def extract_sprites(image_path, sprite_size, num_sprites):
    if not os.path.isfile(image_path):
        raise FileNotFoundError(f"Arquivo '{image_path}' não encontrado.")

    img = Image.open(image_path).convert("RGB")
    width, height = img.size

    sprites_per_row = width // sprite_size
    sprites_per_col = height // sprite_size
    total_available = sprites_per_row * sprites_per_col

    print("sprites_per_row = ", sprites_per_row)
    print("sprites_per_col = ", sprites_per_col)
    print("total_available = ", total_available)
    
    if num_sprites > total_available:
        raise ValueError(f"A imagem contém apenas {total_available} sprites, mas você solicitou {num_sprites}.")

    pixels = img.load()
    sprite_data = []

    count = 0
    for row in range(sprites_per_col):
        for col in range(sprites_per_row):
            if count >= num_sprites:
                break

            start_x = col * sprite_size
            start_y = row * sprite_size

            current_sprite = []  # ← Cria a lista de pixels do sprite
            for y in range(sprite_size):
                for x in range(sprite_size):
                    r, g, b = pixels[start_x + x, start_y + y]
                    pixel_val = (r << 16) | (g << 8) | b
                    # pixel_val = rgb888_to_rgb565(r, g, b)
                    current_sprite.append(pixel_val)

            sprite_data.append(current_sprite)  # ← Adiciona o sprite completo
            count += 1

        if count >= num_sprites:
            break
    print(len(sprite_data))
    # # Preenche com sprites vazios se não atingiu o total
    # while len(sprite_data) < 256:
    #     sprite_data.append([0x000000] * (sprite_size * sprite_size))

    return sprite_data

def gen_mif_sprites(input_file):
    base_name = os.path.splitext(input_file)[0]
    output_file = base_name + ".mif"
    
    dados = extract_sprites(input_file, SPRITE_SIZE, NUM_SPRITES)
    sprite_data_to_mif(dados, output_file)
    
def gen_hex_sprites(input_file):
    base_name = os.path.splitext(input_file)[0]
    output_file = base_name + ".hex"

    dados = extract_sprites(input_file, SPRITE_SIZE, NUM_SPRITES)
    sprite_data_to_hex(dados, output_file)
    
def gen_mif_sprites_from_folder(input_path):
    sprite_data = []
    output_file = "cook_sprite_pack.mif"
    for i in range(NUM_SPRITES):
        filename = f"Cook_SpritePack01{i:02d}.png"  # <- Corrigido para 3 dígitos
        path = os.path.join(input_path, filename)
        try:
            sprite = extract_sprites(path, SPRITE_SIZE, 1)
            sprite_data.append(sprite[0])
        except Exception as e:
            print(f"⚠️ Erro ao processar '{filename}': {e}")

    while len(sprite_data) < 256:
        sprite_data.append([0x000000] * (SPRITE_SIZE * SPRITE_SIZE))

    sprite_data_to_mif(sprite_data, output_file)

def bmp_to_hex(input_file):
    # Verifica se o arquivo existe
    if not os.path.isfile(input_file):
        print(f"Arquivo '{input_file}' não encontrado.")
        return

    # Abre e converte a imagem
    img = Image.open(input_file)
    if img.mode != 'RGB':
        img = img.convert('RGB')

    width, height = img.size
    pixels = np.array(img, dtype=np.uint8)

    # Gera nome de saída
    base_name = os.path.splitext(input_file)[0]
    output_file = base_name + ".hex"

    with open(output_file, 'w') as f:
        for y in range(height):
            for x in range(width):
                r, g, b = [int(v) for v in pixels[y, x]]
                pixel_val = (r << 16) | (g << 8) | b
                f.write(f"{pixel_val:08X}")
    
    print(f"Arquivo gerado: {output_file}")


def bmp_to_dat(input_file):
    # Verifica se o arquivo existe
    if not os.path.isfile(input_file):
        print(f"Arquivo '{input_file}' não encontrado.")
        return

    # Abre e converte a imagem
    img = Image.open(input_file)
    if img.mode != 'RGB':
        img = img.convert('RGB')

    width, height = img.size
    pixels = np.array(img, dtype=np.uint8)
    # Gera nome de saída
    output_file = "embedded_vpu_sdram_controller_test_component.dat"

    with open(output_file, 'w') as f:
        for y in range(height):
            for x in range(width):
                r, g, b = [int(v) for v in pixels[y, x]]
                pixel_val = (r << 16) | (g << 8) | b
                f.write(f"{pixel_val:08X}\n")
                
    print(f"Arquivo gerado: {output_file}")

def main():
    parser = argparse.ArgumentParser(description='BMP image converter to .hex or .dat files')
    parser.add_argument('input', help='Path to the input image (e.g., image.png)')
    parser.add_argument('--format', choices=['dat', 'hex', 'mif', 'hex_sprite', 'sprites_from_folder'], required=True,
                        help='Output format: dat or hex')

    args = parser.parse_args()

    converters = {
        'hex': bmp_to_hex,
        'dat': bmp_to_dat,
        'mif': gen_mif_sprites,
        'hex_sprite' : gen_hex_sprites,
        'sprites_from_folder': gen_mif_sprites_from_folder,
    }

    converters[args.format](args.input)
    
if __name__ == "__main__":
    main()
