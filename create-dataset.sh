#!/usr/bin/env bash

OUTDIR="data"
mkdir $OUTDIR

cd $OUTDIR

#!/usr/bin/env bash

wget -nc http://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_NE_250m_TIF.rar 
unar -f SRTM_NE_250m_TIF.rar -o ../data -D 
rm -rf SRTM_NE_250m_TIF.rar 
echo create tiles: SRTM_NE_250m
../create-tiles.sh SRTM_NE_250m.tif 10 10 
rm -rf SRTM_NE_250m.tif
echo --------------------------------------------------------------------------------

wget -nc http://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_W_250m_TIF.rar 
unar -f SRTM_W_250m_TIF.rar -o ../data -D 
rm -rf SRTM_W_250m_TIF.rar
echo create tiles: SRTM_W_250m
../create-tiles.sh SRTM_W_250m.tif 10 20 
rm -rf SRTM_W_250m.tif
echo --------------------------------------------------------------------------------

wget -nc http://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_SE_250m_TIF.rar  
unar -f SRTM_SE_250m_TIF.rar -o ../data -D 
rm -rf SRTM_SE_250m_TIF.rar
echo create tiles: SRTM_SE_250m
../create-tiles.sh SRTM_SE_250m.tif 10 10 
rm -rf SRTM_SE_250m.tif
echo --------------------------------------------------------------------------------

echo removing unused data
rm -rf readme.txt TIFF-Files-here.md

echo --------------------------------------------------------------------------------
echo all the necessary data downloaded
echo --------------------------------------------------------------------------------