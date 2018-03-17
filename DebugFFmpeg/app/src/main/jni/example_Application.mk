APP_ABI := armeabi-v7a
APP_PLATFORM := android-24
APP_SHORT_COMMANDS :=true
# system - 使用默认最小的C++运行库，这样生成的应用体积小，内存占用小，但部分功能将无法支持
# stlport_static - 使用STLport作为静态库，这项是Android开发网极力推荐的
# stlport_shared - STLport 作为动态库，这个可能产生兼容性和部分低版本的Android固件，目前不推荐使用。
# gnustl_static - 使用 GNU libstdc++ 作为静态库
# 使用STLport作为静态库，这项是Android开发网极力推荐的
#APP_STL := stlport_static
# APP_STL := gnustl_static
# APP_CPPFLAGS := -std=gnu99


