##  恢复Anaconda

1.  是否`conda remove -n env_name --all`也在其环境下删除环境及其所有已安装的软件包？或者它只删除环境？

    它将删除环境**my_env**，其中包括解压缩的库和`env/env_name`目录。它不会删除`conda/pkgs`目录中的缓存tarball 。

2.  我可以直接删除文件夹`pkgs`和`env`用户/用户而不影响基础环境吗？

    您不应该这样做，因为Conda可能正在使用硬链接或软链接来跨环境共享包，因此很难确定您通过这种直接删除可能会影响到什么。如果要删除环境，则应使用**（1）中**的命令。如果要删除缓存包，则应使用`conda clean`（使用`--help`flag查看可用选项）。

3.  如何像第一次安装一样恢复Anaconda（仅包含**基本**环境和默认包）？

    同样，您可以删除其他环境`conda remove --all`。对于**base**，您可以将其恢复为原始状态

    ```
    conda install -n base --revision 0
    ```

    但是，我会注意到许多用户报告这不起作用。


## 更改pip镜像源

```
pip config set global.index-url https://mirrors6.tuna.tsinghua.edu.cn/pypi/web/simple/

pip config unset global.index-url
```

## Anaconda 镜像使用帮助

### .condarc

Anaconda 是一个用于科学计算的 Python 发行版，支持 Linux, Mac, Windows, 包含了众多流行的科学计算、数据分析的 Python 包。

Anaconda 安装包可以到 https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/ 下载。

TUNA 还提供了 Anaconda 仓库与第三方源（conda-forge、msys2、pytorch等，[查看完整列表](https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/)）的镜像，各系统都可以通过修改用户目录下的 `.condarc` 文件:

```
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors6.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors6.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - https://mirrors6.tuna.tsinghua.edu.cn/anaconda/pkgs/r
custom_channels:
  conda-forge: https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors6.tuna.tsinghua.edu.cn/anaconda/cloud
```

即可添加 Anaconda Python 免费仓库。Windows 用户无法直接创建名为 `.condarc` 的文件，可先执行 `conda config --set show_channel_urls yes` 生成该文件之后再修改。

运行 `conda create -n myenv numpy` 测试一下吧。

### conda命令

后来网上搜查，发现“中国科学技术大学”（[USTC Open Source Software Mirror](http://mirrors.ustc.edu.cn/)）有提供anaconda的镜像源，按照如下命令配置anaconda后，下载速度明显加快！

```text
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
```

**注意：url不要加单引号或双引号，否则conda命令无法识别该url**

## Anaconda 之 导出环境/从外部安装环境

对于好不容易配置好的环境，将其中的包，版本号等导出作为记录是很重要的一件事，这便于我们对环境的安装进行再次的复现。
导出已有环境：

```
conda env export > environment.yaml 
```

环境会被保存在 environment.yaml文件中。
当我们想再次创建该环境，或根据别人提供的.yaml文件复现环境时，可以：

```
conda env create -f environment.yaml
```

就可以复现安装环境。