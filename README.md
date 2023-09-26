# fairseq_tutorial
## Create the container(Usturo lab):
Please follow the steps of [銭本：Python環境構築勉強会](http://nlp.iit.tsukuba.ac.jp/local/wiki/index.php?%C1%AC%CB%DC%A1%A7Python%B4%C4%B6%AD%B9%BD%C3%DB%CA%D9%B6%AF%B2%F1) to create your container. 
You need to follow these steps at least until the setup of git is complete.

## If you do not have conda env, please follow the next steps to create it:
```
wget -c https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
bash Anaconda3-2021.05-Linux-x86_64.sh
export PATH=~/anaconda3/bin:$PATH
source ~/.bashrc
conda init bash
rm Anaconda3-2021.05-Linux-x86_64.sh
```

## Requirment:
```
Python: 3.8.5
CUDA:10.1
PyTorch: 1.8.1+cu101 
GPU: TITAN
```
You can download PyTorch corresponding to your CUDA version refer to [CUDA-PyTorch](https://pytorch.org/get-started/previous-versions/).

## Run the code:
Create the conda env:
```
conda create -n fairseq python==3.8.5
conda activate fairseq                 # activate the env(if you want to exit the current env, please run: conda deactivate)
pip install torch==1.8.1+cu101 torchvision==0.9.1+cu101 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html
pip install sacrebleu[ja]              # for evaluation of Aspec en-ja dataset
```
Download fairseq:
```
wget https://github.com/facebookresearch/fairseq/archive/refs/tags/v0.10.1.tar.gz    # You can also choose other versions
tar -xzvf v0.10.1.tar.gz
rm v0.10.1.tar.gz
cd cd fairseq-0.10.1
pip install --editable ./
cd ..
```
Error may happen:
In numpy 1.24.4, np.float have been no longer used. So we need to change some places of fairseq codes.
```
# open the fairseq-0.10.1/fairseq/data/indexed_dataset.py file
# exchage all the "np.float" into "np.float64" (I see it is in 101 and 306 lines.)
```

Run the code of fairseq:
```
git clone https://github.com/EternalEdenn/fairseq_tutorial.git
cd fairseq_tutorial/scripts
sh 01.dataprocess.sh
sh 02.train_fairseq.sh (Or you use "nohup sh 02.train_fairseq.sh &" to let it run in background)
sh 03.prediction.sh
sh 04.eval_test.sh
```
