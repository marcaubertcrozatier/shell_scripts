#!/bin/sh
#
#
#### DOCUMENTATION PDF
EchoNoCR "Documentation PDF...."
for pdfile in `ls *.pdf`
do
        pdftotext $pdfile tmpdf.txt
        filedate=`grep "P/N" tmpdf.txt | head -1 | awk '{print $2}'`
        rootpdfile=`echo $pdfile | awk -F"." '{print $1}'`
        newname="${rootpdfile}-${filedate}.pdf"
        rm -f tmpdf.txt
        mv $pdfile $newname
done
echo "OK."
