#!/bin/bash
rmmod dvb_usb_rtl28xxu rtl2832
freq=94.1
rtl_fm -f ${freq}M -M fm -s 200k -A std -E deem -r 44.1k - |  aplay -r 44100 -f S16_LE 

