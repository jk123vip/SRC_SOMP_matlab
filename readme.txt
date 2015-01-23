SRC (Sparse Representation Classifier) 稀疏表示分类器
SOMP (Simultaneous Orthogonal Matching Pursuit) 同步正交匹配追踪
稀疏表示分类器应用于高光谱图像分类的MATLAB代码实现。

此程序为论文仿真，论文题目为：
Hyperspectral Image Classification Using Dictionary-Based Sparse Representation

论文地址：
http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=5766028&url=http%3A%2F%2Fieeexplore.ieee.org%2Fxpls%2Fabs_all.jsp%3Farnumber%3D5766028

其实只实现了论文里的第一种方法SOMP
各个文件功能简介：
isomp_Indiana.m 主程序
SamplesNormalize.m 数据归一化
findlabel2.m 划分训练样本和测试样本
SOMP.m 求稀疏表示矩阵
assign_label_group.m 赋予测试样本分类标签

IndexNeighbors中保存取不同大小窗口时对应的数据