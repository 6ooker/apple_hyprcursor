#!/usr/bin/env bash

version="0.1"

function show_help() {
  echo "Usage: build.sh [OPTIONS]"
  echo "Options:"
  echo "  -h  --help                        Show this help text"
  echo "  -b  --background  <hex-color>     Set background color"
  echo "  -f  --foreground  <hex-color>     Set foreground color"
  echo "  -k  --keepbuild                   Don't delete generated build directory"
  echo ""
  echo "Example: ./build.sh -b '#000000' -f '#FFFFFF' -k"
}

if [ "$#" -eq 0 ]; then
  show_help
  exit 1
fi

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -v | --version )
    echo "build script version: $version"
    exit
    ;;
  -h | --help )
    show_help
    exit
    ;;
  -b | --background )
    shift; bg="$1"
    ;;
  -f | --foreground )
    shift; fg="$1"
    ;;
  -k | --keepbuild )
    keep=1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

# TODO: Error handling / formatting for bg/fg options
# TODO: Better logs

set_color() {
  sed -i -e "s/#00FF00/$2/g" -e "s/#0000FF/$3/g" "$1"/*.svg
}

# Make clean build dir
rm -rf build
mkdir -p build/hyprcursors

for entry in src/*; do 
  cp -r "$entry" build/hyprcursors/
done

cd build || exit

cat << EOF > manifest.hl
name = macOS-hypr
description = macOS hyprcursor theme
version = $version
cursors_directory = hyprcursors
EOF

for file in hyprcursors/*; do
  set_color "$file" "${fg:-#000000}" "${bg:-#FFFFFF}"
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

cd out || exit

mv theme_macOS-hypr macOS-hypr

tar -cJvf "../macOS-hypr.tar.xz" "macOS-hypr" &>/dev/null
PID=$!
wait $PID

if [ $? == 0 ]; then
  cd ..
  rm -rf out
fi
