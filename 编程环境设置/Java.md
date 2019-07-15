## 1.Java SE Install

[Java SE 11 Downloads](https://www.oracle.com/technetwork/java/javase/downloads/index.html)

> - 变量名：**JAVA_HOME**
> - 变量值：**C:\Program Files\Java\jdk-11.0.1**        // 要根据自己的实际路径配置
> - 变量名：**Path**( 在此名下添加一个新条目，而非新建path)
> - 变量值：**%JAVA_HOME%\bin**
>   > [多余]- 变量名：**Path**
>   > [多余]- 变量值：**%JAVA_HOME%\jre\bin;**
>   > [多余]- 变量名：**CLASSPATH**
>   > [多余]- 变量值：**.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;**

> 如果以前安装有jre，可能会出现cmd中可以编译却无法运行的错误提示(编译目标环境版本高于运行环境)，可以选择
> 1. 卸载原有jre
> 2. 或，将`Path`中“JAVA_HOME%\bin”条目上移至第一项，并保存
> ```
> java -version
> ```

```java
public class HelloWorld {
    public static void main(String []args) {
        System.out.println("Hello World");
    }
}
```

```
bin/jlink --module-path jmods --add-modules java.base --output jre
bin\jlink.exe --module-path jmods --add-modules java.desktop --output jre
                                            java.core
```