#!/bin/tcsh -f

# Linux: -c = do not get file if already done.
if (`uname` == "Linux") then
	set mwget = "wget -c -nv --no-check-certificate"
# Mac: makes it quite and show nice progress
else if (`uname` == "Darwin") then
	set mwget = "wget -qc --show-progress --no-check-certificate"
endif


rm -rf coat*jar jcsg*jar vecmath*jar

set COATJAVA = 6b.2.0

echo Dowloading coatjava version $COATJAVA from: https://github.com/JeffersonLab/clas12-offline-software/releases/download/$COATJAVA/coatjava-$COATJAVA".tar.gz"

$mwget  --trust-server-names https://github.com/JeffersonLab/clas12-offline-software/releases/download/$COATJAVA/coatjava-$COATJAVA".tar.gz" -O coatjava-$COATJAVA".tar.gz"
tar -xvf coatjava-$COATJAVA".tar.gz"
cp coatjava/lib/clas/* .

