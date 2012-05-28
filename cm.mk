$(call inherit-product, device/zte/v9/v9.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=v9a BUILD_ID=IMM76D BUILD_FINGERPRINT=google/soju/crespo:4.0.4/IMM76D/299849:user/release-keys PRIVATE_BUILD_DESC="adeep 4.0.4 IMM76D 299849 release-keys" BUILD_NUMBER=299849

PRODUCT_NAME := cm_v9a
PRODUCT_DEVICE := v9a
PRODUCT_RELEASE_NAME := V9A
