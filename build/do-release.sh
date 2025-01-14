#!/bin/sh

set -eu

echo "Enter version e.g. 2.9.0"
read str
VERSION=$str
[ -n "$VERSION" ]

echo ""
echo "Are you sure you want to release $VERSION? (press return)"
read str

echo ""
echo "Checking for the symbolic link to the cloud storage to sync Windows and Mac."
[ -e cloud ]

echo ""
echo "Checking for ftplocal directory."
[ -e ftplocal ]

echo ""
echo "Please build Mac apps and press return."
read str

echo ""
echo "Checking for Mac apps."
[ -f cloud/mac.dmg ]
[ -f cloud/mac-pro.dmg ]

echo ""
echo "Building Emscripten files."
cd emscripten
make clean
make
cd ../

echo ""
echo "Building suika.exe"
cd mingw
make clean
./build-libs.sh
make -j24
cp suika.exe ../cloud/
cd ../

echo ""
echo "Building suika-pro.exe"
cd mingw-pro
make clean
cp -Rav ../mingw/libroot .
make -j24
cp suika-pro.exe ../cloud/
cd ../

echo ""
echo "Please sign the Windows apps and press return."
read str
[ -f cloud/suika.exe ]
[ -f cloud/suika-pro.exe ]

echo ""
echo "Creating Windows/Mac release files."
cd release
make clean
make
cp suika-2.x.x-en.zip "../ftplocal/suika-$VERSION-en.zip"
cp suika-2.x.x-jp.zip "../ftplocal/suika-$VERSION-jp.zip"
cd ../

echo ""
echo "Creating Web distribution kit release files."
cd web-kit
make clean
make
cp suika2-web-kit-2.x.x-en.zip "../ftplocal/suika2-web-kit-$VERSION-en.zip"
cp suika2-web-kit-2.x.x-jp.zip "../ftplocal/suika2-web-kit-$VERSION-jp.zip"
cd ../

echo ""
echo "Stop if this is a pre-release."
echo ""
read str

echo ""
echo "Uploading release files."
cd ftplocal
ftpupload.sh "suika-$VERSION-en.zip"
sleep 5
ftpupload.sh "suika-$VERSION-jp.zip"
sleep 5
ftpupload.sh "suika2-web-kit-$VERSION-en.zip"
sleep 5
ftpupload.sh "suika2-web-kit-$VERSION-jp.zip"
cd ../

echo ""
echo "Release completed."
