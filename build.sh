#!/usr/bin/env bash

version="0.1"

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -V | --version )
    echo "build script version: $version"
    exit
    ;;
  -bg | --background )
    shift; bg=$1
    ;;
  -fg | --forground )
    shift; fg=$1
    ;;
  -k | --keepbuild )
    keep=1
    ;;
  -f | --flag )
    flag=1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

# TODO: Error handling / formatting for bg/fg options
# TODO: Help
# TODO: Verbose logs

set_color() {
  sed -i -e "s/#00FF00/$2/g" -e "s/#0000FF/$3/g" $1/*.svg
}

# Make clean build dir
rm -rf build
mkdir -p build/hyprcursors

for entry in src/*; do 
  cp -r "$entry" build/hyprcursors/
done

cd build

cat << EOF > manifest.hl
name = macOS-hypr
description = macOS hyprcursor theme
version = $version
cursors_directory = hyprcursors
EOF

for file in hyprcursors/*; do
  set_color $file "${fg:-#000000}" "${bg:-#FFFFFF}"
done

cd ..

mkdir out

hyprcursor-util -c build -o out &>/dev/null
PID=$!
wait $PID

if [ $? == 0 ]; then
  if [ ! $keep ]; then
    rm -rf build
  fi
fi

cd out

mv theme_macOS-hypr macOS-hypr

tar -cJvf "../macOS-hypr.tar.xz" "macOS-hypr" &>/dev/null
PID=$!
wait $PID

if [ $? == 0 ]; then
  cd ..
  rm -rf out
fi