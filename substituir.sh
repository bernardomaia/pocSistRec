cd reviews 
for i in new_*
do 
	python3 ../substituir.py "$i"
done

>BagOfSentences.txt
for i in out_*
do
	cat <"$i" >>BagOfSentences.txt
done


