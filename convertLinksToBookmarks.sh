#!/bin/bash -e
echo "usage: $0 <txt file containing list of urls>"
inputFile=${1}
if [ $# -ne 1 ] || [ ! -f ${inputFile} ];then
    echo 'check usage'
    exit -1
fi

outputFile='bookmarks-scripted.html'
echo '<DL>' > $outputFile
NumLines=`wc -l ${inputFile} | cut -d' ' -f1`
currLineNum=0

for eachUrl in `cat ${inputFile}`
do
    let currLineNum=${currLineNum}+1
    echo "processing Line ${currLineNum} of ${NumLines}..."
    
    urlTitle=`echo ${eachUrl} | rev | cut -d'/' -f1 | rev`
    if [ -z ${urlTitle} ] || ([[ ${urlTitle} =~ "www" ]] && [[ ${urlTitle} =~ "com" ]]);then
        urlTitle=`echo $eachUrl | cut -d'.' -f2`
    fi
    
    echo ${urlTitle}
    urlLine='<DT><A HREF="'
    urlLine+=${eachUrl}
    urlLine+='">'
    urlLine+=${urlTitle}
    urlLine+='</A>'
    echo ${urlLine} >> $outputFile
    echo
done

echo '</DL>' >> $outputFile