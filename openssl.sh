#!/bin/bash
set -e
set -x

cd openssl


./Configure --prefix=${PWD}/build/aarch64-apple-darwin \
    --openssldir=${PWD}/build/aarch64-linux-android/openssl_dir

# Build
make
make install
make clean




# Find the toolchain for your build machine
TOOL_CHAINS_PATH=${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/darwin-x86_64
export PATH=${TOOL_CHAINS_PATH}/bin:$PATH
# Set the Android API levels
ANDROID_API=28
# Configure the OpenSSL environment, refer to NOTES.ANDROID in OPENSSL_DIR
# Set compiler clang, instead of gcc by default
# Add toolchains bin directory to PATH
export AR=$TOOL_CHAINS_PATH/bin/llvm-ar
export RANLIB=$TOOL_CHAINS_PATH/bin/llvm-ranlib
export STRIP=$TOOL_CHAINS_PATH/bin/llvm-strip



Set the target architecture
Can be android-arm, android-arm64, android-x86, android-x86 etc
architecture=android-arm64
# Create the make file

export CC=$TOOL_CHAINS_PATH/bin/aarch64-linux-android28-clang
./Configure android-arm64 \
    -D__ANDROID_API__=${ANDROID_API} \
    --prefix=${PWD}/build/aarch64-linux-android \
    --openssldir=${PWD}/build/aarch64-linux-android/openssl_dir \
    CC=${TOOL_CHAINS_PATH}/bin/aarch64-linux-android28-clang CXX=${TOOL_CHAINS_PATH}/bin/aarch64-linux-android28-clang++

# Build
make
make install
make clean



# # Configure the OpenSSL environment, refer to NOTES.ANDROID in OPENSSL_DIR
# # Set compiler clang, instead of gcc by default
# # Add toolchains bin directory to PATH


# # Set the target architecture
# # Can be android-arm, android-arm64, android-x86, android-x86 etc
# architecture=android-arm
# # Create the make file


export CC=$TOOL_CHAINS_PATH/bin/armv7a-linux-androideabi28-clang
./Configure android-arm \
    -D__ANDROID_API__=${ANDROID_API} \
    --prefix=${PWD}/build/armv7-linux-androideabi \
    --openssldir=${PWD}/build/armv7-linux-androideabi/openssl_dir \
    CC=${TOOL_CHAINS_PATH}/bin/armv7a-linux-androideabi28-clang CXX=${TOOL_CHAINS_PATH}/bin/armv7a-linux-androideabi28-clang++

# Build
make
make install
make clean
