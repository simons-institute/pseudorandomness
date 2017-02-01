# pseudorandomness

make latexpdf
make html
cp -a build/latex/pseudorandomness.pdf build/html/.
ghp-import build/html
git push origin gh-pages --force


iconv -f utf-8 -t utf-8 -c  readingbootcamp.tex > reading.tex
pandoc reading.tex -o readingbootcamp.rst

