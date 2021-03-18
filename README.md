# Super Resolution via Dictionary Learning

## Code Structure

主要包括数据部分、字典学习函数部分和使用不同方法进行超分辨重构的函数部分。

- Demo\_experiment.m  %包括字典学习和超分辨重构两部分；
- Learn\_dict.m %字典学习函数；
- Data/
	- Train/
	- Test/
	- Result/
- Methods/
	- Yang.m
	- Zeyde.m
	- ANR.m
	- GR.m
- ksvdbox/
- ompbox/

其中训练字典所需要的参数和字典本身使用一个结构体 `dict_conf` 存储。

## Packages and codes included and/or adapted:

* OMPBox v9+ and KSVDBox v12+ by Ron Rubinstein are used 
for dictionary training and sparse coding in Roman Zeyde's code.
[http://www.cs.technion.ac.il/~ronrubin/software.html]

* Training and test files of Yang et al.'s Super Resolution algorithm.
(Image Super-resolution as Sparse Representation of Raw Image Patches, (CVPR) 2008.
[CVPR08-SR/]
