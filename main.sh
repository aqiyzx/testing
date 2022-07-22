BITRATE="2500k" # Bitrate of the output video
FPS="30" # FPS video output
QUAL="normal" # FFMPEG quality preset
YOUTUBE_URL="rtmp://x.rtmp.youtube.com/live2" # Youtube RTMP base URL
IMAGE="https://i.imgur.com/R5wA66L.jpg" #Picture
SOURCE="http://145.239.254.146:8060/192h" # Radio Station
KEY="4mkp-0570-xf06-7gb5-41dx" # Stream name/key
SIZE="1280x720"
FRAMERATE="2"

    ffmpeg -re -loop 1 \
    	-framerate "$FRAMERATE" \
    	-i "$IMAGE" \
    	-i "$SOURCE" \
    	-c:a aac \
    	-s "$SIZE" \
    	-ab 128k \
    	-b:v "$BITRATE" \
    	-threads 6 \
    	-q:a 3 \
    	-preset veryfast \
    	-vcodec libx264 \
    	-pix_fmt yuv420p \
    	-maxrate 1800k \
    	-bufsize 2300k \
        -framerate 30 \
    	-g 2 \
    	-strict experimental \
    	-f flv \
    	"$YOUTUBE_URL/$KEY"
     ffplay -fflags nobuffer -flags low_delay -framedrop \
        -strict experimental -rtsp_transport tcp rtsp://2a01:4f8:211:1e1a:face:0d35:526e:0001:22
     
#
#  Created by Roman on 04/22/2019.
#  Copyright © 2019 akhromieiev.com. All rights reserved.
