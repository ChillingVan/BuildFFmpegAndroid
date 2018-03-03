# FFmpeg2AndroidDemo

Forked from https://github.com/mabeijianxi/FFmpeg4Android
原项目太大，文件有点乱，所以新建了。

## 编译
1. 修改 settings.sh ，使之对应你的构建环境。包括NDK路径等。

2. 运行 {jianxi_ffmpeg_build_all.sh [build_configure_sh] [skip_build_dependancy]}。也可以一个一个.sh文件运行来构建。

## 例子：
直接运行即可


## FAQ
1. 'aclocal-1.15' is missing on your system.  (Ubuntu)
保证下列已安装:
	autotools-dev
	automake
	autoconf2.13
	m4
	
(如果还不够，装就要装以下 
	perl
	libperl5.14
	, too.
)
最后运行
autoreconf -ivf 


