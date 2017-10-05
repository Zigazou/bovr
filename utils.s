MEMCPY: macro source, destination, length
    ld de, &destination
    ld hl, &source
    ld bc, &length
    ldir
endm
