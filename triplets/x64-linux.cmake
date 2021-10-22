set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)

set(VCPKG_CMAKE_SYSTEM_NAME Linux)

# LGPL dependencies build as dynamic
if(PORT MATCHES "ffmpeg")
    set(VCPKG_LIBRARY_LINKAGE dynamic)
    set(VCPKG_LINKER_FLAGS "-Wl,-rpath,'$$$$ORIGIN'")
endif()
