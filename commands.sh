cd reviews
>data.txt
>data2.txt
>WordList.txt
>WordList2.txt
for i in reviews*.txt
do 

	unaccent ISO-8859-1 <"$i"  >data.txt
	iconv -f utf-8 -t utf-8 -c <data.txt >data2.txt
	sed  -e '/<br><br>/d' <data2.txt >data.txt
	sed 's/\\n/ /g' <data.txt >data2.txt
	tr "?!." "\n" <data2.txt >data.txt
	tr -d [:punct:]  <data.txt >data2.txt
	tr [:upper:] [:lower:] <data2.txt >data.txt
	sed 's/^ *//; s/ *$//; /^$/d' <data.txt >data2.txt
	wc -l <data2.txt > new_$(basename "${i/.txt}").txt
	cat <data2.txt >> new_$(basename "${i/.txt}").txt
	tr [:space:] "\n" < data.txt | sort -u >> WordList2.txt
done
sort -u <WordList2.txt >WordList.txt
rm data2.txt
rm data.txt
rm WordList2.txt

