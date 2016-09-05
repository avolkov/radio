#!/bin/bash
output="output/$(date +%Y-%m-%d)-thesignal.ogv"
freq=94.1
rtl_fm -f ${freq}M -M fm -s 200k -A std -E deem -r 44.1k - |  avconv -f s16le -ar 44100 -i pipe:0  -acodec libvorbis -qscale:a 7  "${output}" &
sleep 7230
kill $(ps aux | grep rtl_fm | grep deem | awk '{print $2}')
scp ${output} athena.flamy.ca:~/storage/radio

