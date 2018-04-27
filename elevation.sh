echo "Starting download tiles for elevation"
# /home/mersad/anaconda3/bin/python3 scraper.py --poly poly.geojson --retries 1 --zoom 15 --url https://api.mapbox.com/v4/mapbox.terrain-rgb/{z}/{x}/{y}.pngraw?access_token=pk.eyJ1IjoibWVyc2FkcGFzaWMiLCJhIjoiY2lqenc1ZnpkMDA2N3ZrbHo4MzQ2Z2YzZyJ9.TIDhGaRGIYtw9_f_Yb3Ptg --out-dir tiles/elevation
python scraper.py --poly poly.geojson --retries 1 --zoom 15 --url https://api.mapbox.com/v4/mapbox.terrain-rgb/{z}/{x}/{y}.pngraw?access_token=pk.eyJ1IjoibWVyc2FkcGFzaWMiLCJhIjoiY2lqenc1ZnpkMDA2N3ZrbHo4MzQ2Z2YzZyJ9.TIDhGaRGIYtw9_f_Yb3Ptg --out-dir tiles/elevation
echo "Tiles download for elevation finished!"
# /home/mersad/anaconda3/bin/python3 stitcher.py --dir tiles/elevation --out-file out/elevation.png
python stitcher.py --dir tiles/elevation --out-file out/elevation.png
echo "Deleting tiles..."
rm -f -R tiles/elevation
