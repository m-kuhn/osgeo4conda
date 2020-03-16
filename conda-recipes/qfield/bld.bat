mkdir build
if errorlevel 1 exit 1
cd build
if errorlevel 1 exit 1

set BUILDCONF=Release

call "%VSINSTALLDIR%/VC/vcvarsall.bat" amd64

cmake -G Ninja ^
    -D CMAKE_CXX_COMPILER="%CMAKE_COMPILER_PATH%/cl.exe" ^
    -D CMAKE_C_COMPILER="%CMAKE_COMPILER_PATH%/cl.exe" ^
    -D CMAKE_LINKER="%CMAKE_COMPILER_PATH%/link.exe" ^
    -D CMAKE_BUILD_TYPE=%BUILDCONF% ^
    -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    ..
if errorlevel 1 exit 1

ninja -j%CPU_COUNT%
if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
