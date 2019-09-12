#!/bin/bash

./jemdoc.py index.jemdoc
./jemdoc.py research.jemdoc
./jemdoc.py teaching.jemdoc
#./jemdoc.py coursework.jemdoc
./jemdoc.py activities.jemdoc

tac index.html | awk 'NR > 2' | tac > tmp.html
cat tmp.html > index.html
rm tmp.html
cat counter.txt >> index.html
echo "" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html
