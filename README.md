## Flutter 学习与记录
#### 1. windows 下 Flutter环境搭建
**前提**
- 操作系统: Windows 7 或更高 (64-bit)
- 磁盘空间: 400 MB (不包括Android Studio的磁盘空间).
- 工具:  Git for Windows (Git命令行工具)
- Git下载链接: [https://git-scm.com/download/win][1]
- Git安装教程: [https://blog.csdn.net/u013295518/article/details/78746007][2]

**注意**

`国内用户需要设置国内镜像 ` ==> 设置环境标量
 - 变量名: PUB_HOSTED_URL
 变量值: https://pub.flutter-io.cn
 - 变量名: FLUTTER_STORAGE_BASE_URL
 变量值: https://storage.flutter-io.cn

a. 在喜欢的(例如: D:\Flutter)目录下 **鼠标右击** 选择 **Git Bash Here** 在命令行中输入
`git clone -b beta https://github.com/flutter/flutter.git`

b. 设置环境变量path中添加 flutter目录 以便可以在命令行中运行

    例如: D:\Flutter\flutter\bin

`添加成功后 需要重新打开 cmd/git 命令行才能识别 flutter命令`

c. 在命令行中执行 `flutter doctor` 查看是否需要安装任何依赖项来完成安装


[1]: https://git-scm.com/download/win
[2]: https://blog.csdn.net/u013295518/article/details/78746007