LOCAL_PATH := device/oneplus/pja110

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_SHIPPING_API_LEVEL := 33
PRODUCT_TARGET_VNDK_VERSION := 34

# The stock header-v4 recovery image intentionally has no kernel payload.
# TARGET_NO_KERNEL therefore has to stay enabled, while this product override
# explicitly asks the Android build system to create the dedicated recovery
# ramdisk image anyway.
PRODUCT_BUILD_RECOVERY_IMAGE := true

PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot-service.example_recovery \
    android.security.apc-ndk \
    android.security.authorization-ndk \
    android.security.maintenance-ndk \
    android.system.keystore2-V1-ndk \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(LOCAL_PATH)/recovery/root/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc

PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)
