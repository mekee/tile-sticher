#!/bin/bash
if [ "$1" = "" ]; then
  echo "Missing year parameter"
else
    if curl --output /dev/null --silent --head --fail "http://wpc.4693.edgecastcdn.net/004693/tiles/area/$1/Z6/24/36.png?v=20"
    then
        # echo "OK - $yourURL"
        echo "Starting download tiles for year $1"
        /home/datasoft/anaconda3/bin/python scraper.py --poly poly.geojson --retries 1 --zoom 6 --url http://wpc.4693.edgecastcdn.net/004693/tiles/area/$1/Z{z}/{y}/{x}.png?v=20 --out-dir tiles/$1
        echo "Tiles download for year $1 finished!"
        /home/datasoft/anaconda3/bin/python stitcher.py --dir tiles/$1 --out-file out/$1.png
        echo "Deleting tiles..."
        rm -f -R tiles/$1
        echo "Year $1 finished!"
    else
        echo "Year $1 skipped!"
    fi
fi