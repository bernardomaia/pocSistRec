cat rt-polarity.neg rt-polarity.pos > data.txt
unaccent ISO-8859-1 <data.txt  >data2.txt
iconv -f utf-8 -t utf-8 -c <data2.txt >data.txt
tr -d [:punct:] <data.txt >data2.txt
wc -l <data2.txt > data.txt
cat data2.txt >> data.txt
tr [:space:] "\n" < data2.txt | sort -u >> WordList.txt
rm data2.txt
