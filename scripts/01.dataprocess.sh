DIR=../data

mkdir $DIR/data-bin/

fairseq-preprocess \
    --source-lang en \
    --target-lang ja \
    --trainpref $DIR/aspec_train_h100k.tkn\
    --validpref $DIR/aspec_dev.tkn \
    --testpref $DIR/aspec_test.tkn \
    --destdir $DIR/data-bin \
    --thresholdtgt 0 \
    --thresholdsrc 0 \
    --task translation \
    --workers 70
