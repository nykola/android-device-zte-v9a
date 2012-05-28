#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/zte/v9/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp

TARGET_NO_BOOTLOADER := true

TARGET_PREBUILT_RECOVERY_KERNEL := device/zte/v9/recovery_kernel
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/zte/v9/recovery/recovery_ui.c
TARGET_RECOVERY_INITRC := device/zte/v9/recovery/recovery.rc

TARGET_KERNEL_SOURCE := kernel/zte/zte-kernel-v9a
TARGET_KERNEL_CONFIG := cyanogen_v9a_defconfig

BOARD_KERNEL_BASE := 0x02600000
BOARD_KERNEL_CMDLINE := androidboot.hardware=v9 console=null

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOOTLOADER_BOARD_NAME := v9

TARGET_PREBUILT_KERNEL := device/zte/v9/kernel

BOARD_EGL_CFG := device/zte/v9/egl.cfg

USE_OPENGL_RENDERER := false

# dev:    size   erasesize  name
# mtd0: 00500000 00020000 "recovery"
# mtd1: 00500000 00020000 "boot"
# mtd2: 00180000 00020000 "splash"
# mtd3: 00080000 00020000 "misc"
# mtd4: 00200000 00020000 "cache"
# mtd5: 08a00000 00020000 "system"
# mtd6: 13ba0000 00020000 "userdata"
# mtd7: 00020000 00020000 "oem"
# mtd8: 00180000 00020000 "persist"
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0d200000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x13ba0000
BOARD_FLASH_BLOCK_SIZE := 131072

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := AR6000
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := wlan0
WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_NAME     := ar6000

BOARD_HAVE_BLUETOOTH := true

BOARD_PROVIDES_LIBRIL := true

BOARD_GPS_LIBRARIES := libloc
BOARD_USES_GPSSHIM := true
BOARD_GPS_NEEDS_XTRA := true

TARGET_SPECIFIC_HEADER_PATH := device/zte/v9/include

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file

BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS  -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60

#DEBUG_DALVIK_VM := true
BOARD_USES_QCOM_LIBS := true

BOARD_GL_OES_EGL_IMG_EXTERNAL_HACK := true
#TARGET_USES_GENLOCK := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
TARGET_FORCE_CPU_UPLOAD := true

TARGET_LIBRS_USES_RGB565 := true

WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
