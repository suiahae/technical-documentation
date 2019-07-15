# 误删也能找！清空回收站后文件找回技巧

*2016-01-13 16:04 出处：PConline原创 作者：唐山居人*  



　　**【PConline 资讯】**职场中常常会遭遇各种尴尬，误清回收站恐怕是这其中最让人头疼的了。虽然一般来说，清空回收站在Windows里是一项非逆转操作，可绝非无药可解。接下来小编就教大家一招，如何找回被误清空回收站里的文件。

1. 首先按下快捷键Win+R，输入“regedit”启动注册表编辑器；[![误删文件撤回 清空回收站找回文件 误删文件找回](https://img0.pconline.com.cn/pconline/1601/13/7444942_01_thumb.jpg)](https://www.pconline.com.cn/skill_pic/744/7444942_pic.html?imgsrc=//img0.pconline.com.cn/pconline/1601/13/7444942_01.jpg&channel=7988) 



2. 然后查找并定位到“

	```
	HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace　　
	```

1. 在左侧树形结构中查找一个名为“{645FF040-5081-101B-9F08-00AA002F954E}”的项值，如果没有就直接新建一个；（注意大括号也要输入）[![误删文件撤回 清空回收站找回文件 误删文件找回](https://img0.pconline.com.cn/pconline/1601/13/7444942_02_thumb.jpg)](https://www.pconline.com.cn/skill_pic/744/7444942_pic.html?imgsrc=//img0.pconline.com.cn/pconline/1601/13/7444942_02.jpg&channel=7988) 
   
2. 双击新项目右窗格中的“默认”字符串，将其所对应的“数值数据”修改为“回收站”；[![误删文件撤回 清空回收站找回文件 误删文件找回](https://img0.pconline.com.cn/pconline/1601/13/7444942_03_thumb.jpg)](https://www.pconline.com.cn/skill_pic/744/7444942_pic.html?imgsrc=//img0.pconline.com.cn/pconline/1601/13/7444942_03.jpg&channel=7988) 
   
3. 好了，现在重启一下电脑，再打开回收站，是不是之前清空的内容又都回来啦？[![误删文件撤回 清空回收站找回文件 误删文件找回](https://img0.pconline.com.cn/pconline/1601/13/7444942_04_thumb.jpg)](https://www.pconline.com.cn/skill_pic/744/7444942_pic.html?imgsrc=//img0.pconline.com.cn/pconline/1601/13/7444942_04.jpg&channel=7988) 
   
4. 这个方法比较简单，且不需要任何第三方软件。不过需要清空回收站后马上处理，千万不要重启电脑，当然你也可以借助专业的数据恢复软件，不过那个相对就比较麻烦了。