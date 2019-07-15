因为每次关机都要经历这个，而且恰好到90s才开始关机，就觉得肯定是配置的问题了。

hcking@kali:~$ sudo vim /etc/systemd/system.conf 
[sudo] hcking 的密码：
终端命令如上，使用VIM打开配置文件。在最后新增一行，将以下内容复制下去，重启后配置即可生效。
DefaultTimeoutStartSec=10s
DefaultTimeoutStopSec=10s