# Notes

Instructions for building FFmpeg LGPL shared libraries.

## vcpkg

- `vcpkg/ports/ffmpeg/portfile.cmake` was modified for 3.4.8 build
- `vcpkg/triplets/x64-linux.cmake` was modified for shared libraries and rpath set to $ORIGIN

## Platforms

Testend on Ubuntu 18.04

## Building

Dependencies

```bash
# for building with VAAPI support
sudo apt-get install libva-dev
```

Building

```bash
vcpkg/bootstrap-vcpkg.sh
vcpkg/vcpkg install ffmpeg[core,avcodec,swscale,avformat]
```

- `.so` libraries are built in `vcpkg/installed/x64-linux/lib`
- `FindFFmpeg.cmake` is located in `vcpkg/installed/x64-linux/share/ffmpeg`

