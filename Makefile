ALL: bovr.dsk bovr.bin dsk

bovr.bin: bovr.z80 crtc.s gatearray.s firmware.s utils.s
	zasm --cycles --z80 bovr.z80 -o bovr.bin
	addamsdosheader bovr.bin binary 3000 3000

bovr.dsk:
	cpcxfs -nd bovr.dsk

dsk: bovr.bin bovr.dsk bovr.bas
	cpcxfs bovr.dsk -f -p bovr.bin
	cpcxfs bovr.dsk -f -p bovr.bas

run: dsk
	cap32 bovr.dsk --autocmd='run"bovr"'
