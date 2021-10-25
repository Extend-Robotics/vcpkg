# Notes

Instructions for building FFmpeg LGPL shared libraries.

## vcpkg

- `vcpkg/ports/ffmpeg/portfile.cmake` was modified for FFmpeg 4.4 for various platforms build
- `vcpkg/triplets/...` were modified for shared FFmpeg libraries and rpath set to $ORIGIN

## Platforms

Testend on Ubuntu 18.04

## Building

### Linux

```bash
git clone -b ffmpeg-4.4 git@github.com:Extend-Robotics/vcpkg.git
vcpkg/bootstrap-vcpkg.sh
vcpkg/vcpkg install ffmpeg[core,avcodec,swscale]
```

### Windows

```bash
git clone -b ffmpeg-4.4 git@github.com:Extend-Robotics/vcpkg.git
vcpkg\bootstrap-vcpkg.bat
vcpkg\vcpkg install ffmpeg[core,avcodec,swscale]
```

### Android

Tested on Ubuntu 18.04

```bash
export ANDROID_NDK_HOME=[YOUR_NDK_PATH]
git clone -b ffmpeg-4.4 git@github.com:Extend-Robotics/vcpkg.git
vcpkg/bootstrap-vcpkg.sh

export VCPKG_DEFAULT_TRIPLET=arm64-android
vcpkg/vcpkg install ffmpeg[core,avcodec,swscale]
```
