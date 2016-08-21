all:
	# Preview will reload the file even if it's already open, unlike the adobe viewer
	pdflatex resume.tex && open -a Preview resume.pdf
