#!/usr/bin/env bash
# set -e

echo "checking if containers are built"

#creating logfile with available containers
cd neurodesk
python write_log.py

# remove empty lines
sed -i '/^$/d' log.txt

# remove square brackets
sed -i 's/[][]//g' log.txt

# remove spaces around
sed -i -e 's/^[ \t]*//' -e 's/[ \t]*$//' log.txt

# replace spaces with underscores
sed -i 's/ /_/g' log.txt


while IFS= read -r IMAGENAME_BUILDDATE
do
  echo "$IMAGENAME_BUILDDATE"
    if curl --output /dev/null --silent --head --fail "https://swift.rc.nectar.org.au:8888/v1/AUTH_d6165cc7b52841659ce8644df1884d5e/singularityImages/${IMAGENAME_BUILDDATE}.sif"; then
        echo "${IMAGENAME_BUILDDATE}.sif exists"
    else
        echo "${IMAGENAME_BUILDDATE}.sif does not exist yet"
        exit 2
    fi
done < log.txt

# check if the installer runs:
cd ..
bash build.sh --lxde --edit
bash install.sh

# if it got until here, all containers exist - we can tag a new release:
#tagging release
# buildDate=`date +%Y%m%d`
# echo "tagging this release as ${buildDate}"
# # git tag -d ${buildDate}
# # git push --delete origin ${buildDate}
# git tag ${buildDate} --force
# git push origin --tags --force

#push this to vnm repo:
