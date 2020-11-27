#!/usr/bin/env bash

set -e
set -o pipefail

RED="\033[0;31m"
BLUE="\033[0;34m"
NC="\033[0m"

### ====== ###
echo -e "${BLUE}  > Cleaning old builds...${NC}"

rm -rf build indoorlocation Pods
mkdir -p build indoorlocation/simulator indoorlocation/device
### ====== ###

### ====== ###
echo -e "${BLUE}  > Building for Cocoapods...${NC}"

# Build for simulator
xcodebuild -configuration Release -sdk iphonesimulator CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY= ONLY_ACTIVE_ARCH=NO ARCHS="x86_64" BITCODE_GENERATION_MODE="bitcode" DSTROOT="$(pwd)/build/dst" OBJROOT="$(pwd)/build/obj" OTHER_CFLAGS="-fembed-bitcode" SHARED_PRECOMPS_DIR="$(pwd)/build/shared" SYMROOT="$(pwd)/build/sym" build | xcpretty -s
if [ ! -d ./build/sym/Release-iphonesimulator/IndoorLocation.framework ]; then
  echo -e "${RED}  > The IndoorLocation framework for simulator does not exist${NC}"
  exit 1
fi
cp -R build/sym/Release-iphonesimulator/IndoorLocation.framework indoorlocation/simulator

# Clean
rm -rf build
mkdir build

# Build for device
xcodebuild -configuration Release -sdk iphoneos CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY= ONLY_ACTIVE_ARCH=NO ARCHS="arm64" BITCODE_GENERATION_MODE="bitcode" DSTROOT="$(pwd)/build/dst" OBJROOT="$(pwd)/build/obj" OTHER_CFLAGS="-fembed-bitcode" SHARED_PRECOMPS_DIR="$(pwd)/build/shared" SYMROOT="$(pwd)/build/sym" build | xcpretty -s
if [ ! -d ./build/sym/Release-iphoneos/IndoorLocation.framework ]; then
  echo -e "${RED}  > The IndoorLocation framework for device does not exist${NC}"
  exit 1
fi
cp -R build/sym/Release-iphoneos/IndoorLocation.framework indoorlocation/device
cp -R build/sym/Release-iphoneos/IndoorLocation.framework indoorlocation

# Merge both UIs
lipo -create "indoorlocation/simulator/IndoorLocation.framework/IndoorLocation" "indoorlocation/device/IndoorLocation.framework/IndoorLocation" -output "indoorlocation/IndoorLocation.framework/IndoorLocation"
### ====== ###

### ====== ###
echo -e "${BLUE}  > Shipping...${NC}"

(cd "indoorlocation"; zip -qr "IndoorLocation.framework.zip" "IndoorLocation.framework")
if [ ! -f ./indoorlocation/IndoorLocation.framework.zip ]; then
  echo -e "${RED}  > The IndoorLocation.framework.zip does not exist${NC}"
  exit 1
fi
### ====== ###

exit 0
