#docker run -it -v $(pwd)/youtube_down:/root/youtube_down zjb0807/youtube-dl bash
FROM ubuntu:16.04

# install ffmpeg
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:djcj/hybrid && \
    apt-get update && \
    apt-get install -y git wget curl ffmpeg python

# install youtube-dl
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
    chmod 0777 /usr/local/bin/youtube-dl

RUN echo '# youtube-dl --proxy localhost:12345 -F http://www.youtube.com/watch?v=5r6yzFEXajQ' >> /root/README && \
    echo '# youtube-dl --proxy localhost:12345 -f bestvideo+bestaudio url' >> /root/README && \
    echo 'youtube-dl -F http://www.youtube.com/watch?v=5r6yzFEXajQ //查询视频格式列表' >> /root/README && \
    echo 'youtube-dl -f bestvideo+bestaudio http://www.youtube.com/watch?v=5r6yzFEXajQ //下载最高质量包含音频的视频' >> /root/README && \
    echo '' >> /root/README && \
    echo 'youtubd-dl --write-sub [url] //这样会下载一个vtt格式的英文字幕和mkv格式的1080p视频下来' >> /root/README && \
    echo 'youtube-dl --write-sub --skip-download [url] //下载单独的vtt字幕文件,而不会下载视频' >> /root/README && \
    echo 'youtube-dl --write-sub --all-subs [url] //下载所有语言的字幕(如果有的话)' >> /root/README && \
    echo 'youtube-dl --write-auto-sub [url] //下载自动生成的字幕(YouTube only)' >> /root/README 

WORKDIR /root

