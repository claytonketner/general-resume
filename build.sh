#!/bin/sh
BASE_FILENAME="Clayton-Ketner_"
FILENAME_SUFFIX="General-Resume"
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

if [ $CURRENT_BRANCH != master ] ; then
    FILENAME_SUFFIX=$CURRENT_BRANCH
fi

FULL_FILENAME=`printf "%s%s" $BASE_FILENAME $FILENAME_SUFFIX`

pdflatex -output-format pdf -jobname $FULL_FILENAME -output-directory output resume.tex
open -a Preview output/$FULL_FILENAME.pdf
