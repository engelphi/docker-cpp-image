# docker-cpp-image

[![Build Status](https://travis-ci.org/engelphi/docker-cpp-image.svg?branch=master)](https://travis-ci.org/engelphi/docker-cpp-image)

Docker image for building modern c++ libraries and applications.

## Included Packages
  - Clang 7.0.0
  - GCC 8.2
  - CMake 3.13.0
  - Googletest + Googlemock 1.8.5
  - lcov 1.13
  - clang-tidy (7.0.0)
  - cppcheck 1.85

## Usage
This image can be used as a build environment for Travis-CI which
currently only supports outdated C++-Toolchains due to virtual machines
that still use Ubuntu 12.04 (or 14.04 in "experimental mode") that
ship with outdated packages. An example usage of this image can be
found [here](https://github.com/engelphi/cpp-test).
