#!/usr/bin/env python3
import sys
import math
from PIL import Image

def main(argv):
    fn = argv[1]
    startbank = int(argv[2])
    bgbanks = [int(num) for num in argv[3].split()]
    sprbanks = [int(num) for num in argv[4].split()]
    with open(fn, mode="w") as lutasm:
        lutasm.write(f'.export bgbanks, bgpages\n')
        lutasm.write(f'.export sprbanks, sprpages\n')
        lutasm.write(f'.segment "CHRLUTS"\n')
        bgb = [False] * 128
        for i in bgbanks:
            bgb[i] = True
        sprb = [False] * 128
        for i in sprbanks:
            sprb[i] = True

        cbank = startbank
        cpage = 0xa0

        tbanks = []
        tpages = []

        for i in range(128):
            if bgb[i] and i % 2 == 0:
                tbanks.append(cbank)
                tpages.append(cpage)
                cpage += 0x08
                if (cpage >= 0xc0):
                    cpage -= 0x20
                    cbank += 1
            else:
                tbanks.append(0)
                tpages.append(0)

        lutasm.write(f'bgbanks:\n')
        lutasm.write("\t.byte " + ", ".join([f"${int(xs):02X}" for xs in tbanks]) + "\n")
        lutasm.write(f'bgpages:\n')
        lutasm.write("\t.byte " + ", ".join([f"${int(xs):02X}" for xs in tpages]) + "\n")

        tbanks = []
        tpages = []

        for i in range(128):
            if sprb[i]:
                tbanks.append(cbank)
                tpages.append(cpage)
                cpage += 0x08
                if (cpage >= 0xc0):
                    cpage -= 0x20
                    cbank += 1
            else:
                tbanks.append(0)
                tpages.append(0)

        lutasm.write(f'sprbanks:\n')
        lutasm.write("\t.byte " + ", ".join([f"${int(xs):02X}" for xs in tbanks]) + "\n")
        lutasm.write(f'sprpages:\n')
        lutasm.write("\t.byte " + ", ".join([f"${int(xs):02X}" for xs in tpages]) + "\n")


# chr2bank.py <filename> <starting bank> <bg bank numbers> <sprite bank numbers>

if __name__ == "__main__":
    main(sys.argv)
