`
# image setting
:a; 透明通道
:a/<fps>,<time>,<0/1/2>;      //0-从左到右循环播放 1-播放一次 2-折返循环播放
:c; 完整展示图片
:l; 白色透明
:s/<宽>,<高>,<0/1/2>;#66ccff 文字
# satex
*define
transmode alpha 默认以alpha方式表示透明
effect <id>,<effect>,<time>
bgmfadeout <time>
rmenu "保存",save,"读取",load,"自动",automode,"跳过",skip,"隐藏文字",windowerase,"回想模式",lookback,"重置",reset
numalias <name>,<%id>   变量赋名(%id -> %name)
game
*start
mov %1,1            数字变量(0-4096)
end
reset               重置游戏
definereset         重置define
# other
defaultfont MS Gothic   默认字体
!s<number> / textspeed <number>     文字速度
;注释
:连接符             //ex if %1==1 goto *op:mov %1,2:bgmstop
`半角英文允许
click               单击后运行
if <cmd>            //ex if %1==1 goto *op
goto <page>         跳转标签
gosub <page>        跳转标签，但是遇到return返回
quake <px>,<time>   振动
wait <time>         等待
# effect
0.在下一次刷新时显示
1.瞬时显示。不需要运行时变量。
2.左侧快门
3.右侧快门
4.向上快门
5.向下百叶窗
6.左侧窗帘
7.右侧窗帘
8.向上窗帘
9.向下的窗帘
10.像素交叉渐变
11.左侧滚动
12.右侧滚动
13.向上滚动
14.向下滚动
15.通过掩模图案淡化。必须设置一个文件名，指向一个掩码bmp（256色或全色）。在这个遮罩bmp中，黑色地方显示快，白色地方显示慢
16.马赛克。调用此效果后，屏幕的状态将像使用效果编号0一样不确定，因此请立即调用显示命令，如打印。
17.马赛克
18.通过掩模的交叉衰落。这与15类似，只是它的处理器密集度要高得多，所以一定要小心使用这种效果。
# bg 背景
bg "",<effect>,<time>
//ex: bg "",<id>
//ex: bg "",15,1000,"ym.bmp"
bg(支持black,#ffffff...#000000)
# ld 立绘
ld l,"",
ld <位置l/c/r>,<:a;图片>,<effect>,<time>
cd <位置l/c/r>,<effect>,<time>
# lsp 精灵
lspid小的在上面
lsp <lspid>,"",<x>,<y>
lsph <lspid>,"",<x>,<y>     隐藏状态下加载精灵
print <effect>,<time>
print 1             立即刷新
msp <lspid>,<相对x>,<相对y>
amsp <lspid>,<x>,<y>
vsp <lspid>,<0/1>   可视化改变
csp <lspid>         清除
# voice wav/ogg
bgm ""
bgmonce ""
bgmstop
dwave <声道>,""
声道(0-50 0作为语音声道 1作为音效声道)
# select
select "选项",*option1,"选项2",*option2
*option1
# window
window(默认px640*480 左上角为0,0)
;mode800 800*600
setwindow <第一个文字x>,<第一个文字y>,<行字数>,<行数>,<文字宽>,<文字高>,<行间距>,<速度ms>,<粗体>,<阴影01>,<图片>,<图x>,<图y>
setwindow 20,370,20,3,30,30,0,0,20,0,1,":a;pic.png",10,200
setwindow2 #rrggbb
setwindow2 ":c;twindow2.bmp"
`