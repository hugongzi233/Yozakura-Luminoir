>务必在每次更新文件都要在文件中添加注释

## 常用工具

- [ONScripterAPI命令参考](https://kaisernet.org/onscripter/api/NScrAPI-framed.html)
- [みんちりえ背景素材](https://min-chi.material.jp/)

## nscript

### 游戏开始/结束/退出

| 命令        |   C   | 描述                       | 例子 |
| :---------- | :---: | :------------------------- | :--- |
| *define     |   R   | 定义define块开始的标签     |      |
| game        |   F   | 结束define块并开始执行游戏 |      |
| *start      |   R   | 定义program块开始的标签    |      |
| reset       |   E   | 重置游戏                   |      |
| definereset |   E   | 强制重置全部脚本           |      |
| end         |  FE   | 结束游戏并关闭窗口         |      |
### 语法
| 命令 |   C   | 描述                              | 例子                      |
| :--- | :---: | :-------------------------------- | :------------------------ |
| *    |   R   | 标签                              | *option1                  |
| ;    |   R   | 注释                              | ;这是注释                 |
| :    |   R   | 在一行连续执行多条命令            | if what command1:command2 |
| %    |   R   | 数字变量                          | %0 - %4095                |
| $    |   R   | 字符串变量                        | $0 - $4095                |
| ?    |   R   | 数组变量                          |                           |
| ~    |   R   | jumpf/jumpb 的跳转点              |                           |
| /    |   S   | 忽略换行                          |                           |
| {}   |   S   | set variables within a text block |                           |
| `    |   S   | 进入单字节文本模式                | \`我有\` %0 `个苹果.@     |
| ^    |   S   | 进入ponscripter文本模式           |                           |
### 文本窗口
| 命令             |   C   | 描述                                         | 例子                 |
| :--------------- | :---: | :------------------------------------------- | :------------------- |
| setwindow        |   E   |                                              |                      |
| setwindow2       |   E   |                                              |                      |
| textoff          |   E   | 隐藏文本窗口                                 |                      |
| texton           |   E   | 显示文本窗口                                 |                      |
| windoweffect     |  FE   | 在文本窗口隐藏时利用effect再显示             | windoweffect 10,1000 |
| erasetextwindow  |   F   | 在显示effect的时候隐藏文本框                 | erasetextwindow 1    |
| btnnowindowerase |   F   | 在按钮被激活时不删除文本窗口                 |                      |
| noteraseman      |   E   | 在文本窗口被删除时保留静态图片               |                      |
| gettext          |   E   | 返回当前显示在文本窗口中的文本               | gettext $0           |
| tateyoko         |   E   | 垂直显示文字模式                             | tateyoko 1           |
| windowchip       |   F   | 在文本窗口中附加精灵，同步文本窗口删除和显示 | windowchip sprite1   |
| setwindow3       |   E   | 与setwindow相同，但不清除Log缓存             |                      |
| setwindow4       |   E   | setwindow升级版，更好的支持UTF-8             |                      |
| textspeeddefault |   E   | 更改默认文字显示速度(!sd)                    | textspeeddefault 200 |
| font             |   E   | 更改显示字体                                 | font "宋体"          |
### 文字显示
| 命令          |   C   | 描述                               | 例子              |
| :------------ | :---: | :--------------------------------- | :---------------- |
| !s            |   S   | 设置文本显示速度                   | !s200             |
| #             |   S   | 改变颜色                           | #FF0000你好       |
| textclear     |   E   | 清除显示的文本                     |                   |
| locate        |   E   | 改变文本插入文本窗口的插入绝对位置 | locate 100 500    |
| puttext       |   E   | 显示字符串                         | puttext $0        |
| br            |   E   | 插入一个换行                       |                   |
| textspeed     |   E   | 改变文字显示速度                   | textspeed 200     |
| shadedistance |  FE   | 文字阴影                           | shadedistance 2,3 |
### 点击等待
| 命令          |   C   | 描述                         | 例子                              |
| :------------ | :---: | :--------------------------- | :-------------------------------- |
| @             |   S   | 进入点击等待                 | 但是..@                           |
| \             |   S   | 进入换页点击等待             | 好的\                             |
| clickstr      |   E   | 进入点击等待直到特定字符出现 | clickstr "。！？`.!?",2           |
| linepage      |   E   | 每一行都改为换页点击等待<!>  |                                   |
| _             |   S   | 忽略点击等待                 | 什么？_/                          |
| clickvoice    |   F   | 在点击等待状态下指定声音     | clickvoice "click.wav","page.wav" |
| autoclick     |   E   | 在行末自动点击<?>            |                                   |
| click         |   E   | 进入点击等待                 |                                   |
| lrclick       |   E   | 进入左右点击等待             | getret %0 (0-right 1-left)        |
| clickskippage |   F   | 忽略未读文本                 |                                   |
### 鼠标光标
| 命令            |   C   | 描述 | 例子 |
| :-------------- | :---: | :--- | :--- |
| setcursor       |   E   | 在等待鼠标点击时的光标     |      |
| abssetcursor    |   E   |      |      |
| mousecursor     |   E   |      |      |
| mousemode       |   E   |      |      |
| movemousecursor |   E   |      |      |
| getnextline     |   E   |      |      |

### 影片
| 命令     |   C   | 描述                     | 例子                                                           |
| :------- | :---: | :----------------------- | :------------------------------------------------------------- |
| avi      |   E   | avi <文件>,<是否可跳过>  | avi "1.avi",1                                                  |
| mpegplay |   E   | mpeg <文件>,<是否可跳过> | mpegplay "1.mpg",1                                             |
| movie    |   E   | 播放影片                 | movie STR[,'pos',NUM,NUM,NUM,NUM][,'click'][,'loop'][,'async'] |
---

默认格式
```lua
*define
game

*start
end
```

