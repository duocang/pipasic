FROM ubuntu:xenial

RUN apt-get clean


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
&& apt-get autoremove \
&& apt-get clean

RUN python -m pip install --upgrade pip

RUN git clone https://gitlab.com/wangxuesong29/pipasic.git
WORKDIR /pipasic

RUN mkdir shared
VOLUME [ "/pipasic/shared" ]
RUN rm -rf /pipasic/data
RUN python -m pip install -r requirements.txt


CMD python pipasic_src/pipasic.py
