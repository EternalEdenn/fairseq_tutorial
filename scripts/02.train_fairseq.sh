DIR=..
DATADIR=../data/data-bin

mkdir $DIR/fairseq_trained-model/

MODELDIR=$DIR/fairseq_trained-model                       

SEED=0621

export MKL_THREADING_LAYER=GNU

fairseq-train  $DATADIR\
  --arch transformer \
  --batch-size 16 --update-freq 3 \
  --max-epoch 20 \
  --save-interval 1 \
  --optimizer adam --adam-eps 1e-09 --adam-betas '(0.9, 0.98)' \
  --dropout 0.3 --attention-dropout 0.1 --weight-decay 0.0 \
  --lr-scheduler inverse_sqrt --lr 3e-03 --warmup-updates 6000 \
  --criterion cross_entropy \
  --save-dir $MODELDIR \
  --task translation \
  --encoder-embed-dim 512 \
  --decoder-embed-dim 512 \
  --seed $SEED \
  --encoder-normalize-before --decoder-normalize-before \
  --max-source-positions 1024 \
  --max-target-positions 1024 \



