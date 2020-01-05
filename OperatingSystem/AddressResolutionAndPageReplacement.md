#### 例1 最佳（Optimal）置换算法例

__其所选择的被淘汰页面将是以后永不使用的，或许是在最长（未来）时间内不再被访问的页面。采用最佳置换算法通常可以保证获得最低的缺页率。但由于人们目前还无法预知，一个进程在内存的若干个页面中，哪一个页面是未来最长时间内不再被访问的，因而该算法是无法实现的，但是可以利用该算法去评价其他算法。__

假定系统为某进程分配了3个物理块，页面访问序列为：1、2、3、4、1、2、5、1、2、3、4、5，开始时3个物理块均为空闲，采用最佳置换算法时的页面置换情况如下所示：

| 1    | 2    | 3    | 4    | 1    | 2    | 5    | 1    | 2    | 3    | 4    | 5    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 1    | 1    | 1    | 1    |      |      | 1    |      |      | 3    | 3    |      |
|      | 2    | 2    | 2    |      |      | 2    |      |      | 2    | 4    |      |
|      |      | 3    | 4    |      |      | 5    |      |      | 5    | 5    |      |
| 缺   | 缺   | 缺   | 缺   |      |      | 缺   |      |      | 缺   | 缺   |      |

***

#### 例2 先进先出置换算法例

__先进先出(FIFO)页面置换算法是出现最早的置换算法。该算法总是淘汰最先进入内存的页面，即选择在内存中驻留时间最久的页面予以淘汰。该算法实现简单，只需把一个进程已调入内存的页面按先后次序链接成一个队列，并设置一个指针，称为替换指针，使它总是指向最老的页面。但该算法与进程实际运行的规律不相适应，因为在进程中，有些页面经常被访问，比如，含有全局变量、常用函数、例程等的页面，FIFO算法并不能保证这些页面不被淘汰。__

假定系统为某进程分配了3个物理块，页面访问序列为：1、2、3、4、1、2、5、1、2、3、4、5，开始时3个物理块均为空闲，采用先进先出时的页面置换情况如下所示：

| 1    | 2    | 3    | 4    | 1    | 2    | 5    | 1    | 2    | 3    | 4    | 5    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 1    | 1    | 1    | 4    | 4    | 4    | 5    |      |      | 3    | 3    | 3    |
|      | 2    | 2    | 2    | 1    | 1    | 1    |      |      | 1    | 4    | 4    |
|      |      | 3    | 3    | 3    | 2    | 2    |      |      | 2    | 2    | 5    |
| 缺   | 缺   | 缺   | 缺   | 缺   | 缺   | 缺   |      |      | 缺   | 缺   | 缺   |

***
> 最近最久未使用置换算法(LRU):
>
> 最近最久未使用的页面置换算法是根据页面调入内存后的使用情况做出决策的。由于无法预测各页面将来的使用情况，只能利用“最近的过去”作为“最近的将来”的近似，因此，LRU置换算法是选择最近最久未使用的页面予以淘汰。
***
#### 例3 

（2016年考题）（10分）某程序在内存中分配3块内存，初始为空，访问页的走向为2,3,2,1,5,2,4,5,3,2,5,2，用FIFO和LRU算法分别计算缺页次数。

| FIFO | 2    | 3    | 2    | 1    | 5    | 2    | 4    | 5    | 3    | 2    | 5    | 2    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 页1  | 2    | 2    |      | 2    | 5    | 5    | 5    |      | 3    |      | 3    | 3    |
| 页2  |      | 3    |      | 3    | 3    | 2    | 2    |      | 2    |      | 5    | 5    |
| 页3  |      |      |      | 1    | 1    | 1    | 4    |      | 4    |      | 4    | 2    |
|      | 缺   | 缺   |      | 缺   | 缺   | 缺   | 缺   |      | 缺   |      | 缺   | 缺   |

共缺页中断9次

| LRU  | 2    | 3    | 2    | 1    | 5    | 2    | 4    | 5    | 3    | 2    | 5    | 2    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 页1  | 2    | 2    |      | 2    | 2    |      | 2    |      | 3    | 3    |      |      |
| 页2  |      | 3    |      | 3    | 5    |      | 5    |      | 5    | 5    |      |      |
| 页3  |      |      |      | 1    | 1    |      | 4    |      | 4    | 2    |      |      |
|      | 缺   | 缺   |      | 缺   | 缺   |      | 缺   |      | 缺   | 缺   |      |      |

共缺页中断7次

***
#### 例4

若在一分页存储管理系统中，某作业的页表如下图所示。已知页面大小为1024字节，试将逻辑地址1011,2148,4000,5012转化为相应的物理地址。

| 页号 | 物理块号 |
| ---- | -------- |
| 0    | 2        |
| 1    | 3        |
| 2    | 1        |
| 3    | 6        |

__物理地址=块号*1024（页面大小）+偏移量（余数）__



| 逻辑地址     | 1011               | 2148             | 4000             | 5012               |
| :----------- | ------------------ | ---------------- | ---------------- | ------------------ |
| 页号         | int（1011/1024）=0 | int(2148/1024)=2 | int(4000/1024)=3 | int(5012/1024)=4   |
| 对应物理块号 | 2                  | 1                | 6                | 这一页没有装入内存 |
| 物理地址     | 2*1024+1011=3059   | 1*1024+100=1124  | 6*1024+928=7072  | 无法计算           |

***

#### 例5

（2015年考题）某页式虚拟存储管理系统的物理空间为3K,页面大小为1K,一进程按下列地址顺序引用内存单元：3635、3632、1140、3584、2892、3640、40、2148、1700、2145、3209、0、1102、1100。如果上述数字均为十进制，而内存尚未装入任何页，试计算采用LRU和FIFO页面置换算法的缺页次数。

***

#### 例6

（2017年考题）某页式虚拟存储管理系统的物理空间为4K，页面大小为1K,一进程按下列地址顺序引用内存单元：1635、2632、3140、6584、4892、7604、3040、2148、1700、4145、7209、5312、6411、5200、2102、1100。如果上述数字均为十进制，而内存尚未装入任何页，试分别采用LRU和FIFO页面置换算法，列出各自的页面淘汰顺序和缺页中断次数。（假设开始的4个页面已装入主存）

***

#### 例7

（2018年考题）在一个请求分页系统中，假如一个作业的页面走向为：1,2,3,6,4,7,3,2,1,4,7,5,6,5,2,1.当分配给该作业的物理块数为4时，分别采用LRU和FIFO页面置换算法，计算访问过程中所发生的缺页次数和缺页率。

FIFO:

| 1    | 2    | 3    | 6    | 4    | 7    | 3    | 2    | 1    | 4    | 7    | 5    | 6    | 5    | 2    | 1    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 1    | 1    | 1    | 1    | 4    | 4    |      | 4    | 4    |      |      | 5    | 5    |      |      |      |
|      | 2    | 2    | 2    | 2    | 7    |      | 7    | 7    |      |      | 7    | 6    |      |      |      |
|      |      | 3    | 3    | 3    | 3    |      | 2    | 2    |      |      | 2    | 2    |      |      |      |
|      |      |      | 6    | 6    | 6    |      | 6    | 1    |      |      | 1    | 1    |      |      |      |
| 缺   | 缺   | 缺   | 缺   | 缺   | 缺   |      | 缺   | 缺   |      |      | 缺   | 缺   |      |      |      |

缺页次数为10次 缺页率为10/16

LRU:

| 1    | 2    | 3    | 6    | 4    | 7    | 3    | 2    | 1    | 4    | 7    | 5    | 6    | 5    | 2    | 1    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 1    | 1    | 1    | 1    | 4    | 4    |      | 4    | 1    | 1    | 1    | 1    | 6    |      | 6    | 6    |
|      | 2    | 2    | 2    | 2    | 7    |      | 7    | 7    | 4    | 4    | 4    | 4    |      | 2    | 2    |
|      |      | 3    | 3    | 3    | 3    |      | 3    | 3    | 3    | 7    | 7    | 7    |      | 7    | 1    |
|      |      |      | 6    | 6    | 6    |      | 2    | 2    | 2    | 2    | 5    | 5    |      | 5    | 5    |
| 缺   | 缺   | 缺   | 缺   | 缺   | 缺   |      | 缺   | 缺   | 缺   | 缺   | 缺   | 缺   |      | 缺   | 缺   |

缺页次数为：14次 缺页率为14/16

***

#### 例8

在一个请求分页系统中，假如一个作业的页面走向为4、3、2、1、4、3、5、4、3、2、1、5，目前它该没有任何页装入内存，当分配给该作业的物理块数目M分别为3和4时，请分别计算采用OPT、LRU和FIFO页面淘汰算法时，访问过程中所发生的的缺页次数和缺页率，并比较所得结果。（选做括号内的内容：根据本题的结果，请查找资料，说明什么是Belady现象，在哪种置换算法中会产生Belady现象，为什么）

1. M=3

OPT:

| 4    | 3    | 2    | 1    | 4    | 3    | 5    | 4    | 3    | 2    | 1    | 5    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 4    | 4    | 4    | 4    |      |      | 4    |      |      | 2    | 2    |      |
|      | 3    | 3    | 3    |      |      | 3    |      |      | 3    | 1    |      |
|      |      | 2    | 1    |      |      | 5    |      |      | 5    | 5    |      |
| 缺   | 缺   | 缺   | 缺   |      |      | 缺   |      |      | 缺   | 缺   |      |

缺页次数为7次 缺页率为7/12

LRU:

| 4    | 3    | 2    | 1    | 4    | 3    | 5    | 4    | 3    | 2    | 1    | 5    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 4    | 4    | 4    | 1    | 1    | 1    | 5    |      |      | 2    | 2    | 2    |
|      | 3    | 3    | 3    | 4    | 4    | 4    |      |      | 4    | 1    | 1    |
|      |      | 2    | 2    | 2    | 3    | 3    |      |      | 3    | 3    | 5    |
| 缺   | 缺   | 缺   | 缺   | 缺   | 缺   | 缺   |      |      | 缺   | 缺   | 缺   |

缺页次数为10次 缺页率为10/12

FIFO:

| 4    | 3    | 2    | 1    | 4    | 3    | 5    | 4    | 3    | 2    | 1    | 5    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 4    | 4    | 4    | 1    | 1    | 1    | 5    |      |      | 5    | 5    |      |
|      | 3    | 3    | 3    | 4    | 4    | 4    |      |      | 2    | 2    |      |
|      |      | 2    | 2    | 2    | 3    | 3    |      |      | 3    | 1    |      |
| 缺   | 缺   | 缺   | 缺   | 缺   | 缺   | 缺   |      |      | 缺   | 缺   |      |

缺页次数为9次 缺页率为9/12

2. M=4

OPT:

| 4    | 3    | 2    | 1    | 4    | 3    | 5    | 4    | 3    | 2    | 1    | 5    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 4    | 4    | 4    | 4    |      |      | 4    |      |      |      | 1    |      |
|      | 3    | 3    | 3    |      |      | 3    |      |      |      | 3    |      |
|      |      | 2    | 2    |      |      | 2    |      |      |      | 2    |      |
|      |      |      | 1    |      |      | 5    |      |      |      | 5    |      |
| 缺   | 缺   | 缺   | 缺   |      |      | 缺   |      |      |      | 缺   |      |

缺页次数为6次 缺页率为6/12

LRU:

| 4    | 3    | 2    | 1    | 4    | 3    | 5    | 4    | 3    | 2    | 1    | 5    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 4    | 4    | 4    | 4    |      |      | 4    |      |      | 4    | 4    | 5    |
|      | 3    | 3    | 3    |      |      | 3    |      |      | 3    | 3    | 3    |
|      |      | 2    | 2    |      |      | 5    |      |      | 5    | 1    | 1    |
|      |      |      | 1    |      |      | 1    |      |      | 2    | 2    | 2    |
| 缺   | 缺   | 缺   | 缺   |      |      | 缺   |      |      | 缺   | 缺   | 缺   |

缺页次数为8次 缺页率为8/12

FIFO:

| 4    | 3    | 2    | 1    | 4    | 3    | 5    | 4    | 3    | 2    | 1    | 5    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 4    | 4    | 4    | 4    |      |      | 5    | 5    | 5    | 5    | 1    | 1    |
|      | 3    | 3    | 3    |      |      | 3    | 4    | 4    | 4    | 4    | 5    |
|      |      | 2    | 2    |      |      | 2    | 2    | 3    | 3    | 3    | 3    |
|      |      |      | 1    |      |      | 1    | 1    | 1    | 2    | 2    | 2    |
| 缺   | 缺   | 缺   | 缺   |      |      | 缺   | 缺   | 缺   | 缺   | 缺   | 缺   |

缺页次数为10次 缺页率为10/12

1. 使用OPT算法时，访问过程中发生缺页的情况为：当M=3时，缺页次数为7，缺页率为7/12；当M=4时，缺页次数为6，缺页率为6/12。可见，增加分配给作业的内存块数，可减少缺页次数，从而降低缺页率。
2. 使用FIFO算法时，访问过程中发生缺页的情况为：当M=3时，缺页次数为9，缺页率为9/12；当M=4时，缺页次数为10，缺页率为10/12。可见，增加分配给作业的内存块数，反而增加了缺页次数，提高了缺页率，这种现象被称做Belady现象。

***

#### 例9

（考研题1）请求分页管理系统中，假设某进程的页表内容如下表所示：

| 页号 | 页框号 | 有效位 |
| ---- | ------ | ------ |
| 0    | 101H   | 1      |
| 1    | -      | 0      |
| 2    | 245H   | 1      |

页面大小为4KB,一次内存的访问时间是100ns，一次快表（TLB）的访问时间是10ns，处理一次缺页的平均时间是10的八次方ns(已含更新TLB表和页表的时间)，进程驻留集大小固定为2，采用最近最少使用置换算法（LRU）和局部淘汰策略，假设（1）TLB初始为空

***

#### 例10

（考研题2）设某计算机的逻辑地址空间和物理地址空间均为64KB，按字节编址。若某进程最多需要6页数据存储空间，页的大小为1KB，操作系统采用固定分配局部置换策略为此进程分配4个页框（Page frame），如下表所示。

| 页号 | 页框号 | 装入时刻 | 访问位 |
| ---- | ------ | -------- | ------ |
| 0    | 7      | 130      | 1      |
| 1    | 4      | 230      | 1      |
| 2    | 2      | 200      | 1      |
| 3    | 9      | 160      | 1      |
