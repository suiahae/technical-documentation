## VS Code Environment Settings[[1]][1]

### 0. 环境配置

#### 1. 首先安装好 GCC 并配好环境变量[[2]][2]

> 0. 地址: [MinGW-w64](https://sourceforge.net/projects/mingw-w64/files/)
>
> 1. 下载: `MinGW-w64`压缩包`x86_64-win32-seh ***.exe`到本地，解压缩，进行配置
>
> 2. 配置: 在环境变量`Path`中添加` MinGW-w64 的 bin 文件夹地址`条目, 例:
>
>     ```
>     D:\Program Files\mingw-w64\x86_64-8.1.0-release-win32-seh-rt_v6-rev0\mingw64\bin
>     ```
>
> 3. 测试: 输入`gcc -v` 并按回车键（Enter），将会显示 MinGW-w64 的组件列表

#### 2. VS Code 插件

> [C/C++ - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

### 1. 使用 VS Code 的 [Tasks](https://code.visualstudio.com/docs/editor/tasks) 功能启用编译运行命令

#### 1. 新建 task.json

> 1. 打开文件夹建立工作区
>
> 2. 按`f1`或`ctrl+shift+p`显示所有命令
>
> 3. 输入`task`选择`配置任务`(tasks: configure task), 新建task.json文件, 选择任意即可
>
> 4. 用以下内容替换
>
>     ```json
>     {
>         // See https://go.microsoft.com/fwlink/?LinkId=733558
>         // for the documentation about the tasks.json format
>         "version": "2.0.0",
>         "tasks": [
>             {
>                 "label": "Build",
>                 "command": "g++",
>                 "args": [
>                     "-g",
>                     "-Wall",
>                     "-std=c++11",
>                     "-lm",
>                     "${file}",
>                     "-o",
>                     "${fileDirname}/${fileBasenameNoExtension}.o"
>                 ],
>                 "windows": {
>                     "args": [
>                         "-g",
>                         "-Wall",
>                         "-std=c++11",
>                         "-lm",
>                         "${file}",
>                         "-o",
>                         "${fileDirname}/${fileBasenameNoExtension}.exe"
>                     ]
>                 },
>                 "presentation": {
>                     "reveal": "always",
>                     "echo": false,
>                     "focus": true
>                 },
>                 "problemMatcher": {
>                     "owner": "cpp",
>                     "fileLocation": "absolute",
>                     "pattern": {
>                         "regexp": "^(.*):(\\d+):(\\d+):\\s+(error):\\s+(.*)$",
>                         "file": 1,
>                         "line": 2,
>                         "column": 3,
>                         "severity": 4,
>                         "message": 5
>                     }
>                 }
>             },
>             {
>                 "label": "Run",
>                 "type": "shell",
>                 "dependsOn": "Build",
>                 "command": "${fileDirname}/${fileBasenameNoExtension}.o",
>                 "windows": {
>                     "command": "${fileDirname}/${fileBasenameNoExtension}.exe"
>                 },
>                 "args": [],
>                 "presentation": {
>                     "reveal": "always",
>                     "focus": true
>                 },
>                 "problemMatcher": [],
>                 "group": {
>                     "kind": "test",
>                     "isDefault": true
>                 }
>             }
>         ]
>     }
>     ```

#### 2. 键位绑定

> 1. 到窗口左下角点齿轮再点 「键盘快捷方式」
>
> 2. 找到 「Run Test Task」 命令，编辑绑定按键，习惯设成`ctrl+f10` 
>
>     或者点开上图输入框下的`keybinding.json`配置：
>
>     ```json
>     {
>         "key": "f10",
>         "command": "workbench.action.tasks.test"
>     } 
>     ```

[1]:https://zhuanlan.zhihu.com/p/35178331
[2]: http://rsreland.net/archives/1760