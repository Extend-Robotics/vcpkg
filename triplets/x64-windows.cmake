set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)

# LGPL dependencies build as dynamic
if(PORT MATCHES "ffmpeg")
    set(VCPKG_LIBRARY_LINKAGE dynamic)
endif()
