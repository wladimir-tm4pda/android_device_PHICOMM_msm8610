TARGET_USES_QCOM_BSP := true
#TARGET_HAS_NFC := true

ifeq ($(TARGET_USES_QCOM_BSP), true)
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
endif #TARGET_USES_QCOM_BSP

DEVICE_PACKAGE_OVERLAYS := device/qcom/msm8610/overlay

-include $(QCPATH)/common/config/rendering-engine.mk

#This is font rendering engine feature switch
ifneq (,$(strip $(wildcard $(PRODUCT_RENDERING_ENGINE_REVLOAD))))
    MULTI_LANG_ENGINE := REVERIE
endif

ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
# media_profiles and media_codecs xmls for 8610
PRODUCT_COPY_FILES += device/qcom/msm8610/media/media_profiles_8610.xml:system/etc/media_profiles.xml \
                      device/qcom/msm8610/media/media_codecs_8610.xml:system/etc/media_codecs.xml
endif #TARGET_ENABLE_QC_AV_ENHANCEMENTS

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, device/qcom/common/common.mk)

PRODUCT_NAME := msm8610
PRODUCT_DEVICE := msm8610

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msm8610/audio_policy.conf:system/etc/audio_policy.conf

# audio UCM files
PRODUCT_COPY_FILES += \
    device/qcom/msm8610/snd_soc_msm/snd_soc_msm_8x10_wcd:system/etc/snd_soc_msm/snd_soc_msm_8x10_wcd \
    device/qcom/msm8610/snd_soc_msm/snd_soc_msm_8x10_wcd_skuab:system/etc/snd_soc_msm/snd_soc_msm_8x10_wcd_skuab \
    device/qcom/msm8610/snd_soc_msm/snd_soc_msm_8x10_wcd_skuaa:system/etc/snd_soc_msm/snd_soc_msm_8x10_wcd_skuaa

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# splash img
PRODUCT_COPY_FILES += \
    device/qcom/msm8610/splash.img:splash.img

#fstab.qcom & init.qcom.spec.switch.rc
PRODUCT_PACKAGES += fstab.qcom \
    init.qcom.spec.switch.rc

PRODUCT_COPY_FILES += \
    device/qcom/msm8610/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/qcom/msm8610/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/qcom/msm8610/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += wcnss_service \
                    pronto_wlan.ko

#ANT stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

#LogSystem
LogSystem := Logkit
LogSystem += SystemAgent
LogSystem += qlogd
LogSystem += qlog-conf.xml
LogSystem += wifi.cfg
LogSystem += kernelevent.cfg
LogSystem += diag_mdlog
LogSystem += rootagent
LogSystem += init.qcom.rootagent.sh
LogSystem += dynamic_debug_mask.cfg
LogSystem += cdrom_install.iso

PRODUCT_PACKAGES += $(LogSystem)

# Sensors feature definition file/s
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml

#PPPOE
rp_pppoe := pppoe

PRODUCT_PACKAGES += $(rp_pppoe)

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.whitelist=/system/etc/whitelist_appops.xml

PRODUCT_COPY_FILES += \
    device/qcom/msm8610/whitelist_appops.xml:system/etc/whitelist_appops.xml

# Add 14 languages for localization
PRODUCT_LOCALES += th_TH vi_VN tl_PH hi_IN ar_EG ru_RU tr_TR pt_BR bn_IN mr_IN ta_IN te_IN zh_HK in_ID

PRODUCT_PACKAGE_OVERLAYS := $(QCPATH)/qrdplus/globalization/multi-language/res-overlay


ifeq ($(TARGET_HAS_NFC), true)

NFC_D := true

ifeq ($(NFC_D), true)
    PRODUCT_PACKAGES += \
        libnfcD-nci \
        libnfcD_nci_jni \
        nfcD_nci.msm8610 \
        NfcDNci \
        Tag \
        com.android.nfc_extras \
        com.android.nfc.helper
else
    PRODUCT_PACKAGES += \
        libnfc-nci \
        libnfc_nci_jni \
        nfc_nci.msm8610 \
        NfcNci \
        Tag \
        com.android.nfc_extras
endif

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/qcom/msm8610/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/qcom/msm8610/nfc/nfcee_access_debug.xml
endif

# file that declares the MIFARE NFC constant
# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
# NFC access control + feature files + configuration

PRODUCT_COPY_FILES += \
	packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt


PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
        frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
        $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
        frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
        device/qcom/msm8610/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf \
        device/qcom/msm8610/nfc/hardfault.cfg:system/etc/nfc/hardfault.cfg

endif
#TARGET_HAS_NFC
