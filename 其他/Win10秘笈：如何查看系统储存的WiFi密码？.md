# Win10秘笈：如何查看系统储存的WiFi密码？

还有一种方法，就是通过“命令提示符”工具来查询所有使用过的WiFi连接密码，具体方法如下：

1、右键单击开始按钮，选择“**命令提示符（管理员）**”

2、输入如下命令（下图①号命令）：

**netsh wlan show profiles**

![Win10秘笈：如何查看系统储存的WiFi密码？](assets/20160421_155714_8.png)

▲密码会在下方“密钥内容（key content）”中给出，本图不再列出

3、在给出的曾经使用过的WiFi连接中选择你想查询的连接名称，然后套入如下命令（上图②号命令）中查询密码：

**netsh wlan show profile name="连接名" key=clear**

注意上述命令中的空格，符号不要使用中文，文中“连接名”三个字替换为查询到的连接名称。

4、也可以使用如下命令直接查询所有使用过的连接密码：

**netsh wlan show profile \* key=clear**

注意通配符“\*”前后的空格不要漏掉。

netsh wlan delete profile name="Mixsx's"