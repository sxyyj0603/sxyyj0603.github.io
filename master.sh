#!/bin/bash

python2.7 jemdoc.py index.jemdoc
python2.7 jemdoc.py research.jemdoc
python2.7 jemdoc.py teaching.jemdoc
#./jemdoc.py coursework.jemdoc
# python2.7jemdoc.py activities.jemdoc

tac index.html | awk 'NR > 2' | tac > tmp.html
cat tmp.html > index.html
rm tmp.html
cat counter.txt >> index.html
echo "" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html

git add .
git commit -m "new update $(date)"
git push
