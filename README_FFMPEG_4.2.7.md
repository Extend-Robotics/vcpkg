# Notes

Instructions for building FFmpeg LGPL shared libraries.

## vcpkg

- `vcpkg/ports/ffmpeg/portfile.cmake` was modified for 4.2.7 build with VAAPI
- `vcpkg/triplets/x64-linux.cmake` was modified for shared libraries and rpath set to $ORIGIN

## Platforms

Testend on Ubuntu 20.04

## Building

Dependencies

```bash
# for FFMpeg and building with VAAPI support
sudo apt-get install yasm libva-dev
```

Building

```bash
git clone -b ffmpeg-4.2.7 git@github.com:Extend-Robotics/vcpkg.git
vcpkg/bootstrap-vcpkg.sh
vcpkg/vcpkg install ffmpeg[core,avcodec,swscale,avformat,avfilter]
```

- `.so` libraries are built in `vcpkg/installed/x64-linux/lib`
- `FindFFmpeg.cmake` is located in `vcpkg/installed/x64-linux/share/ffmpeg`

