$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

##test
#$(call inherit-product, device/qcom/common/common.mk)
##test

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
#    $(LOCAL_PATH)/recovery/recovery.fstab:root/recovery.fstab

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_msm8610
PRODUCT_DEVICE := msm8610

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

#fstab.qcom & init.qcom.spec.switch.rc
PRODUCT_PACKAGES += fstab.qcom

#####
# Symlinks
#$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
#    rm $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_cfg.ini; \
#    rm $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin; \
#    ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
#    $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_cfg.ini; \
#    ln -sf /persist/WCNSS_qcom_wlan_nv.bin \
#    $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin)
#endif

DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb
