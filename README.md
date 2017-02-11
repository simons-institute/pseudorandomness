# pseudorandomness

You will need to have TexLive, make, and perl installed (on a UNIX-like system).

To install the necessary Python packages:

    pip install -r requirements.txt

To build the PDF:

    make pdf

To build and update the website:

    make html


Notes
-----

iconv -f utf-8 -t utf-8 -c  readingbootcamp.tex > reading.tex
pandoc reading.tex -o readingbootcamp.rst
