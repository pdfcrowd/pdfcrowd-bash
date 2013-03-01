#!/bin/bash

./pdfcrowd.sh http://www.jagpdf.org -no-config -username $1 -key $2 -host $3 > /dev/null || echo FAILED
echo test | ./pdfcrowd.sh - -no-config -username $1 -key $2 -host $3 > /dev/null || echo FAILED
./pdfcrowd.sh ../test_files/in/simple.html -no-config -username $1 -key $2 -host $3 > /dev/null || echo FAILED