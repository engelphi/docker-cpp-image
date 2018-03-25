FROM        gcc:latest
MAINTAINER  Philipp Engel <philipp.engel.1990@googlemail.com>

RUN apt-get update && apt-get -y install \
  apt-utils \
  build-essential \
  curl \
  doxygen \
  git \
  tar \
  wget \
  xz-utils

RUN wget -q -O /tmp/cmake.tar.gz --no-check-certificate \
  https://cmake.org/files/v3.9/cmake-3.9.2-Linux-x86_64.tar.gz && \
  tar -xaf /tmp/cmake.tar.gz --strip-components=1 -C /usr/local && \
  rm /tmp/cmake.tar.gz

RUN wget -q -O /tmp/clang.tar.xz --no-check-certificate \
  http://releases.llvm.org/5.0.0/clang+llvm-5.0.0-x86_64-linux-gnu-debian8.tar.xz && \
  tar -xaf /tmp/clang.tar.xz --strip-components=1 -C /usr/local && \
  rm /tmp/clang.tar.xz

RUN wget -q -O /tmp/gtest.tar.gz --no-check-certificate \
  https://github.com/google/googletest/archive/release-1.8.0.tar.gz && \
  cd /tmp/ && tar -xf gtest.tar.gz && cd googletest-release-1.8.0 && \
  cmake -DBUILD_SHARED_LIBS=ON && \
  make && \
  cp -ra googletest/include/* /usr/include && \
  cp -ra googlemock/include/* /usr/include && \
  cp -a googlemock/libgmock.so googlemock/libgmock_main.so \
        googlemock/gtest/libgtest_main.so\
        googlemock/gtest/libgtest.so /usr/lib/ && \
  ldconfig -v && rm /tmp/gtest.tar.gz  && \
  rm -r /tmp/googletest-release-1.8.0

RUN wget -q -O /tmp/lcov.tar.gz --no-check-certificate \
  http://downloads.sourceforge.net/ltp/lcov-1.13.tar.gz && \
  cd /tmp/ && tar -xf /tmp/lcov.tar.gz && cd lcov-1.13 && \
  make install && cd ../ && rm /tmp/lcov.tar.gz && rm -r lcov-1.13 

RUN wget -q -O /tmp/cppcheck.tar.gz --no-check-certificate \
  http://github.com/danmar/cppcheck/releases/download/1.81/cppcheck-1.81.tar.gz && \
  cd /tmp/ && tar -xf /tmp/cppcheck.tar.gz && cd cppcheck-1.81 && \
  mkdir build && cd build && cmake -DCMAKE_CXX_COMPILER=clang++ .. && make && make install && \
  cd /tmp/ && rm -r cppcheck.tar.gz cppcheck-1.81


CMD         bash
