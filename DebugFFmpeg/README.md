# Debug FFmpeg in Android

这是一个用于调试FFmpeg的骨架。

使用步骤：
* 先clone FFmpeg，并在在../build_script里生成构建出.so
* 复制FFmpeg的代码到jni/ffmpeg，至少包括以下目录

    compat
    configure        
    ctomakerule.py   
    ffbuild  
    libavcodec   
    libavfiltersupport_c.txt  
    libavresample  
    libavutilsupport_c.txt  
    LICENSE.md
    config.h  
    CONTRIBUTING.md  
    extract_make.sh  
    fftools  
    INSTALL.md                    
    libavfilter  
    libavformat               
    libavutil      
    libpostproc             
    tools
* 使用gen_make_rule_from_config.py生成所需的.c文件列表，用于编写makefile
* 根据例子修改ffmpeg.c和ffmpeg.h，增加命令执行函数的jni，以及内存清理函数。复制fftools/里的ffmpeg文件到jni/libffmpeg_main里
* 根据example_Android.mk编写Android.mk 引用需要的.so和.c文件
* 使用Android Studio debug

***注意***：
1. ffmpeg 的代码和.so版本需要对应
2. 不需要用fdk_aac，如果使用，注意保持so和代码的一致
3. 有一些源码会缺失 include <config.h> 之类的include代码，根据提示加上就好
4. 不要一次性debug整个ffmpeg，只debug其中一个库就好，因为编译会很慢
5. Application.mk 里面可能需要加APP_SHORT_COMMANDS。不然在windows会超过命令行最大字符限制


### 参考
https://github.com/xiyanglu/AndroidFFmpeg

    
