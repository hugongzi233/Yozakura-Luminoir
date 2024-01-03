>务必在每次更新文件都要在文件中添加注释

## 常用工具

- [ONScripterAPI命令参考](https://kaisernet.org/onscripter/api/NScrAPI-framed.html)
- [みんちりえ背景素材](https://kaisernet.org/onscripter/api/NScrAPI-framed.html)

## nscript语法

### 游戏开始/结束/退出

| 命令  | F/E/R/S | 描述 | 例子 |
| :----- | :--: | :------- | :------- |
| *define | R  |定义define块开始的标签||
| game | F  |结束define块并开始执行游戏||
| *start | R  |定义program块开始的标签||
| reset | E |重置游戏||
| definereset | E  |强制重置全部脚本||
| end | FE  |结束游戏并关闭窗口||
### 语法
| 命令  | F/E/R/S | 描述 | 例子 |
| :----- | :--: | :------- | :------- |
| * | R  |标签|*option1|
| ; | R  |注释|;这是注释|
| : | R  |在一行连续执行多条命令|if what command1:command2|
| % | R  |数字变量|%0 - %4095|
| $ | R  |字符串变量|$0 - $4095|
| ? | R  |数组变量||
| ~ | R  |jumpf/jumpb 的跳转点||
| / | S  |忽略换行||
|{} | S  |set variables within a text block||
| ` | S  |进入单字节文本模式|\`我有\` %0 `个苹果.@|
| 0x| R  |provide a numeric literal in hexadecimal format||
| ^ | S  |进入ponscripter文本模式||
### 文本窗口
| 命令  | F/E/R/S | 描述 | 例子 |
| :----- | :--: | :------- | :------- |
| setwindow | R  |||
| setwindow2 | R  |||
| textoff | R  |||
| texton | R  |||
| windoweffect | R  |||
| erasetextwindow | R  |||
| btnnowindowerase | R  | ||
| noteraseman| S  |||
|gettext | S  |||
| tateyoko | S  |||
| windowchip| R  |||
| setwindow3| S  |||
| setwindow4| S  |||
| timespeeddefault| S  |||
| font| S  |||
---

默认格式
```lua
*define
game

*start
end
```

