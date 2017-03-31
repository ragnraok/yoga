
LOCAL_PATH := $(call my-dir)

# yoga-dep
include $(CLEAR_VARS)
LOCAL_MODULE := yoga-dep
LOCAL_SRC_FILES := ../../lib/fb/assert.cpp \
                   ../../lib/fb/jni/ByteBuffer.cpp \
                   ../../lib/fb/jni/Countable.cpp \
                   ../../lib/fb/jni/Environment.cpp \
                   ../../lib/fb/jni/Exceptions.cpp \
                   ../../lib/fb/jni/fbjni.cpp \
                   ../../lib/fb/jni/Hybrid.cpp \
                   ../../lib/fb/jni/jni_helpers.cpp \
                   ../../lib/fb/jni/LocalString.cpp \
                   ../../lib/fb/jni/OnLoad.cpp \
                   ../../lib/fb/jni/References.cpp \
                   ../../lib/fb/jni/WeakReference.cpp \
                   ../../lib/fb/log.cpp \
                   ../../lib/fb/lyra/lyra.cpp \
                   ../../lib/fb/onload.cpp

LOCAL_CPPFLAGS += -DLOG_TAG=\"libfb\" \
                  -DDISABLE_CPUCAP \
                  -DDISABLE_XPLAT \
                  -DHAVE_POSIX_CLOCKS \
                  -fno-omit-frame-pointer \
                  -fexceptions \
                  -frtti \
                  -Wall \
                  -Werror \
                  -Wno-unused-parameter \
                  -std=c++11 \
                  -fPIC \
                  -O3

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../yoga
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../lib/fb/include/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../lib/jni
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../lib/jni/real
include $(BUILD_STATIC_LIBRARY)


# yoga-lib
include $(CLEAR_VARS)
LOCAL_MODULE    := yoga-lib
LOCAL_SRC_FILES := ../../yoga/YGNodeList.c \
                   ../../yoga/Yoga.c
LOCAL_CFLAGS := -std=gnu99 \
                -fPIC \
                -fno-omit-frame-pointer \
                -fexceptions \
                -frtti \
                -Wall \
                -Werror \
                -Wno-unused-parameter


LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../yoga
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../lib/fb/include/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../lib/jni
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../lib/jni/real
include $(BUILD_STATIC_LIBRARY)


# yoga jni lib
include $(CLEAR_VARS)
LOCAL_MODULE    := yoga
LOCAL_SRC_FILES := YGJNI.cpp
LOCAL_STATIC_LIBRARIES := yoga-dep
LOCAL_STATIC_LIBRARIES += yoga-lib
LOCAL_CFLAGS += -std=gnu++11 -fPIC
LOCAL_LDLIBS := -lm -llog
LOCAL_LDLIBS += -latomic

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../yoga
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../lib/fb/include/


include $(BUILD_SHARED_LIBRARY)