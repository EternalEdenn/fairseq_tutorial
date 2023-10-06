export OMP_WAIT_POLICY=PASSIVE

DIR=..
DATAPATH=../data/data-bin


mkdir $DIR/fairseq_out_test/


BASE_MODEL=$DIR/fairseq_trained-model/checkpoint_best.pt
fairseq-generate $DATAPATH \
    --task translation \
    --path $BASE_MODEL \
    --dataset-impl mmap \
    --source-lang en --target-lang ja \
    --lenpen 0.8 --max-len-a 1.2 --max-len-b 10 \
    --gen-subset test \
    --beam 1 \
    --batch-size 32 \
    --remove-bpe \
    --max-source-positions 1024 \
    --max-target-positions 1024 \
    --results-path $DIR/fairseq_out_test/ 

grep '^H-' $DIR/fairseq_out_test/generate-test.txt > $DIR/fairseq_out_test/generate-test.tmp1
rm $DIR/fairseq_out_test/generate-test.txt
sort -t- -k2,2n $DIR/fairseq_out_test/generate-test.tmp1 > $DIR/fairseq_out_test/generate-test.tmp2
cut -f 3- $DIR/fairseq_out_test/generate-test.tmp2 > $DIR/fairseq_out_test/generate-test.txt
rm $DIR/fairseq_out_test/generate-test.tmp1 $DIR/fairseq_out_test/generate-test.tmp2
