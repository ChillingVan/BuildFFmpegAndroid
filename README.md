# FFmpeg2AndroidDemo
This is a compilation of **Android** available under the **FFmpeg** project, containing code examples.<br>

This project is forked from https://github.com/mabeijianxi/FFmpeg4Android




中文说明看 README_CN.md
## The project includes:
> * FFmpeg Full Platform Compilation Script
> * Libx264 Full Platform Compilation Script
> * Libx264 Full Platform Compilation Script
> * Compiled Good Version of the SO library (download in ffmpeg3.2.5 / android)
> * Compiled Rich Version of the SO library (download in ffmpeg3.2.5 / android_more)> * CMake Compile FFmpeg as the script which can be command
> * Android Use Case

## Compile 
1. Change the settings.sh to match your OS and NDK build tools.

2. Run {jianxi_ffmpeg_build_all.sh [build_configure_sh] [skip_build_dependancy]} for all, or you can just run .sh files one by one.

## Announcements
* This project script is generic, but you may modify some of the paths defined in the script or keep my directory structure, otherwise it will be unsuccessful when executing <br>
* If you download from the official website, then you need to follow my blog or other online tutorials on **FFmpeg** and **libfdk-aac** to make the changes, or there may exit some problem

## FAQ
1. 'aclocal-1.15' is missing on your system.  
Make sure:
	autotools-dev
	automake
	autoconf2.13
	m4
	
are installed
(I am not sure whether these are enough, if not, install 
	perl
	libperl5.14
	, too.
)
And then run
  autoreconf -ivf 

