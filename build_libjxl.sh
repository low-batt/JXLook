#!/bin/bash

git clone https://github.com/libjxl/libjxl.git --recursive
pushd libjxl

mkdir -p build
pushd build


CMAKE_OSX_ARCHITECTURES='x86_64;arm64' cmake -DJPEGXL_STATIC=true -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DCMAKE_OSX_DEPLOYMENT_TARGET='10.15' ..
CMAKE_OSX_ARCHITECTURES='x86_64;arm64' cmake --build . --target jxl-static -- -j
CMAKE_OSX_ARCHITECTURES='x86_64;arm64' cmake --build . --target jxl_threads-static -- -j

popd
popd

mkdir -p jpeg-xl/lib
mkdir -p jpeg-xl/include/jxl
cp -R libjxl/build/lib/libjxl*.a jpeg-xl/lib
cp -R libjxl/build/third_party/highway/libhwy.a jpeg-xl/lib

# Only need decoder, avoid copying the encoder library.
cp -R libjxl/build/third_party/brotli/libbrotlicommon.a jpeg-xl/lib
cp -R libjxl/build/third_party/brotli/libbrotlidec.a jpeg-xl/lib

cp -R libjxl/build/lib/include/jxl/* jpeg-xl/include/jxl/
cp -R libjxl/lib/include/jxl/* jpeg-xl/include/jxl/
