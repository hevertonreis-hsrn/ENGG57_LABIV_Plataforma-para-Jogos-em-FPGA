import os
import argparse
import numpy as np
from PIL import Image

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
                pixel_val = (b << 24) | (g << 16) | r << 8
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
    height = int(height/3)
    # Gera nome de saída
    output_file = "EmbarcadoVGA_sdram_controller_test_component.dat"

    with open(output_file, 'w') as f:
        for y in range(height):
            for x in range(width):
                r, g, b = [int(v) for v in pixels[y, x]]
                pixel_val = (b << 24) | (g << 16) | r << 8
                f.write(f"{pixel_val:08X}\n")
                
    print(f"Arquivo gerado: {output_file}")

def main():
    parser = argparse.ArgumentParser(description='BMP image converter to .hex or .dat files')
    parser.add_argument('input', help='Path to the input image (e.g., image.png)')
    parser.add_argument('--format', choices=['dat', 'hex'], required=True,
                        help='Output format: dat or hex')

    args = parser.parse_args()

    converters = {
        'hex': bmp_to_hex,
        'dat': bmp_to_dat
    }

    converters[args.format](args.input)
    
if __name__ == "__main__":
    main()
