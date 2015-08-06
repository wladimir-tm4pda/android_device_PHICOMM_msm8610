$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

##test
#$(call inherit-product, device/qcom/common/common.mk)
##test

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

$(call inherit-product-if-exists, vendor/PHICOMM/msm8610/msm8610-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/PHICOMM/msm8610/overlay

LOCAL_PATH := device/PHICOMM/msm8610

#ifeq ($(TARGET_PREBUILT_KERNEL),)
#	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
#else
#	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel \
#    $(LOCAL_PATH)/dt.img:dt.img 
#\
#    $(LOCAL_PATH)/recovery/root/recovery.fstab:recovery/root/etc/recovery.fstab

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dt.img:dt.img 

# TWRP
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/recovery/root/etc/twrp.fstab:recovery/root/etc/twrp.fstab

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_msm8610
PRODUCT_DEVICE := msm8610

#fstab.qcom & init.qcom.spec.switch.rc
PRODUCT_PACKAGES += fstab.qcom
