# python png_to_icon.py -i input.png -o output.ico
# pip install Pillow


import argparse
from PIL import Image

def png_to_icon(input_path, output_path):
    sizes = [16, 24, 32, 48, 256]
    icon_sizes = [(x, x) for x in sizes]
    with Image.open(input_path) as im:
        im.save(output_path, format="ICO", sizes=icon_sizes )

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert a PNG file to an ICO file")
    parser.add_argument("-i", "--input", type=str, required=True, help="Input PNG file path")
    parser.add_argument("-o", "--output", type=str, required=True, help="Output ICO file path")
    args = parser.parse_args()

    png_to_icon(args.input, args.output)
