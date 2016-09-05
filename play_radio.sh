#!/bin/bash
rmmod dvb_usb_rtl28xxu rtl2832
rtl_fm -f 94.1e6 -M wbfm -s 200000 -r 44100 - | aplay -r 44100 -f S16_LE
#rtl_fm -f 94.1e6 -M wbfm -s 200000 -r 48000 - | aplay -r 48000 -f S16_LE

