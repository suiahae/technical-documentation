# 告别窘迫：修改conda环境和缓存默认路径

0.3812018.01.11 11:53:37字数 517阅读 12516

默认情况下，conda 创建的新环境 以及过往安装的模块缓存都存储在用户目录下，这一点不会在 conda （user-specific）配置文件 $HOME/.condarc 中体现出来，除非用户修改了默认设置。当前的默认信息可通过 `conda info` 指令打印查看，其中不仅能够查看当前默认环境路径和默认缓存路径，还能查看conda的源设置（关于conda的源设置在[告别便秘：conda改源之路](https://www.jianshu.com/p/1dbaef6b3209)中已经说明过了）。

```
## 示例
(tensorflow) C:\Users\xxx>conda info
Current conda install:

               platform : win-32
          conda version : 4.3.30
       conda is private : False
      conda-env version : 4.3.30
    conda-build version : not installed
         python version : 3.6.3.final.0
       requests version : 2.18.4
       root environment : C:\ProgramData\Miniconda3  (read only)
    default environment : C:\Users\xxx\AppData\Local\conda\conda\envs\tensorflow
       envs directories : C:\Users\xxx\AppData\Local\conda\conda\envs     #环境依次存储在下面几个目录，第一个为默认存储目录
                          C:\ProgramData\Miniconda3\envs
                          C:\Users\xxx\.conda\envs
          package cache : C:\ProgramData\Miniconda3\pkgs     #缓存依次存储在下面几个目录，第一个为默认存储目录
                          C:\Users\xxx\AppData\Local\conda\conda\pkgs
           channel URLs : https://repo.continuum.io/pkgs/main/win-32     #源地址
                          https://repo.continuum.io/pkgs/main/noarch
                          https://repo.continuum.io/pkgs/free/win-32
                          https://repo.continuum.io/pkgs/free/noarch
                          https://repo.continuum.io/pkgs/r/win-32
                          https://repo.continuum.io/pkgs/r/noarch
                          https://repo.continuum.io/pkgs/pro/win-32
                          https://repo.continuum.io/pkgs/pro/noarch
                          https://repo.continuum.io/pkgs/msys2/win-32
                          https://repo.continuum.io/pkgs/msys2/noarch
            config file : None
             netrc file : None
           offline mode : False
             user-agent : conda/4.3.30 requests/2.18.4 CPython/3.6.3 Windows/7 Windows/6.1.7601
          administrator : False
```

这种默认的处理方式的好处是友好利用了现代操作系统多用户的特点，保证每个用户操作之间的隔离性；问题是 **在用户个人目录存储空间设置得很小的情况下，随着用户使用时间变长，可用的用户目录空间将越来越少**，很可能导致没有足够的空间来容纳新创建的环境或没有足够的空间来为环境安装新的模块。这时候该怎么办？

实际上，conda环境和缓存的默认路径（envs directories 和 package cache）不一定要默认存储在用户目录，我们可以将他们设置到盈余空间稍大的其他目录来缓解这种空间压力，只要保证不同用户之间的设置不同即可。路径的设置可以通过编辑 $HOME/.condarc 来实现。添加或修改 $HOME/.condarc 中的 env_dirs 和 pkgs_dirs 配置项分别设置环境和缓存路径，按顺序第一个路径作为默认存储路径，搜索环境和缓存时按先后顺序在各目录中查找。

```
// 配置示例
channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
  - defaults
show_channel_urls: true
envs_dirs:
  - D:\data\xxx\Miniconda\envs
  - C:\Users\xxx\AppData\Local\conda\conda\envs
  - C:\Users\xxx\.conda\envs
  - C:\ProgramData\Anaconda\Miniconda3\envs                          
pkgs_dirs:
  - D:\data\xxx\Miniconda\pkgs
  - C:\Users\xxx\AppData\Local\conda\conda\pkgs
  - C:\Users\xxx\.conda
  - C:\ProgramData\Anaconda\Miniconda3\pkgs
```

如上例，新建环境将存储在 `D:\data\xxx\Miniconda\envs` 下，缓存文件将存储在 `D:\data\xxx\Miniconda\pkgs` 下，从而避免了用户目录空间不足带来的窘迫。