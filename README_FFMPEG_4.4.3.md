# Notes

Instructions for building FFmpeg LGPL shared libraries.


## vcpkg

- `vcpkg/ports/ffmpeg/portfile.cmake` was modified for 4.4.3 build with VAAPI
- `vcpkg/triplets/community/x64-linux.cmake` was modified for shared libraries and rpath set to $ORIGIN

## Platforms

Testend on Ubuntu 22.04

## Building

Dependencies

```bash
# for FFMpeg and building with VAAPI support
sudo apt-get install yasm libva-dev
```

```bash
git clone -b ffmpeg-4.4.3 git@github.com:Extend-Robotics/vcpkg.git
vcpkg/bootstrap-vcpkg.sh
vcpkg/vcpkg install ffmpeg[core,avcodec,swscale,avformat,avfilter,nvcodec]
```


- `.so` libraries are built in `vcpkg/installed/arm64-linux/lib`
- `FindFFmpeg.cmake` is located in `vcpkg/installed/arm64-linux/share/ffmpeg`

- `.so` libraries are built in `vcpkg/installed/x64-linux/lib`
- `FindFFmpeg.cmake is located in vcpkg/installed/x64-linux/share/ffmpeg`
