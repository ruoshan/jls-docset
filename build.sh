#!/bin/sh

if [ $# -ne 1 ]; then
    echo "./build.sh version"
    exit 1
fi

rm -rf JLS.docset JLS.tgz

cp -r JLS.docset-tmpl/ JLS.docset
sed -i "" -e "s/_VERSION_/$1/g" JLS.docset/Contents/Info.plist
cp -r Documents/$1 JLS.docset/Contents/Resources/Documents/
./gen.py $1
mv docSet.dsidx JLS.docset/Contents/Resources/

tar zcf JLS.tgz JLS.docset
