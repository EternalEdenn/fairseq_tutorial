ref=../data/aspec_test.tkn.ja 

outfile=../fairseq_out_test/generate-test.txt
sed -r 's/(@@ )|(@@ ?$)//g' $outfile > $outfile.r

sacrebleu $ref -i $outfile.r -l en-ja --width 2 --force
