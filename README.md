# Plack Handbook for printing

2014-12-22: I will enjoy my Christmas holidays to learn Plackup. 
"Plack Handbook" by the creator of PSGI/Plackup is a good start, but unfortunately it is only available as an [ebook](http://handbook.plackperl.org/). 
I am a paper book lover and I appreciate good typography, so I need to convert it in LaTeX.
The LaTeX version is designed to be print in A5 format. 
As I have very little time, the LaTeX code is a little ugly.

The content is exactly the same as the ebook. 
The changes relate only to the layout and typography.

## License

See LICENSE file.

## Compilation

You need a LaTeX distribution, wget to download the cover photography and Inkscape to compile SVG to PDF.

To compile the book, just run

    pdflatex --shell-escape main.tex && pdflatex main.tex && pdflatex main.tex

