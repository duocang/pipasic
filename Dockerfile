FROM ubuntu:xenial

RUN apt-get clean

RUN rm -r /var/lib/apt/lists/*

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y \
git \
libpq-dev \
pkg-config \
libfreetype6-dev \
python-matplotlib \
python2.7 \
python-pip \
wget \
vim \
&& apt-get autoremove \
&& apt-get clean

RUN python -m pip install --upgrade pip


RUN git clone https://github.com/duocang/pipasic.git
WORKDIR ./pipasic
RUN pwd
RUN mkdir shared
VOLUME [ "/pipasic/shared" ]
RUN python -m pip install -r requirements.txt

# CMD python pipasic_src/pipasic.py example species1,species2 -I -V -s ../data/spectra/ -d ../data/reference/ -i ./inspect/ -o ../result/output