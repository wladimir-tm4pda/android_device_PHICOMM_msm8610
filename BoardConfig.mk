#
# Copyright (C) 2015 wladimir_tm (wladimir.tm4xda@gmail.com)
#		for The CyanogenMod Project
#
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
### BASED_FROM
# crazytiti src at forum.xda-developers.com
# /android/general/rom-cwm11-recovery-port-phicomm-c230w-t2871370
# 
# GITHUB
# /arvinquilao/android_device_cti_h700/blob/cm-11.0/BoardConfig.mk
# /KonstaT/android_device_zte_kis3/blob/cm-11.0/BoardConfig.mk
# /Dm47021/cm_device_zte_Aurora/blob/master/BoardConfig.mk
# /asyan4ik/hwmt7_l09_twrp/blob/master/BoardConfig.mk
# /asyan4ik/android_device_huawei_c8817d/blob/kk_mkt/BoardConfig.mk
# /LoneStar-/android_device_lge_w5/blob/master/BoardConfig.mk
# /NamelessRom/android_device_lge_msm8610-common/blob/n-2.1/BoardConfigCommon.mk
# /AscendG630-DEV/android_device_huawei_g630
# /vm03/android_device_lge_msm8610-common/blob/cm-12.1/BoardConfigCommon.mk
# /vm03/android_device_nokia_ara
# ...
# ++ searches on "TARGET_BOARD_PLATFORM msm8610 TARGET_ARCH arm"
# or "TARGET_BOARD_PLATFORM_GPU := qcom-adreno302"
#
# CAF
# /cgit/quic/la/platform/vendor/qcom/msm8610/tree/BoardConfig.mk?h=LA.BF.1.1

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true
#BOARD_USES_GENERIC_AUDIO := true
#BOARD_USES_GENERIC_AUDIO := false

# inherit from the proprietary version
#-include vendor/PHICOMM/C230w/BoardConfigVendor.mk

#-include vendor/zte/Aurora/BoardConfigVendor.mk
#-include qcom/common/msm8610/BoardConfigVendor.mk

######

#LOCAL_PATH := $(call my-dir)
LOCAL_PATH := device/PHICOMM/msm8610

$(shell echo $$LOCAL_PATH)

######
#TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
#TARGET_SPECIFIC_HEADER_PATH += device/zte/kis3/include

# Platform
#BOARD_VENDOR := PHICOMM
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8610
TARGET_BOARD_PLATFORM := msm8610
TARGET_BOARD_PLATFORM_GPU := qcom-adreno302
#TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
# GPS
TARGET_NO_RPC := true

#crazytiti
#TARGET_GLOBAL_CFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp
#TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp
#crazytiti

#CAF:
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# CPU
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait
#TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true #/Split-Screen/android_device_motorola_condor
#TARGET_USE_KINGFISHER_OPTIMIZATION := true #/NamelessRom/android_device_lge_msm8610-common
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
# Dalvik
#TARGET_ARCH_LOWMEM := true

#crazytiti
#TARGET_CPU_VARIANT := cortex-a7
#crazytiti


# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
#TARGET_PREBUILT_RECOVERY_KERNEL := 
#TARGET_KERNEL_SOURCE := kernel/zte/msm8610
#TARGET_KERNEL_CONFIG := msm8610-zte_defconfig
#KERNEL_SRC_DIR := 


BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
#from AIK unpacking
#BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x02000000
#BOARD_DT_SIZE            := 1488896
BOARD_TAGS_OFFSET        := 0x01E00000
#from AIK unpacking

#crazytiti
#BOARD_TAGS_OFFSET        := 0x00000100
#BOARD_RAMDISK_OFFSET     := 0x01000000
#crazytiti

BOARD_KERNEL_SEPARATED_DT := true

#BOARD_MKBOOTIMG_ARGS += --ramdisk_offset "$(BOARD_RAMDISK_OFFSET)"
#BOARD_MKBOOTIMG_ARGS += --tags_offset "$(BOARD_TAGS_OFFSET)"
#BOARD_MKBOOTIMG_ARGS += --dt $(LOCAL_PATH)/dt.img
##BOARD_MKBOOTIMG_ARGS += --kernel_offset "$(BOARD_KERNEL_OFFSET)"

BOARD_MKBOOTIMG_ARGS := --dt $(LOCAL_PATH)/dt.img

#crazytiti
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt device/PHICOMM/msm8610/dt.img
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt $(LOCAL_PATH)/dt.img
#crazytiti

# Linaro toolchain
#LINARO_VERSION := 4.9.1
#TARGET_TOOLS_PREFIX := prebuilts/gcc/linux-x86/arm/arm-cortex_a8-linux-gnueabi-linaro_$(LINARO_VERSION)/bin/arm-cortex_a8-linux-gnueabi-
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := тут имя папки тулчайна (prebuilt/linux-x86/toolchain)

# deodex by default (for user builds)
#DISABLE_DEXPREOPT := true
#
# or forced odex
#WITH_DEXPREOPT := true
#WITH_DEXPREOPT_BOOT_IMG_ONLY := false
#
#src:/sultanqasim/android_device_motorola_otus

# Bionic
#TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
#TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x105c0000 
##DEC: 274 464 768
#CAF: BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
##DEC 10 485 760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072 
# (BOARD_KERNEL_PAGESIZE * 64)

#BOARD_HAS_DOWNLOAD_MODE := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

###EXAMPLE
## PARTITION LAYOUT/INFO ##
#BOARD_HAS_NO_MISC_PARTITION := false
#BOARD_BOOT_DEVICE := /dev/block/mmcblk0p15
#BOARD_RECOVERY_DEVICE := /dev/block/mmcblk0p16
#BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p18
#BOARD_SYSTEM_FILESYSTEM := yaffs2
#BOARD_CACHE_DEVICE := /dev/block/mmcblk0p8
#BOARD_CACHE_FILESYSTEM := yaffs2
#BOARD_DATA_DEVICE := /dev/block/mmcblk0p18
#BOARD_DATA_FILESYSTEM := yaffs2

# Qualcomm Hardware
# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
TARGET_USES_QCOM_BSP := true

# Graphics
#TARGET_QCOM_DISPLAY_VARIANT := caf-new
#BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg
#USE_OPENGL_RENDERER := true
#TARGET_USES_ION := true
#NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
#TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Enables Adreno RS driver
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

#TODO: For bring-up only; disable QC display path
#TARGET_BYPASS_QCUI := true

#TODO: Fix-me: Setting TARGET_HAVE_HDMI_OUT to false
# to get rid of compilation error.
#TARGET_HAVE_HDMI_OUT := false
#TARGET_USES_OVERLAY := true

# Camera
#USE_DEVICE_SPECIFIC_CAMERA := true
#TARGET_DISPLAY_INSECURE_MM_HEAP := true
#BOARD_USES_LEGACY_MMAP := true
# Global flags
#COMMON_GLOBAL_CFLAGS += -DLG_CAMERA_HARDWARE

# Media
#TARGET_QCOM_MEDIA_VARIANT := caf-new
#TARGET_QCOM_MEDIA_VARIANT := caf-legacy
# QCOM enhanced A/V
#TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Audio
#TARGET_QCOM_AUDIO_VARIANT := caf
#BOARD_USES_ALSA_AUDIO := true
#AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
#AUDIO_FEATURE_DISABLED_SSR := true
#AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
#AUDIO_FEATURE_DISABLED_DS1_DOLBY_DAP := true
#AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true

# Time services
#BOARD_USES_QC_TIME_SERVICES := true

# Bluetooth
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/kis3/bluetooth
#BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_QCOM := true

# Power
#TARGET_POWERHAL_VARIANT := qcom
# Enable suspend during charger mode
#BOARD_CHARGER_ENABLE_SUSPEND := true
#BOARD_CHARGER_DISABLE_INIT_BLANK := true #/bitdomo2/android_device_lge_gammaw
#TARGET_PROVIDES_POWERHAL := true
#TARGET_USES_CPU_BOOST_HINT := true

# Liblight
#TARGET_PROVIDES_LIBLIGHT := true

# Hardware tunables framework
#BOARD_HARDWARE_CLASS := device/lge/msm8610-common/cmhw/
# CMHW
#BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw/

# Init
#TARGET_UNIFIED_DEVICE := true
#TARGET_INIT_VENDOR_LIB := libinit_msm

# Build
#TARGET_SYSTEMIMAGE_USE_SQUISHER := true

# Wifi
#BOARD_HAS_QCOM_WLAN := true
#BOARD_HAS_QCOM_WLAN_SDK := true
#WPA_SUPPLICANT_VERSION := VER_0_8_X
#BOARD_WPA_SUPPLICANT_DRIVER := NL80211
#BOARD_HOSTAPD_DRIVER := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
#WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
#WIFI_DRIVER_MODULE_NAME := "wlan"
#BOARD_WLAN_DEVICE := qcwcn
#TARGET_USES_WCNSS_CTRL := true

#
#WLAN_MODULES:
#	mkdir -p $(KERNEL_MODULES_OUT)/pronto
#	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
#	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko
#
#
#TARGET_KERNEL_MODULES += WLAN_MODULES
#

# RIL
#BOARD_RIL_CLASS := ../../../device/lge/msm8610-common/ril/

# Enable WEBGL in WebKit
#ENABLE_WEBGL := true
#TARGET_FORCE_CPU_UPLOAD := true

# Recovery
#DEVICE_RESOLUTION := 480x800
#DEVICE_RESOLUTION := 720x1280
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
#TARGET_RECOVERY_PIXEL_FORMAT := RGB_565
#TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
#TARGET_RECOVERY_PIXEL_FORMAT := RGBA_8888
#TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
#TARGET_RECOVERY_FSTAB := device/PHICOMM/msm8610/ramdisk/fstab.qcom
#RECOVERY_FSTAB_VERSION := 2

RECOVERY_NAME := CWM for PHICOMM C230w

TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab
#TARGET_PROVIDES_RECOVERY_INIT_RC := true
#TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/recovery/init.rc
#Assert
#TARGET_OTA_ASSERT_DEVICE := C230w
#TARGET_OTA_ASSERT_DEVICE := f310lr,f310l,f310s,f310k

#files from cm-11.0:
#BOARD_CUSTOM_GRAPHICS += $(LOCAL_PATH)/miniui/recovery/graphics.c $(LOCAL_PATH)/miniui/recovery/graphics_overlay.c
#BOARD_CUSTOM_GRAPHICS := $(LOCAL_PATH)/miniui/recovery/graphics.c $(LOCAL_PATH)/miniui/recovery/graphics_overlay.c
#BOARD_CUSTOM_GRAPHICS += $(LOCAL_PATH)/miniui/recovery/graphics_overlay.c
#BOARD_CUSTOM_GRAPHICS := ../../../device/PHICOMM/C230w/recovery/graphics.c ../../../device/PHICOMM/C230w/recovery/graphics_overlay.c
BOARD_CUSTOM_GRAPHICS := ../../../$(LOCAL_PATH)/recovery/graphics.c ../../../$(LOCAL_PATH)/recovery/graphics_overlay.c

#Philz edits
#TARGET_SCREEN_HEIGHT := 800
#TARGET_SCREEN_WIDTH := 480

#TWRP_EXAMPLE
#DEVICE_RESOLUTION := 720x1280
#BOARD_HAS_NO_REAL_SDCARD := true
#TARGET_USERIMAGES_USE_EXT4 := true
#TW_INTERNAL_STORAGE_PATH := "/data/media"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
#TW_EXTERNAL_STORAGE_PATH := "/external_sd"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
#TW_NO_USB_STORAGE := true
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
#TW_IGNORE_MAJOR_AXIS_0 := true
#TW_DEFAULT_EXTERNAL_STORAGE := true
#TW_SCREEN_BLANK_ON_BOOT := true
#TW_NO_SCREEN_TIMEOUT := true
#RECOVERY_SDCARD_ON_DATA := true
#BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
#BOARD_RECOVERY_SWIPE := true
#BOARD_SUPPRESS_EMMC_WIPE := true
#TARGET_RECOVERY_QCOM_RTC_FIX := true
#BOARD_HAS_JANKY_BACKBUFFER := true

#####
# Make sure this folder exists so display stuff doesn't fail
$(shell mkdir -p $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/)
#####

#HAVE_SELINUX := true

# SELinux policies
# qcom sepolicy
#include device/qcom/sepolicy/sepolicy.mk
#
#BOARD_SEPOLICY_DIRS += \
#    $(LOCAL_PATH)/sepolicy
#
#BOARD_SEPOLICY_UNION += \
#    adbd.te \
#    app.te \
#...
#
#ifneq ($(TARGET_BUILD_VARIANT),user)
#    BOARD_SEPOLICY_UNION += su.te
#endif
#

############

# default props
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
#ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=0
#ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=1
#ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1
#ADDITIONAL_DEFAULT_PROPERTIES += ro.config.sec_storage=1
#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage,adb
