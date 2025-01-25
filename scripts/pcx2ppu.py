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
                bp1 = []
                bp2 = []
                for pxrow in range(8):
                    bp1b = 0
                    bp2b = 0
                    for pxcol in range(8):
                        xx = (tile % tcols) * 8 + pxcol
                        yy = (tile // tcols) * 8 + pxrow
                        bp1b = (bp1b << 1) | (img.getpixel([xx,yy]) & 0x01)
                        bp2b = (bp2b << 1) | ((img.getpixel([xx,yy]) & 0x02) >> 1)
                    bp1.append(bp1b & 0xff)
                    bp2.append(bp2b & 0xff)
                chrasm.write("  .byte " + ", ".join([f"${int(xs):02X}" for xs in bp1+bp2]) + "\n")

if __name__ == "__main__":
    main(sys.argv)
