cat testeTrees | grammar.pl > output
sed -i '/(.*/d' output
cat output | trata.pl > output2
sed -i 's/V+SJ/v+sj/g' output2
cat output2
