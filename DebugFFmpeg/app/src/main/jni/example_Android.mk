LOCAL_PATH := $(call my-dir)

# Example 
###############################
#libffmpeg_main
###############################

# version of libavcodec
include $(CLEAR_VARS)
LOCAL_MODULE:= libavcodec_share
LOCAL_SRC_FILES:= ./build/lib/libavcodec.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_SHARED_LIBRARY)

# version of libavformat
include $(CLEAR_VARS)
LOCAL_MODULE:= libavformat_share
LOCAL_SRC_FILES:= ./build/lib/libavformat.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_SHARED_LIBRARY)

# version of libswscale
include $(CLEAR_VARS)
LOCAL_MODULE:= libswscale_share
LOCAL_SRC_FILES:= ./build/lib/libswscale.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_SHARED_LIBRARY)

# version of libavutil
include $(CLEAR_VARS)
LOCAL_MODULE:= libavutil_share
LOCAL_SRC_FILES:= ./build/lib/libavutil.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_SHARED_LIBRARY)

# version of libavdevice
include $(CLEAR_VARS)
LOCAL_MODULE:= libavdevice_share
LOCAL_SRC_FILES:= ./build/lib/libavdevice.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_SHARED_LIBRARY)

# version of libavfilter
# include $(CLEAR_VARS)
# LOCAL_MODULE:= libavfilter_share
# LOCAL_SRC_FILES:= ./build/lib/libavfilter.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
# include $(PREBUILT_SHARED_LIBRARY)

# version of libswresample
include $(CLEAR_VARS)
LOCAL_MODULE:= libswresample_share
LOCAL_SRC_FILES:= ./build/lib/libswresample.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_SHARED_LIBRARY)

# version of libpostproc
# include $(CLEAR_VARS)
# LOCAL_MODULE:= libpostproc_share
# LOCAL_SRC_FILES:= ./build/lib/libpostproc.so
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
# include $(PREBUILT_SHARED_LIBRARY)

#static version of libx264
include $(CLEAR_VARS)
LOCAL_MODULE:= libx264_static
LOCAL_SRC_FILES:= ./build/lib/libx264.a
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=neon -O3 -ffast-math -funroll-loops
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
include $(PREBUILT_STATIC_LIBRARY)




##### Example for build libavfilter ##########################
include $(CLEAR_VARS)

FFMPEG_ROOT=$(LOCAL_PATH)/ffmpeg
LOCAL_C_INCLUDES := $(FFMPEG_ROOT) \

LOCAL_MODULE := ffmpeg_cmd

LOCAL_LDLIBS := -llog -lz -ldl -landroid -lm

LOCAL_SRC_FILES :=  \
	libffmpeg_main/ffmpeg_cmd.c \
	libffmpeg_main/ffmpeg_cmd_wrapper.c \
	libffmpeg_main/cmdutils.c \
	libffmpeg_main/ffmpeg.c \
	libffmpeg_main/ffmpeg_opt.c \
	libffmpeg_main/ffmpeg_filter.c \
	libffmpeg_main/ffmpeg_cuvid.c \
	libffmpeg_main/ffmpeg_hw.c \


LOCAL_CFLAGS := -DANDROID -std=gnu99 -march=armv7-a -mfloat-abi=softfp -mfpu=neon -O3 -ffast-math -funroll-loops -DFFMPEG_RUN_LIB -DLOG_TAG=\"FFMPEG\"
LOCAL_STATIC_LIBRARIES := libx264_static
LOCAL_SHARED_LIBRARIES :=  libavcodec_share \
                        libavformat_share \
                        libswscale_share \
                        libavutil_share \
                        libavdevice_share \
                        libswresample_share


include $(BUILD_SHARED_LIBRARY)
