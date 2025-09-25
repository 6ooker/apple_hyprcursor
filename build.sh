#!/usr/bin/env bash

version="0.1"

base="#000000"
outline="#FFFFFF"

set_default_color() {
  sed -i -e "s/#00FF00/$base/g" -e "s/#0000FF/$outline/g" $1/*.svg
}

# Make clean build dir
rm -rf build
mkdir -p build/hyprcursors

for entry in src/*; do 
  cp -r "$entry" build/hyprcursors/
done

cd build

echo "name = macOS-hypr" >> manifest.hl
echo "description = macOS hyprcursor theme" >> manifest.hl
echo "version = $version" >> manifest.hl
echo "cursors_directory = hyprcursors" >> manifest.hl

for file in hyprcursors/*; do
  set_default_color $file
done

cd ..

mkdir out

hyprcursor-util -c build -o out &
PID=$!
wait $PID

if [ $? == 0 ]; then
  rm -rf build
fi

cd out

mv theme_macOS-hypr macOS-hypr

tar -cJvf "../macOS-hypr.tar.xz" "macOS-hypr" &
PID=$!
wait $PID

if [ $? == 0 ]; then
  cd ..
  rm -rf out
fi