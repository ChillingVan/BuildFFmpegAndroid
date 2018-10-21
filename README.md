# FFmpeg2AndroidDemo

Forked from https://github.com/mabeijianxi/FFmpeg4Android
原项目太大，文件有点乱，所以新建了。

## 编译
0. 修改ffmpeg.settings的ffmpeg路径，可以直接git submodule update来拉取最新的FFmpeg
  ffmpeg 大，clone速度慢，可以尝试https://gitee.com/ChillingVan/FFmpeg
1. 修改 settings.sh ，使之对应你的构建环境。包括NDK路径等。
2. 运行 {jianxi_ffmpeg_build_all.sh [build_configure_sh] [skip_build_dependancy]}。也可以一个一个.sh文件运行来构建。

## 注意
不同版本的ffmpeg的configure不一样。如果有报错，请尝试修改各个build_configure.sh来实现。
目前我只在3.2.5和3.4测试过，其它版本请修改configure参数。

configure各个参数就不说明了，在ffmpeg的configure文件里有详细的说明.

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


