LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := SuperSU
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := SuperSU/common/Superuser.apk
LOCAL_PACKAGE_NAME := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_REQUIRED_MODULES := su .su daemonsu libsupol.so supolicy .installed_su_daemon busybox install-root.sh install-recovery-2.sh
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := .installed_su_daemon
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := SuperSU/common/.installed_su_daemon
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/etc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := busybox
LOCAL_SRC_FILES := Busybox/busybox
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/xbin
$(shell (mkdir -p $(PRODUCT_OUT)/system/etc/init.d >&2))
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := install-root.sh
LOCAL_SRC_FILES := SuperSU/common/install-root.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/etc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := install-recovery-2.sh
LOCAL_SRC_FILES := Busybox/install-recovery.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/etc
include $(BUILD_PREBUILT)

ifeq ($(TARGET_ARCH),arm64)

include $(CLEAR_VARS)
LOCAL_MODULE := su
LOCAL_SRC_FILES := SuperSU/ARCH/arm64/su
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/xbin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := .su
LOCAL_SRC_FILES := SuperSU/ARCH/arm64/su
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/bin/.ext
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := daemonsu
LOCAL_SRC_FILES := SuperSU/ARCH/arm64/su
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/xbin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libsupol.so
LOCAL_SRC_FILES := SuperSU/ARCH/arm64/libsupol.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/lib64
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := supolicy
LOCAL_SRC_FILES := SuperSU/ARCH/arm64/supolicy
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/system/xbin
include $(BUILD_PREBUILT)

endif

