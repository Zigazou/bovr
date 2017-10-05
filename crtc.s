CRTC_SET: macro register, value
    ld bc, 0xbc00 + &register
    out (c), c
    ld bc, 0xbd00 + &value
    out (c), c
endm

CRTC_SET_HORIZONTAL_TOTAL: macro htotal
    CRTC_SET 0, &htotal & 0xff
endm

CRTC_SET_HORIZONTAL_DISPLAYED: macro hdisplayed
    CRTC_SET 1, &hdisplayed & 0xff
endm

CRTC_SET_HORIZONTAL_SYNC_POSITION: macro hsyncpos
    CRTC_SET 2, &hsyncpos & 0xff
endm

CRTC_SET_HSYNC_VSYNC_WIDTHS: macro hwidth, vwidth
    CRTC_SET 3, (&vwidth & 0x0f) << 4 + (&hwidth & 0x0f)
endm

CRTC_SET_VERTICAL_TOTAL: macro vtotal
    CRTC_SET 4, &vtotal & 0x7f
endm

CRTC_SET_VERTICAL_TOTAL_ADJUST: macro vtotaladjust
    CRTC_SET 5, &vtotaladjust & 0x1f
endm

CRTC_SET_VERTICAL_DISPLAYED: macro vdisplayed
    CRTC_SET 6, &vdisplayed & 0x7f
endm

CRTC_SET_VERTICAL_SYNC_POSITION: macro vsyncpos
    CRTC_SET 7, &vsyncpos & 0x7f
endm

INTERLACE_DISABLED: equ 0x00
INTERLACE_SYNC_RASTER_SCAN_MODE: equ 0x01
INTERLACE_SYNC_VIDEO_RASTER_SCAN_MODE: equ 0x03
CRTC_SET_INTERLACE_SKEW: macro interlacemode
    CRTC_SET 8, &interlacemode & 0x03
endm

CRTC_SET_MAXIMUM_RASTER: macro maxras
    CRTC_SET 9, &maxras & 0x1f
endm

VIDEO_BUFFER_16K: equ 0x00
VIDEO_BUFFER_32K: equ 0x03
VIDEO_PAGE_0000: equ 0x00
VIDEO_PAGE_4000: equ 0x01
VIDEO_PAGE_8000: equ 0x02
VIDEO_PAGE_C000: equ 0x03
CRTC_SET_DISPLAY_START: macro buffer, page, start
    CRTC_SET 12, (&page & 0x03) << 4 | (&buffer & 0x03) << 2 | (&start & 0x3ff) >> 8
    CRTC_SET 13, &start & 0xff
endm

