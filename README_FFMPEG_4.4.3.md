# Notes

Instructions for building FFmpeg LGPL shared libraries with `nvmpi` (newer NVUtils variant, not nvbuf_utils) support on Nvidia Jetson.

See [jetson-ffmpeg](https://github.com/Extend-Robotics/jetson-ffmpeg-keylost) for more context.

## vcpkg

- `vcpkg/ports/ffmpeg/portfile.cmake` was modified for 4.4.3 build with `nvmpi`
- `vcpkg/triplets/community/arm64-linux.cmake` was modified for shared libraries and rpath set to $ORIGIN

## Platforms

Testend with Jetson AGX Orin on Ubuntu 22.04

## Dependencies

Tested on Jetson AGX Orin


```bash
git clone https://github.com/Extend-Robotics/jetson-ffmpeg-keylost.git
cd jetson-ffmpeg-keylost
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
sudo make install
sudo ldconfig
```

```bash
sudo apt install ninja-build nasm
```

## Building

Tested on Jetson AGX Orin


```bash
git clone -b ffmpeg-4.4.3-jetson-nvmpi https://github.com/Extend-Robotics/vcpkg.git
vcpkg/bootstrap-vcpkg.sh

# required for VCPKG build on arm Jetson
export VCPKG_FORCE_SYSTEM_BINARIES=1
vcpkg/vcpkg install ffmpeg[core,avcodec,swscale,avformat,avfilter]
```

- `.so` libraries are built in `vcpkg/installed/arm64-linux/lib`
- `FindFFmpeg.cmake` is located in `vcpkg/installed/arm64-linux/share/ffmpeg`

