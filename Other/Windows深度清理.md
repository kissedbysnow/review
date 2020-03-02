### 1 关闭休眠模式，这项功能使得电脑可以在完全断电的情况下不丢失内存中的内容，不需要的可以关闭

cmd 一管理身份运行

`powercfg -h off`

#### 2 转移系统默认的库文件夹

库文件夹 右击 位置 移动

#### 3 虚拟内存转移

右击“**此电脑**”单击“**属性**”里的”**高级系统设置**“并点击”**性能**“

在“**高级选项卡**”中点击“**更改**”

将 C: 设置为“**无分页文件(N)**”

将目标盘设置为“**系统管理的大小(Y)**”

#### 4 系统缓存清理并转移

目标盘新建文件夹 “Temp”，其内新建子文件夹 “User” “Windows”，分别存放用户缓存和系统缓存

例如：N:\Temp\User N:\Temp\Windows

修改环境变量，原目录记下，一会重启后要删掉

​	用户变量 **TEMP**和**TMP** 都修改为 N:\Temp\User

​	系统变量 **TEMP**和**TMP** 都修改为 N:\Temp\Windows

重启电脑

#### 5 清理独立显卡驱动安装程序所产生的无用文件

1. 删除该目录下除 InstallerCore 之外的文件

   C:\Program Files\NVIDIA Corporation\Installer2

2. 删除该目录下所以名称加密过的文件

   C:\ProgramData\NVIDIA Corporation\Downloader

   例如： 9ea5f785c6c51bd4074453f93cd9d725

   以及 latest 文件夹中的文件

#### 6 清理 Windows 为老驱动所做的备份文件

