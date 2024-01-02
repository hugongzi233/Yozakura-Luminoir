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
| ; | R  |注释|;增加选择肢 20240102|
| : | R  |在一行连续执行多条命令||
| % | R  |数字变量||
| $ | R  |字符串变量||
| ? | R  |数组变量||
| ~ | R  |jumpf/jumpb 的跳转点||
| / | S  |ignore linefeed||
|{} | S  |set variables within a text block||
| ` | S  |enter single-byte text mode||
| 0x| R  |provide a numeric literal in hexadecimal format||
| ^ | S  |enter ponscripter text mode||

---

默认格式
```lua
*define
game

*start
end
```

