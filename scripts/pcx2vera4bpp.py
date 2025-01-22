#!/usr/bin/env python3
import sys
import math
from PIL import Image

def main(argv):
    with Image.open(argv[1]) as img:
        with open(argv[2], mode="w") as chrasm:
            chrasm.write(f'.segment "{argv[3]}"\n')
            tcols = math.ceil(img.width / 8)
            trows = math.ceil(img.height / 8)
            for tile in range(trows * tcols):
                bp = []
                for pxrow in range(8):
                    bpb = 0
                    for pxcol in range(8):
                        xx = (tile % tcols) * 8 + pxcol
                        yy = (tile // tcols) * 8 + pxrow
                        bpb = (bpb << 4) | (img.getpixel([xx,yy]) & 0x03)
                        if pxcol % 2 == 1:
                            bp.append(bpb & 0xff)
                            bpb = 0
                chrasm.write("  .byte " + ", ".join([f"${int(xs):02X}" for xs in bp]) + "\n")

if __name__ == "__main__":
    main(sys.argv)