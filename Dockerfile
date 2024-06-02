FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y \
    autoconf \
    gettext \
    pkg-config \
    git \
    libexpat1-dev \
    automake \
    make \
    g++ gcc \
    libtool \
    gnulib \
    gnutls-dev \
    libreadline-dev \
    zlib1g-dev 

WORKDIR /app/

RUN git clone https://github.com/lavv17/lftp.git

# WORKDIR /opt/lftp

# RUN git clone git://git.savannah.gnu.org/gnulib /opt/gnulib

# ENV PATH="/opt/gnulib:${PATH}"

WORKDIR /app/lftp

RUN ./autogen.sh

RUN make

RUN make install

CMD ["lftp"]