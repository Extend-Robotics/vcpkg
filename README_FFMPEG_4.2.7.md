# Notes

Instructions for building FFmpeg LGPL shared libraries with `nvmpi` (newer NVUtils variant, not nvbuf_utils) support on Nvidia Jetson.

See [jetson-ffmpeg](https://github.com/Extend-Robotics/jetson-ffmpeg) for more context.

## vcpkg

- `vcpkg/ports/ffmpeg/portfile.cmake` was modified for 4.2.7 build with `nvmpi`
- `vcpkg/triplets/community/arm64-linux.cmake` was modified for shared libraries and rpath set to $ORIGIN

## Platforms

Testend with Jetson AGX Orin on Ubuntu 20.04

## Dependencies

Tested on Jetson AGX Orin

vcpkg for arm64 needs newer CMake

```bash
wget https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2.tar.gz

tar -xvf cmake-3.25.2.tar.gz
cd cmake-3.25.2
./bootstrap
make -j8

sudo apt-get install checkinstall
# this will take more time than you expect
sudo checkinstall --pkgname=cmake --pkgversion="3.25.2-custom" --default
# reset shell cache for tools paths
hash -r
```

```bash
git clone https://github.com/Extend-Robotics/jetson-ffmpeg.git
cd jetson-ffmpeg
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
sudo make install
sudo ldconfig

```

```bash
sudo apt install ninja
```

## Building

Tested on Jetson AGX Orin


```bash
git clone -b ffmpeg-4.2.7-jetson-nvmpi git@github.com:Extend-Robotics/vcpkg.git
vcpkg/bootstrap-vcpkg.sh

# required for VCPKG build on arm Jetson
export VCPKG_FORCE_SYSTEM_BINARIES=1
vcpkg/vcpkg install ffmpeg[core,avcodec,swscale,avformat,avfilter]
```

- `.so` libraries are built in `vcpkg/installed/arm64-linux/lib`
- `FindFFmpeg.cmake` is located in `vcpkg/installed/arm64-linux/share/ffmpeg`

