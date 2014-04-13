#!/usr/bin/env sh

if [ ! -d _build ]
then
    echo "NOT"
    mkdir _build
fi
cd _build
cmake ..
make -j2
install_name_tool -change "@executable_path/Chromium Embedded Framework" "../Frameworks/Chromium Embedded Framework.framework/Chromium Embedded Framework" appteros

cd ..
