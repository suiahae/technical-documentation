# 修改mac地址

在修改之前，可以先确定一下要修改的网卡MAC地址，查询方法有很多种，比如：

1、在设置→网络和Internet→WLAN/以太网，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_154224_622.png)

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_154420_45.png)

2、在控制面板→网络和共享中心→更改适配器设置中，右键单击或双击你想要修改的网络连接，在“详细信息”中就能看到MAC地址，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_154750_393.png)

3、在命令提示符中，使用 ipconfig /all 命令查看所有网卡信息，这个方式很简单直接，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_155038_882.png)

如果你有多个网卡，或者使用虚拟机之类的软件，这里会显示很多内容，所以要甄别好究竟哪个是你真正要找的网卡地址，上面写着VirtualXXX之类的一般都是虚拟网卡，真正的物理网卡会冠有Intel、Realtek等厂商名称，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_155022_434.png)

▲图片说明：这是测试机的物理网卡

方法一：直接在设备管理器中修改

这个方法并不是万能的，因为有些网卡并没有提供修改的接口，但这是最省事的。操作如下：

1、在控制面板→设备管理器→网络适配器中找到实际的网卡，然后右键单击或双击进入属性，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_151549_102.png)

2、在“高级”选项卡中，查看是否有“Network Address”、“MAC Address”或“网络地址”等内容，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_151909_157.png)

▲图片说明：这个网卡就没法直接改MAC地址

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_153412_823.png)

▲图片说明：换了一台三星平板，里面的有线网卡就能改

3、要修改并不难，直接在“值”里面填写要改成的地址就好。需要注意的是，MAC地址由6组16进制的两位数组成，16进制与10进制的数字换算如下：

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_152851_966.png)

虽然常见的MAC地址每组数字之间都有横线“-”隔开，但在此处输入时无需横线，只是我们自己要数好了别多输或少输，如下图 —— 

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_152013_332.png)

4、点击“确定”后可以查看一下是否修改成功，如下图 —— 

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_153934_247.png)

方法二：使用注册表编辑器修改

这个方法比较万能，无论网卡本身是否提供MAC修改功能，都可以在这里修改成功，以上一个方法中没有修改接口的Intel网卡为例，修改步骤如下：

1、在Cortana搜索栏输入regedit，按回车键进入注册表编辑器

2、定位到

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}

3、以下图为例，每个00XX的代号都代表一个网卡（下图中除了0004，都是虚拟网卡），要想分辨出你想要的网卡型号，得在点击编号后，在右侧的DriverDesc值中确定型号，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_155851_614.png)

4、确定好网卡后，就在这个网卡的项目中新建一个字符串值，命名为NetworkAddress，内容是新的MAC地址，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_160126_290.png)

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_160140_538.png)

5、点击“确定”后修改完毕，此时需要重启连接进行验证。可以在相应的“网络连接”中单击右键，选择“禁用”，然后再点击“启用”即可，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_160416_970.png)

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_160437_353.jpg)

6、此时可以查看一下新的地址，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址（MAC）](https://img.ithome.com/newsuploadfiles/2016/7/20160727_160657_280.png)

这种方法也适用于[Win7](http://www.win7china.com/)/[Win8.1](http://win8.ithome.com/)，但有些型号的网卡可能修改不成功。由于MAC地址唯一，因此可以用来跟踪设备，如果你不想被跟踪，可以考虑使用该方法修改。

另外，如果你觉得上述方法麻烦，也可以使用[软媒魔方](http://mofang.ruanmei.com/)（[点击下载](http://down.ruanmei.com/tweakcube/partner/pcmastersetup_u143.exe)）的设置大师→网络设置来修改，直观方便。在“网卡MAC地址”中填写想要修改的地址，然后点击右边“保存设置”即可，如下图 ——

![Win10秘笈：两种方式修改网卡物理地址(MAC)](https://img.ithome.com/newsuploadfiles/2016/7/20160727_171718_21.png)