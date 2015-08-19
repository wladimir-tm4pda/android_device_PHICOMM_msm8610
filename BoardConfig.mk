# config.mk
#
# Product-specific compile-time definitions.
#

#edited by wladimir_tm 20150728
### BASED_FROM
#original CAF /device/qcom/msm8610
#additionally
#GITHUB:
#/KonstaT/android_device_zte_kis3/tree/LNX.LA.3.5.1


#####
# mark with 5 symbols "#" -- added in first edition
#####
LOCAL_PATH := device/PHICOMM/msm8610
#####

#####
#TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
#KERNEL_HEADERS
#TARGET_OUT_HEADERS
#PRODUCT_VENDOR_KERNEL_HEADERS
#TARGET_BOARD_KERNEL_HEADERS
#TARGET_DEVICE_KERNEL_HEADERS
#TARGET_PRODUCT_KERNEL_HEADERS
#CUSTOM_KERNEL_HEADERS := $(LOCAL_PATH)/include
#CUSTOM_KERNEL_HEADERS += $(LOCAL_PATH)/include
#####
#####!!!! used standart dir /kernel-headers!!!!!
#!!!! this options needs only with prebuild_kernel!
#so better to bild with kernel sources!



ifeq ($(TARGET_ARCH),)
TARGET_ARCH := arm
endif

BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

#-include $(QCPATH)/common/msm8610/BoardConfigVendor.mk

#TODO: For bring-up only; disable QC display path
#####TARGET_BYPASS_QCUI := true

#TODO: Fix-me: Setting TARGET_HAVE_HDMI_OUT to false
# to get rid of compilation error.
TARGET_HAVE_HDMI_OUT := false
TARGET_USES_OVERLAY := true
#####TARGET_NO_BOOTLOADER := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
#####TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

#####TARGET_HARDWARE_3D := false
TARGET_BOARD_PLATFORM := msm8610
TARGET_BOOTLOADER_BOARD_NAME := MSM8610
#####
TARGET_BOARD_PLATFORM_GPU := qcom-adreno302
#####
#####TARGET_ARCH_LOWMEM := true
#####TARGET_RAM_SIZE_256MB := true

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37
BOARD_KERNEL_SEPARATED_DT := true

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuitls/kernel
#TARGET_PREBUILT_RECOVERY_KERNEL :=
#TARGET_KERNEL_SOURCE := kernel/PHICOMM/msm8610
#TARGET_KERNEL_SOURCE := device/PHICOMM/msm8610-kernel
#TARGET_KERNEL_CONFIG := C230W_defconfig
#TARGET_KERNEL_CONFIG := msm8610-perf_defconfig
#TARGET_KERNEL_CONFIG := msm8610_defconfig
#KERNEL_SRC_DIR :=

#BOARD_MKBOOTIMG_ARGS += --ramdisk_offset "$(BOARD_RAMDISK_OFFSET)"
#BOARD_MKBOOTIMG_ARGS += --tags_offset "$(BOARD_TAGS_OFFSET)"
BOARD_MKBOOTIMG_ARGS += --dt device/PHICOMM/msm8610/prebuilts/dt.img
#BOARD_MKBOOTIMG_ARGS += --kernel_offset "$(BOARD_KERNEL_OFFSET)"

#BOARD_MKBOOTIMG_ARGS := --dt $(LOCAL_PATH)/dt.img

###
#BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk

#crazytiti
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt device/PHICOMM/msm8610/dt.img
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt $(LOCAL_PATH)/dt.img
#crazytiti

#####acc to build/core$ cat Makefile | grep DTIMAGE
##### added to AndroidBoad.mk - like with kernel
##### not work TARGET_PREBUILT_DT := $(LOCAL_PATH)/dt.img
#####INSTALLED_DTIMAGE_TARGET := $(LOCAL_PATH)/dt.img
#####BOARD_MKBOOTIMG_ARGS := --dt $(LOCAL_PATH)/dt.img
#####
#######decision: buils with kernel sources! - then dt.img is generated fine!


#####BOARD_EGL_CFG := device/qcom/$(TARGET_BOARD_PLATFORM)/egl.cfg
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg
#####

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 461373440
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 73400320
BOARD_USBIMAGE_PARTITION_SIZE_KB := 102400
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)


# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Add NON-HLOS files for ota upgrade
#####ADD_RADIO_FILES ?= true
#####TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
#####TARGET_USES_INTERACTION_BOOST := false

# Added to indicate that protobuf-c is supported in this build
#####PROTOBUF_SUPPORTED := true

#TARGET_ADDITIONAL_BOOTCLASSPATH := qcom.fmradio:oem-services:qcmediaplayer

#####HAVE_FT_FW_UPGRADE := true

# Resource manager for audio-video usecases
BOARD_USES_RESOURCE_MANAGER := true
#TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_msm
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

######
######
######added acc to T30 stock ROM
######BOARD_HAS_ATH_WLAN_AR6004 := true

#####added acc to def cat AndroidBoard.mk
##### commented by default
#ADD_RADIO_FILES := true

#####acc to /device/qcom/common$ cat generate_extra_images.mk
#BUILD_TINY_ANDROID := true

#####ADDITIONALLY:

#####scorpio92_manual:
#####corrected overlays - to stock ROM T30 values:
#####
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
#PRODUCT_AAPT_CONFIG :=ldpi mdpi hdpi xhdpi
#PRODUCT_AAPT_PREF_CONFIG := mdpi
#
#already defined in device:
#DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
######################

######################
######################

#DISABLE_DEXPREOPT := true
#---OR---
# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
#ifeq ($(HOST_OS),linux)
#  ifeq ($(WITH_DEXPREOPT),)
#    WITH_DEXPREOPT := true
#  endif
#endif
#
#
# deodex by default (for user builds)
DISABLE_DEXPREOPT := true
#
# or forced odex
#WITH_DEXPREOPT := true
#WITH_DEXPREOPT_BOOT_IMG_ONLY := false
#
#src:/sultanqasim/android_device_motorola_otus


OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
# TARGET_USES_QCOM_BSP := true 
# -- already defined in msm8610.mk
# analog to CM sources FLAGs:
#####

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
#COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
#TARGET_USES_QCOM_BSP := true
#####

USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
#TARGET_RECOVERY_LCD_BACKLIGHT_PATH := '/sys/class/leds/lcd-backlight/brightness'
TARGET_RECOVERY_LCD_BACKLIGHT_PATH :=  "/sys/class/leds/lcd-backlight/brightness"
#TARGET_RECOVERY_LCD_BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
#
#BOARD_HAVE_BLUETOOTH_BLUEZ),true)

######################
######################
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
##	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
#	cp $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
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

#...

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
######################
######################

######################
######################

#KonstaT:

# Dalvik
TARGET_ARCH_LOWMEM := true

# FM
#BOARD_HAVE_QCOM_FM := true

# Classpath
#PRODUCT_BOOT_JARS := $(subst $(space),:,$(PRODUCT_BOOT_JARS))

#...

# SELinux
#BOARD_SEPOLICY_DIRS := \
#    device/qcom/common/sepolicy

#BOARD_SEPOLICY_UNION := \
#    netd.te

# Vendor init
#TARGET_INIT_VENDOR_LIB := libinit_msm
#

######################
######################

#####
# Make sure this folder exists so display stuff doesn't fail
#$(shell mkdir -p $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/)
#####
#####
# default props
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
#ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=0
#ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=1
#ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1
#ADDITIONAL_DEFAULT_PROPERTIES += ro.config.sec_storage=1
#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage,adb