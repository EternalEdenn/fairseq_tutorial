# fairseq_tutorial
## Create the container(Usturo lab):
Please follow the steps of [銭本：Python環境構築勉強会]([https://pytorch.org/get-started/previous-versions/](http://nlp.iit.tsukuba.ac.jp/local/wiki/index.php?%C1%AC%CB%DC%A1%A7Python%B4%C4%B6%AD%B9%BD%C3%DB%CA%D9%B6%AF%B2%F1)) to create your container. 
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
```
Download fairseq:
```
wget https://github.com/facebookresearch/fairseq/archive/refs/tags/v0.10.1.tar.gz    # You can also choose other versions
tar -xzvf v0.10.1.tar.gz
rm v0.10.1.tar.gz
cd cd fairseq-0.10.1
pip install --editable ./
```
