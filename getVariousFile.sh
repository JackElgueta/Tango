#!/bin/bash

root_path="/data/data/com.sgiggle.production/files"
files=`cat files.txt`
# patentes=`tail -n 10000 patentes.txt`
for file in $files
do
	adb pull "$root_path" ../filesFromEmulator/files
done
