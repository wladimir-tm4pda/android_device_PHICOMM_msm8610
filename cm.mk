## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := msm8610

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/PHICOMM/msm8610/device_msm8610.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := msm8610
PRODUCT_NAME := cm_msm8610
PRODUCT_BRAND := PHICOMM
PRODUCT_MODEL := msm8610
PRODUCT_MANUFACTURER := PHICOMM
