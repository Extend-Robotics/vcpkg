set(VCPKG_TARGET_ARCHITECTURE arm64)
set(VCPKG_CRT_LINKAGE static)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CMAKE_SYSTEM_NAME Android)

# LGPL dependencies build as dynamic
if(PORT MATCHES "ffmpeg")
    set(VCPKG_LIBRARY_LINKAGE dynamic)
endif()
