#!/usr/bin/env sh

if [ ! -d _build ]
then
    echo "NOT"
    mkdir _build
fi
cd _build
cmake ..
make -j2
install_name_tool -change "@executable_path/Chromium Embedded Framework" "@executable_path/../Frameworks/Chromium Embedded Framework.framework/Chromium Embedded Framework" appteros

cd ..

rm -rf Appteros.app
mkdir -p Appteros.app/Contents/{Frameworks,MacOS,Resources}
cp -r ../Frameworks/Chromium\ Embedded\ Framework.framework Appteros.app/Contents/Frameworks
cp -r ../Frameworks/libplugin_carbon_interpose.dylib Appteros.app/Contents/Frameworks

cp mac/PkgInfo mac/Info.plist Appteros.app/Contents
cp -r mac/appteros.icns mac/English.lproj Appteros.app/Contents/Resources

cp _build/appteros Appteros.app/Contents/MacOS
