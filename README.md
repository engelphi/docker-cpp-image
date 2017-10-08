# docker-cpp-image

[![Build Status](https://travis-ci.org/engelphi/docker-cpp-image.svg?branch=master)](https://travis-ci.org/engelphi/docker-cpp-image)

Docker image for building modern c++ libraries and applications.

## Included Packages
  - Clang 5.0 with C++17 Support
  - CMake 3.9.2
  - Googletest + Googlemock 1.8

## Usage
This image can be used as a build environment for Travis-CI which
currently only supports outdated C++-Toolchains due to virtual machines
that still use Ubuntu 12.04 (or 14.04 in "experimental mode") that
ship with outdated packages. An example usage of this image can be
found [here](https://github.com/engelphi/cpp-test).
