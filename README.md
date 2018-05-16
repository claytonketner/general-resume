general-resume
==============

This is my resume written in LaTeX. [Look at it!](https://github.com/claytonketner/general-resume/blob/master/output/Clayton-Ketner_Resume.pdf)

Yes, it's overkill. Yes, it's awesome.

How To
------------
- Make changes to `.tex` files
- Run `make` (which just cleans and then runs `./build.sh`), which builds the PDF using `pdftex` and then opens it in Preview (for OSX), or the default program (for Linux)

Troubleshooting
-------------------
- Some error about not being able to find pzdr
```
sudo apt-get install texlive-fonts-recommended
```
