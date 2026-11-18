$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

$(call inherit-product, device/oneplus/pja110/device.mk)

PRODUCT_DEVICE := pja110
PRODUCT_NAME := twrp_pja110
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := OnePlus Ace 2 Pro
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_RELEASE_NAME := PJA110

PRODUCT_SYSTEM_NAME := OP5943L1
PRODUCT_SYSTEM_DEVICE := OP5943L1
