#!/bin/bash

BASE_FILENAME="Clayton-Ketner_"
FILENAME_SUFFIX="Resume"
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

if [ $CURRENT_BRANCH != master ] ; then
    FILENAME_SUFFIX=$CURRENT_BRANCH
fi

FULL_FILENAME=`printf "%s%s" $BASE_FILENAME $FILENAME_SUFFIX`

export TEXINPUTS="sty//:$TEXINPUTS"  # Include the ./sty dir
pdflatex -output-format pdf -jobname $FULL_FILENAME -output-directory output resume.tex
if [[ "$(uname)" == "Linux" ]]; then
	if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
		# Windows subsystem for Linux (win 10 bash)
		# Need to copy the output to a tmp dir on the C drive so that a windows
		# app can open it
		mkdir -p /mnt/c/tmp
		cp output/$FULL_FILENAME.pdf /mnt/c/tmp/
		cmd.exe /C start `wslpath -w /mnt/c/tmp/$FULL_FILENAME.pdf`
	else
		# Normal Linux
		xdg-open output/$FULL_FILENAME.pdf
	fi
elif [[ "$(uname)" == "Darwin" ]]; then
	open -a Preview output/$FULL_FILENAME.pdf
else
	echo "I don't know how to open the output PDF on this OS."
fi
echo "Done"
