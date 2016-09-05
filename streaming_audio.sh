#!/bin/bash
rmmod dvb_usb_rtl28xxu rtl2832
freq=94.1
rtl_fm -f ${freq}M -M fm -s 200k -A std -l0  -E deem -r 44.1k - |  avconv -f s16le -ar 44100 -i pipe:0 -acodec libmp3lame -ab 128k -f rtp rtp://172.16.200.132:1234 

