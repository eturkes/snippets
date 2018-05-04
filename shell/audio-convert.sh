#!/bin/bash
VIDEOCODEC="Mpeg2"
AUDIOCODEC="AC3"
for FIL in `ls *MP4 | sort` ; do
avidemux3_cli --video-codec $VIDEOCODEC --audio-codec $AUDIOCODEC --force-alt-h264 --load "$FIL" --save ${FIL%.*}.avi --quit
done
