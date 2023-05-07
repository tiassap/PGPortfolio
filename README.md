Forked from [ZhenyaoJiang/PGPortfolio](https://github.com/ZhengyaoJiang/PGPortfolio) \

## Docker container usage
```
./run_docker.sh -b -g
```
Use option `-b` to build docker image and `-g` to use GPU.

Reference: see [this page](https://linuxhint.com/use-nvidia-gpu-docker-containers-ubuntu-22-04-lts/#_Toc125512693) for NVIDIA docker installation on Ubuntu.

Note from original [repository](https://github.com/ZhengyaoJiang/PGPortfolio): \
---
This is the implementation of our paper, A Deep Reinforcement Learning Framework for the Financial Portfolio Management Problem ([arXiv:1706.10059](https://arxiv.org/abs/1706.10059)), together with a toolkit of portfolio management research.

* The policy optimization method we described in the paper is designed specifically for portfolio management problem.
  * Differing from the general-purpose reinforcement learning algorithms, it has similar efficiency and robustness to supervized learning.
  * This is because we formulate the problem as an immediate reward optimization problem regularised by transaction cost, which does not require a monte-carlo or bootstrapped estimation of the gradients.
* One can configurate the topology, training method or input data in a separate json file. The training process will be recorded and user can visualize the training using tensorboard.
Result summary and parallel training are allowed for better hyper-parameters optimization.
* The financial-model-based portfolio management algorithms are also embedded in this library for comparision purpose, whose implementation is based on Li and Hoi's toolkit [OLPS](https://github.com/OLPS/OLPS).

## Differences from the article version
Note that this library is a part of our main project, and it is several versions ahead of the article.

* In this version, some technical bugs are fixed and improvements in hyper-parameter tuning and engineering are made.
  * The most important bug in the arxiv v2 article is that the test time-span mentioned is about 30% shorter than the actual experiment. Thus the volumn-observation interval (for asset selection) overlapped with the backtest data in the paper.
* With new hyper-parameters, users can train the models with smaller time durations.(less than 30 mins)
* All updates will be incorporated into future versions of the paper.
* Original versioning history,  and internal discussions, including some in-code comments, are removed in this open-sourced edition. These contains our unimplemented ideas, some of which will very likely become the foundations of our future publications

## User Guide
Please check out [User Guide](user_guide.md)
