# conda常用命令:安装，更新，创建，激活，关闭，查看，卸载，删除，清理，重命名，问题

2018-05-24 14:15:00 更多

版权声明：本文为博主原创文章，遵循[ CC 4.0 BY-SA ](http://creativecommons.org/licenses/by-sa/4.0/)版权协议，转载请附上原文出处链接和本声明。本文链接：https://blog.csdn.net/zhayushui/article/details/80433768



### 文章目录

-   [0.安装](https://blog.csdn.net/zhayushui/article/details/80433768#0_1)
-   [1.升级](https://blog.csdn.net/zhayushui/article/details/80433768#1_9)
-   [2.卸载Anaconda软件](https://blog.csdn.net/zhayushui/article/details/80433768#2Anaconda_16)
-   [3.找到自己安装环境对应的最新TensorFlow后（可以在终端搜索anaconda，定位到那一行），然后查看指定包](https://blog.csdn.net/zhayushui/article/details/80433768#3TensorFlowanacondaUSERPACKAGE_43)

Anaconda创建环境：

//下面是创建python=3.6版本的环境，取名叫py36

conda create -n py36 python=3.6 

 

删除环境（不要乱删啊啊啊）

conda remove -n py36 --all

# 0.安装

linux环境

```bash
bash Anaconda3-2019.07-Linux-x86_64.sh
#yes+回车 
#然后重启terminal
```

window环境：直接双击安装exe文件，然后根据安装向导进行安装

# 1.升级

升级Anaconda需要先升级conda

```bash
conda update conda          #基本升级
conda update anaconda       #大的升级
conda update anaconda-navigator    //update最新版本的anaconda-navigator   
```

# 2.卸载Anaconda软件

由于Anaconda的安装文件都包含在一个目录中，所以直接将该目录删除即可。删除整个Anaconda目录：

>   计算机控制面板->程序与应用->卸载 //windows

或者

>   找到C:\ProgramData\Anaconda3\Uninstall-Anaconda3.exe执行卸载

```bash
rm -rf anaconda    //ubuntu
1
```

最后，建议清理下.bashrc中的Anaconda路径。
conda环境使用基本命令：

```bash
conda update -n base conda        #update最新版本的conda
conda create -n xxxx python=3.5   #创建python3.5的xxxx虚拟环境
conda activate xxxx               #开启xxxx环境
conda deactivate                  #关闭环境
conda env list                    #显示所有的虚拟环境
conda info --envs                 #显示所有的虚拟环境
```

anaconda安装最新的TensorFlow版本
参考：https://blog.csdn.net/qq_35203425/article/details/79965389
一般从anaconda官网下载的anaconda，查看tensorflow依然还是1.2的版本，现在用conda更新TensorFlow，解决方法：
1.打开anaconda-prompt
2.查看tensorflow各个版本：（查看会发现有一大堆TensorFlow源，但是不能随便选，选择可以用查找命令定位）

```bash
anaconda search -t conda tensorflow  
```

# 3.找到自己安装环境对应的最新TensorFlow后（可以在终端搜索anaconda，定位到那一行），然后查看指定包<USER/PACKAGE>可安装版本信息命令

```bash
anaconda show <USER/PACKAGE>  
1
```

查看tensorflow版本信息

```bash
anaconda show anaconda/tensorflow
1
```

# 4.第4步会提供一个下载地址，使用下面命令就可安装1.8.0版本tensorflow

```bash
conda install --channel https://conda.anaconda.org/anaconda tensorflow=1.8.0 
1
```

更新，卸载安装包：

```bash
conda list         #查看已经安装的文件包
conda list  -n xxx       #指定查看xxx虚拟环境下安装的package
conda update xxx   #更新xxx文件包
conda uninstall xxx   #卸载xxx文件包
1234
```

# 5.删除虚拟环境

```bash
conda remove -n xxxx --all   //创建xxxx虚拟环境
1
```

# 6.清理（conda瘦身）

conda clean就可以轻松搞定！第一步：通过conda clean -p来删除一些没用的包，这个命令会检查哪些包没有在包缓存中被硬依赖到其他地方，并删除它们。第二步：通过conda clean -t可以将删除conda保存下来的tar包。

```bash
conda clean -p      //删除没有用的包
conda clean -t      //删除tar包
conda clean -y -all //删除所有的安装包及cache
123
```

参考：https://blog.csdn.net/menc15/article/details/71477949

# 7.重命名env

Conda是没有重命名环境的功能的, 要实现这个基本需求, 只能通过愚蠢的**克隆-删除**的过程。
切记不要直接mv移动环境的文件夹来重命名, 会导致一系列无法想象的错误的发生!

```bash
conda create --name newname --clone oldname      //克隆环境
conda remove --name oldname --all      //彻底删除旧环境
12
```

# 8.conda自动开启/关闭激活

参考：https://www.cnblogs.com/clemente/p/11231539.html

```bash
conda activate   #默认激活base环境
conda activate xxx  #激活xxx环境
conda deactivate #关闭当前环境
conda config --set auto_activate_base false  #关闭自动激活状态
conda config --set auto_activate_base true  #关闭自动激活状态
12345
```

# 8. 常用软件安装

参考：[conda环境下常用软件安装](https://blog.csdn.net/zhayushui/article/details/83685229)

# 9.问题

## 1:failed ERROR conda.core.link:_execute(502):

```bash
conda install 软件时出现如下错误信息：
Preparing transaction: done
Verifying transaction: done
Executing transaction: 
failed ERROR conda.core.link:_execute(502):
12345
```

解决方法：往往时权限不够，需要以管理员方式运行Anaconda prompt进行安装

## 2.anaconda或conda不是内部命令

解决方法：https://zhuanlan.zhihu.com/p/32446675
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190624104613684.PNG?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3poYXl1c2h1aQ==,size_16,color_FFFFFF,t_70)
添加上图环境变量即可

**jupyter notebook默认工作目录设置**
参考：https://blog.csdn.net/liwei1205/article/details/78818568

1）在Anaconda Prompt终端中输入下面命令，查看你的notebook配置文件在哪里：

```bash
jupyter notebook --generate-config
#会生成文件C:\Users\用户\.jupyter\jupyter_notebook_config.py
12
```

2）打开jupyter_notebook_config.py文件通过搜索关键词：c.NotebookApp.notebook_dir，修改如下

```bash
c.NotebookApp.notebook_dir = 'E:\\tf_models'     //修改到自定义文件夹
1
```

3）然后重启notebook服务器就可以了

>   **注：**其它方法直接命令到指定目录，Anaconda Prompt终端中输：jupyter notebook 目录地址