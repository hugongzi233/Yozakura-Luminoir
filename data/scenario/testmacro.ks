*testmacro

[macro name=meg]
[SYS_B]
[eval exp="tf.name=mp.name"]
[eval exp="meg.show(tf.name)"]
[endmacro]

@meg name="提示文本"
[p]