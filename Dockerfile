FROM  ubuntu:latest

# Ubuntu sides with libav, I side with ffmpeg.

# Prerequisites
RUN apt-get update
#RUN apt-get install -y -q wget curl
RUN apt-get install -y -q build-essential
RUN apt-get install -y -q cmake
RUN apt-get install -y -q git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev


# Install OpenCV
#RUN apt-get install -y unzip
RUN git clone https://github.com/Itseez/opencv.git \
   && mkdir -p opencv/release \
   && cd opencv/release \
   && cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_PYTHON_SUPPORT=ON -D WITH_XINE=ON -D WITH_TBB=ON .. \
   && make && make install \
   && cd / \
   && rm -rf /opencv
