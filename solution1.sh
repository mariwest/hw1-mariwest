#!/usr/bin/bash 

#code should go here to download file https://biodataprog.github.io/programming-intro/data/Ecoli-vs-Yersinia.BLASTP.tab.gz
curl https://biodataprog.github.io/programming-intro/data/Ecoli-vs-Yersinia.BLASTP.tab.gz > EcoliYersenia.tab.gz

#print out how big the file is in KB
du -h EcoliYersenia.tab.gz

#uncompress the file
gunzip EcoliYersenia.tab.gz

#print out how big uncompressed file is
du -k EcoliYersenia.tab

#print out first 25 lines
head -n 25 EcoliYersenia.tab

#print out last 3 lines
tail -n 3 EcoliYersenia.tab

#print total # lines in files
wc -l EcoliYersenia.tab

#obtain Nc3H.expr.tab file
curl https://biodataprog.github.io/programming-intro/data/Nc3H.expr.tab > Nc3H.expr.tab

#sort by FPKM and put into new file
(head -n 1 Nc3H.expr.tab && tail -n +2 Nc3H.expr.tab | sort -k6) > Nc20H.expr.sorted.tab

#print out list of most highly expressed genes based on FPKM
tail Nc2OH.expr.sorted.tab

#obtain genbank file
curl https://biodataprog.github.io/programming-intro/data/D_mel.63B12.gbk > genbank.gbk

#report number of CDS features (lines?) in genbank file
awk '{print $1}' genbank.gbk | grep -c CDS

#Print how many sequence alignments are 100% identical in the previously downloaded file EcoliYersinia.tab
awk '$3 == 100' EcoliYersenia.tab | wc -l

#Print how many sequence alignments are 90% identical or better in the previously downloaded file EcoliYersinia.tab
awk '$3 >= 90' EcoliYersenia.tab | wc -l

#obtain codon_table.txt file
curl https://biodataprog.github.io/programming-intro/data/codon_table.txt > codon_table.txt

#sort and uniq to print out number of codons that encode each amino acid
sort -k3 codon_table.txt | cut -f3 | uniq -c
