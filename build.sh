#!/bin/bash

BASE_FILENAME="Clayton-Ketner_"
FILENAME_SUFFIX="Resume"
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

if [ $CURRENT_BRANCH != master ] ; then
    FILENAME_SUFFIX=$CURRENT_BRANCH
fi

FULL_FILENAME=`printf "%s%s" $BASE_FILENAME $FILENAME_SUFFIX`

export TEXINPUTS="sty//:"  # Include the ./sty dir
pdflatex -output-format pdf -jobname $FULL_FILENAME -output-directory output resume.tex
if [[ "$(uname)" == "Linux" ]]; then
	xdg-open output/$FULL_FILENAME.pdf
elif [[ "$(uname)" == "Darwin" ]]; then
	open -a Preview output/$FULL_FILENAME.pdf
else
	echo "I don't know how to open the output PDF on this OS."
fi
echo "Done"
