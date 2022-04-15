# [VCB-Studio科普教程2] madVR渲染器配置教程(2020/07/13更新)

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](.assets/wasmpkzyzoq.jpg)

如今的超清视频收看感受，短板没有高清片源，也没有制做，只是在播放软件

——作文题记

见到logo那张前后对比了么？以前就有些人拿着右侧实际效果一般的截屏来质疑我，而恰当的播放视频結果是左侧——他那时候是用了QQ影音视频。

为何强烈推荐madVR做为渲染器：

1、madVR能够完成更精准的色调解决。madVR全线在16bit/32bit下开展计算，精密度远超EVR/VMR等9ait，并颤动到9ait  RGB輸出。madVR的高精密计算和轻度的颤动噪音拥有遮盖打印色带图形等功效。假如高清片源是10bit，madVR配搭ffdshow/lav音频解码器还可以立即接受原生态10bit的色调键入，真实运用好10bit的精密度优点。

2、madVR能够完成可调整的、高品质的图像放大变小。一般的视頻，历经了饱和度半取样(Chroma  SubSampling)以后，播放视频情况下会做2次调节尺寸：第一次将饱和度调节至色度一样尺寸，而且将YUV变换为RGB，第二次将RGB图像放大变小到你的显示屏或是播放软件对话框尺寸。madVR不仅出示了多种多样优化算法，还容许你调整在其中的各种各样关键点。

3、madVR能够大幅度降低色调的错误概率。madVR的变大变小优化算法不仅能妥善处理gamma issues，还能恰当的依据高清片源的color matrix/range做恰当的颜色转换，并免疫力许多比如驱动软件等尝试“提升”界面。

 

实例教程具体内容为madVR的安裝、复位设定,并出示一键安装配备包及其安装方法给沒有看了科谱实例教程的同学们。

如果你觉得XX影音视频、XX看一下就能满足你的要求，那麼下面內容大并不看；假如你期待见到更出色的播放视频实际效果，又烦扰不容易设定，那麼强烈要求你细心念完实例教程。（**提醒：粗字体和**红色字体**表明务必留意的內容**）

## 

## **1.安装播放器、分离设备、音频解码器。**

**我因此实例教程出示了下列好多个版本号的安装文件：(中高及高环境变量仅出示x64安装文件)**

| **配备** | **Image doubing** | **chroma upscaling** | **image upscaling**       | **image downscaling** | **安装包下载** | **环境变量** |
| -------- | ----------------- | -------------------- | ------------------------- | --------------------- | -------------- | ------------ |
| **高**   | NNEDI3 32         | Super-XBR            | Jinc   AR                 | Catmull-Rom   AR  SC  | x64            | 免费下载     |
| **中高** | 无                | Super-XBR            | Jinc   AR                 | Catmull-Rom   AR  SC  | x64            | 免费下载     |
| **中**   | 无                | softcubic 60 AR      | lanczos 4 taps   AR       | Catmull-Rom   AR  SC  | x8  6/x64      | 免费下载     |
| **低中** | 无                | softcubic 60 AR      | bicubic sharpness 75   AR | Catmull-Rom   AR   SC | x86/x64        | 免费下载     |

**此一键安装包包括有MPC-HC、LAV分离设备、madVR渲染器，并含有如表所显示的预设设定文档。**不用干涉，若安全管家有一切提醒，容许就可以。一键安装。默认设置安裝到C盘。

假如早已恰当安裝madVR并恰当开启的阅读者（包含安裝过此一键包，期待立即拆换配备计划方案的）还可以直接下载相对环境变量，双击鼠标.reg文件，导入注册表就可以。

注：

低中配备档对于HD4000及下列配备的核心显卡/新手入门神卡;

中等水平配备对于HD4600及其同样部位独立显卡;

中高配备对于挪动级960M及其同级别的独立显卡;

高配备对于960及其同级别上下的独立显卡。

其他计划方案因为缺乏检测标准，暂不出示。设定关键对于HD-FHD 24Fps 视頻在4k輸出屏幕分辨率的情景，若播放视频出現卡屏请自主变更配备。

 

 

## **2.简易设定显示器主要参数**

**安裝进行后请应用****madLevelsTweaker.exe** **将显示信息色彩范围调节到0-255（在Force PC levels选择项上打钩再点一下Apply按键而且重启）**

 

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](.assets/ec30dzqo0yn.jpg)

**开启进行后按照如下图所示对显示屏开展设定**
 菜单栏中寻找新安裝的madVR，开启。

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](.assets/1yijoixpaks.jpg)

 

**一般状况下挑选digital monitor**

 

![[VCB-Studio科普教程2] madVR渲染器配置教程(2020/07/13更新)-玩吧ACG](.assets/ogcirogihkl.jpg)
 
 properties，**假如你是pc，挑选0-255，如果是TV，挑选16-235**。初始色调精密度，一般9ait控制面板选9ait。假如你是6bit  dither到9ait的控制面板，强烈推荐挑选7bit。挑选6bit/7bit能够降低打印色带难题，可是播放视频情况下界面微小杂点大量。假如你发觉你播放视频情况下常常发觉打印色带难题，你能挑选6bit/7bit。

 

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](.assets/xxhh2samdaf.jpg)

别的设定必须技术专业校色仪参加，如必须掌握，请参照：http://lysandria1985.blogspot.sg/2013/01/3-madvr.html

**到此，简易的配备早已进行。你能畅快的摧残你的独立显卡了。**

 

 

## **Tips:**

笔记本怎么让播放软件启用独显(Nvidia)

### **方式一：**

Nvidia显卡驱动现阶段早已屏蔽掉MPC-HC、Potplayer等播放软件的独显启用，能够根据下列方式打开：

开启MPC-HC的安装文件：

1.改动mpc-hc64.exe(或mpc-hc.exe)为别的名字（如改动为mpchc.exe）

2.开启Nvidia操作面板->管理方法3D设置->程序流程设定

3.点一下加上->访问 ，寻找更名后的mpchc.exe播放软件->加上选中的程序流程->正下方菜单栏中挑选Nvidia独立显卡

![[VCB-Studio科普教程2] madVR渲染器配置教程(2020/07/13更新)-玩吧ACG](http://cache.cswsadlab.com/wp-content/uploads/2016/08/5.png)
 
 这时mpc-hc即启用N卡。ps.这时候文件关联依然是原mpc-hc64.exe，因而必须用访问权限打开软件->选择项->文件格式->设定为默认设置程序流程。

### **方式二：**

应用NV Inspector开展开启（上文百度云盘里边有）：http://tieba.baidu.com/p/2642439635?see_lz=1

如果有兴趣爱好科学研究madVR的阅读者能够继续看事后实例教程。

 

 

 

## madVR渲染器实例教程FAQ

对于操作流程中很有可能出現的一些疑难问题，我还在此做一定的表述。

Q：Potplayer 或是 MPC-BE如何设置？

A：Potplayer我都沒有寻找适合的一键配备计划方案，因而只有手动式设定。大家只安裝整洁的**potplayer/MPC-BE lav音频解码器 madVR渲染器**。

最先安装下载文档（Potplayer/MPC-BE）。

Potplayer LAV madVR安裝实例（MPC-BE启用方式）：

大部分便是一路下一步。留意正中间全过程和最终完毕界面的启用。这儿只得出关键因素截屏。

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](http://cache.cswsadlab.com/wp-content/uploads/2016/08/1-1.png)

挑选安裝部件的情况下，这儿可选需不需要建立各种各样快捷方式图标，不用的可以不选。别的的选择项应当都看得懂吧。

安裝选择项

安裝结束后无需急着起动potplayer，可是必须安裝附加的编解码包，请所有启用：

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](http://cache.cswsadlab.com/wp-content/uploads/2016/08/2.jpg)

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](http://cache.cswsadlab.com/wp-content/uploads/2016/08/3.jpg)

安裝 LAV Filters：一样也大部分便是下一步。留意正中间全过程询问你是不是建立各种各样快捷方式图标，能够都挑选不建立。这儿只得出关键因素截屏。

这儿挑选安裝部件，只启用64bit 的视频解码器就可以了。

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](http://cache.cswsadlab.com/wp-content/uploads/2016/08/4-1.png)

安裝madVR：缓解压力网盘里的madVR.zip，留意相对路径中不可以有汉语，鼠标右键install.bat->以管理员身份运作，那样madVR便安裝好啦。

Potplayer复位设置：

开启Potplayer->选择项（F5）->ps滤镜->全局性ps滤镜优先权->加上系统软件ps滤镜，寻找LAV Video Decoder和madVR，加上，优先选择次序为强制性应用

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](http://cache.cswsadlab.com/wp-content/uploads/2016/08/5-1.png)

这时你能开启一个视频，按住Tab查询OSD信息内容，设定取得成功后显示信息以下。

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](http://cache.cswsadlab.com/wp-content/uploads/2016/08/6.png)

别的madVR配备能够参考madVR渲染器实例教程-入门篇。

 

Q:哪些的电脑上合适应用这类渲染器

A:大部分3-4代intel英特尔酷睿cpu内置核心显卡就可以应用，可是依据不一样的高清片源，不一样的輸出规定，并不可以确保视频都能一切正常播放视频。一般含有独显可以有更强的播放视频实际效果。针对一些老电脑或是Atom这类的低能耗Windows平板电脑，我建议应用EVR CP的播放视频计划方案。

 

Q:出示的.reg/exe一键安装包安全性么

A:出示的.reg、exe均为自己应用纯粹安装文件预制构件环境变量而成，无毒性没害。

 

Q:这实例教程是用于教大家播放视频炮姐时期这类的超清定时炸弹的么？

A:想的太多，并不是。这套madVR设定关键对于720-1080p视频源在輸出1080p屏幕分辨率的情况下设计方案的。

 

Q:假如我不愿意立即应用.reg文件或是一键安装包，那麼怎么设置？

A:这不是一两句话就能讲明白的配备，假如期待掌握设定方式，请自主找寻爬文更详尽的实例教程。

 

Q:好像我听见的配声不对？

A:在许多BD原盘里有好几条声轨能够转换，右下方系统托盘去有lav分离设备设定，右键就可以挑选路轨

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](http://cache.cswsadlab.com/wp-content/uploads/2016/08/7.png)

![[VCB-Studio科谱实例教程2] madVR渲染器配备实例教程(2016/08/13升级)- ACG17.COM](http://cache.cswsadlab.com/wp-content/uploads/2016/08/8.png)

 

Q:为啥的Potplayer没法载入外挂软件mka声轨？

A:播放视频设定，启用“全自动载入外界声轨”，那样你也就能够在鼠标右键-声频-声频挑选里边，转换到外挂软件声轨了。

 

Q:为何播放视频的情况下沒有外挂字幕？

A:若视頻内嵌字幕，则鼠标右键菜单中挑选外挂字幕，寻找相对外挂字幕轨病打开。若内嵌字幕未显示信息，则可根据拖动外挂字幕到播放软件对话框等方式添加字幕。假如你都还没下载字幕，那麼请自主检索相匹配字幕文件。

 

Q:为啥的Potplayer听上来响声非常小？

A:在播放歌曲的全过程中，鼠标右键视頻界面，声频-视频语音解决，看“标准化的”以前是不是有启用。这A:个选择项会全自动调节响声尺寸，如果你觉得不要想能够关掉（一般推荐动漫关掉，影片开启）

 

Q: 我用打开madVR以后觉得界面发灰，这是怎么回事？

A: EVRCP（包含一些手机软件的“界面提高技术性”）非常容易促使界面被各种各样“提升”随便色调，包含且不但仅限于驱动器和播放软件自身。调过色的界面很有可能会很好看，可是那不意味着是恰当的。

最后实际效果么发一下前后对比，留意sharlock衣服的在黑暗中，madVR輸出图的饱和度打印色带会轻许多，并且整体色调更当然

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](.assets/70a94e56gw1f0kry3ybuwj21hc0f0e4f.jpg)

(右键挑选在新标签页中打开图片,以查询大图图片)

再使用邻居的一张图，在日本动漫BDRip中经常会出现的因为界面拉申造成的锯齿状，在madVR中也有一定的缓解

![[VCB-Studio科普教程2] madVR渲染器配置教程(2016/08/13更新)- ACG17.COM](http://bbs.vcb-s.com/data/attachment/forum/201512/10/144326qb9teeewiwx19saw.png)

(右键挑选在新标签页中开启,以查询大图图片)

实例教程內容参照：

~~http://vcb-s.com/archives/1216（早已进行历史时间每日任务的前实例教程）~~

http://vcb-s.com/archives/4567

http://lysandria1985.blogspot.sg/2013/01/3-madvr.html

http://lysandria1985.blogspot.sg/2014/01/1madvr-profile.html

来源于： [VCB-Studio科谱实例教程2] madVR渲染器配备实例教程(2016/08/13升级) http://vcb-s.com/archives/5610