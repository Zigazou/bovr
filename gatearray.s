GA_SELECT_PEN: equ 0x00
GA_SELECT_COLOUR: equ 0x01
GA_SELECT_ROM_SCR_INT: equ 0x02
GA_SELECT_RAM: equ 0x03
GA_SET: macro function, value
    ld bc, 0x7f00 | (&function & 0x03) << 6 | (&value & 0x3f)
    out (c), c
endm

RAM0123: equ 0
RAM0127: equ 1
RAM4567: equ 2
RAM0327: equ 3
RAM0423: equ 4
RAM0523: equ 5
RAM0623: equ 6
RAM0723: equ 7
BANK0: equ 0
BANK1: equ 1
BANK2: equ 2
BANK3: equ 3
BANK4: equ 4
BANK5: equ 5
BANK6: equ 6
BANK7: equ 7
GA_SET_RAM: macro banknumber, config
    GA_SET GA_SELECT_RAM, (&banknumber & 0x07) << 3 | (&config & 0x07)
endm

