#!/bin/bash
if [ "$1" = "" ]; then
    echo "Missing start year parameter"
else
    if [ "$2" = "" ]; then
        echo "Missing end year parameter"
    else
        i="$1"
        e="$2"
        while [ $i -lt $e ]
        do
            echo "Testing tiles for year $i"
            if curl --output /dev/null --silent --head --fail "http://wpc.4693.edgecastcdn.net/004693/tiles/area/$i/Z6/24/36.png?v=20"
            then
                # echo "OK - $yourURL"
                echo "Starting download tiles for year $i"
                /home/datasoft/anaconda3/bin/python scraper.py --poly poly.geojson --retries 1 --zoom 6 --url http://wpc.4693.edgecastcdn.net/004693/tiles/area/$i/Z{z}/{y}/{x}.png?v=20 --out-dir tiles/$i
                echo "Tiles download for year $i finished!"
                /home/datasoft/anaconda3/bin/python stitcher.py --dir tiles/$i --out-file out/$i.png
                echo "Deleting tiles..."
                rm -f -R tiles/$i
                echo "Year $i finished!"
            else
                echo "Year $i skipped!"
            fi
            i=$[$i+1]
        done
    fi
fi