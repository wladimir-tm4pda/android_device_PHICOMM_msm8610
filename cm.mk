## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := C230w

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/PHICOMM/msm8610/msm8610.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := msm8610
PRODUCT_NAME := cm_msm8610
PRODUCT_BRAND := PHICOMM
PRODUCT_MODEL := C230w
PRODUCT_MANUFACTURER := PHICOMM

# for compatribility with stock ROMs asserts:
# assert(getprop("ro.product.device") == "msm8610" ||
#       getprop("ro.build.product") == "msm8610");
#
#Assert
#TARGET_OTA_ASSERT_DEVICE := msm8610

####NOW WORK:
#PRODUCT_BUILD_PROP_OVERRIDES += \
#    BUILD_PRODUCT=msm8610
#    PRODUCT_DEVICE=msm8610

#PRODUCT_PROPERTY_OVERRIDES :=  ro.build.product=msm8610
#    ro.product.device=msm8610
####

#================
# Enable Secure Debugging
ifneq ($(TARGET_BUILD_VARIANT),eng)

#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mass_storage,adb
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=adb
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.service.adb.enable=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.secure=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.allow.mock.location=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.debuggable=1
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += service.adb.root=1

endif