We share the anonymous data and code of "Network structural perturbation against interlayer link prediction" here. If you find our code is useful for your research, you can cite our paper by:
@article{TANG2022109095,
title = {Network structural perturbation against interlayer link prediction},
journal = {Knowledge-Based Systems},
volume = {250},
pages = {109095},
year = {2022},
issn = {0950-7051},
doi = {https://doi.org/10.1016/j.knosys.2022.109095},
url = {https://www.sciencedirect.com/science/article/pii/S0950705122005408},
author = {Rui Tang and Shuyu Jiang and Xingshu Chen and Wenxian Wang and Wei Wang},
keywords = {Social networks, Multiplex network, Interlayer link prediction, Network structural perturbation},
}

DATASETS
The datasets used in this projects are as follows. If you use them, please cite the following papers.
TF1 is shared by 
@InProceedings{ZhangJiawei2015-IJCAI,
  author    = {Zhang, Jiawei and Philip, S. Yu},
  title     = {Integrated anchor and social link predictions across social networks},
  booktitle = {Proceedings of the 24th International Joint Conference on Artificial Intelligence},
  year      = {2015},
  pages={2215--2132},
  address   = {Buenos Aires, Argentina},
  month     = jul,
}

TF2 is shared by 
@article{jalili2017link,
  title={Link prediction in multiplex online social networks},
  author={Jalili, Mahdi and Orouskhani, Yasin and Asgari, Milad and Alipourfard, Nazanin and Perc, Matja{\v{z}}},
  journal={Royal Society open science},
  volume={4},
  number={2},
  pages={160863},
  year={2017},
  publisher={The Royal Society Publishing}
}

Higgs-FSMT and Higgs-FSRT are shared by
@article{de2013anatomy,
  title={The anatomy of a scientific rumor},
  author={De Domenico, Manlio and Lima, Antonio and Mougel, Paul and Musolesi, Mirco},
  journal={Scientific reports},
  volume={3},
  number={1},
  pages={1--9},
  year={2013},
  publisher={Nature Publishing Group}
}
and processed by 
@article{tangrui2021interlayer,
  author={Tang, Rui and Miao, Zhenxiong and Jiang, Shuyu and Chen, Xingshu and Wang, Haizhou and Wang, Wei},
  journal={IEEE Transactions on Cybernetics}, 
  title={Interlayer Link Prediction in Multiplex Social Networks Based on Multiple Types of Consistency Between Embedding Vectors}, 
  year={2021},
  volume={},
  number={},
  pages={1-14},
  doi={10.1109/TCYB.2021.3120134}
}

Requirements
Matlab 2016a

USAGE
Run main.m firstly. All the results are outputed into the folder of '.\results'. When the results of the 10 times for all datasets, pertrubation strategies, and interlayer link prediction algorithms are outputed, you can run plot_figure1.m to see the figures of them.

Note:The overall project will take several hours. You are recommended to deploy it on the Linux server.
