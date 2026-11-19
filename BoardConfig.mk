DEVICE_PATH := device/oneplus/pja110

ALLOW_MISSING_DEPENDENCIES := true

# Architecture: Snapdragon 8 Gen 2 (kalama), 64-bit only userspace.
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := kalama
TARGET_BOARD_PLATFORM := kalama

# PJA110 has a dedicated 100 MiB recovery partition. Its Android boot header
# v4 recovery image contains only the recovery ramdisk; the GKI kernel is
# supplied by boot and the device-specific pieces by vendor_boot.
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true
TARGET_NO_KERNEL := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_FLASH_BLOCK_SIZE := 262144
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Filesystems and dynamic partitions.
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USES_METADATA_PARTITION := true
BOARD_SUPER_PARTITION_SIZE := 16106127360
BOARD_SUPER_PARTITION_GROUPS := pja110_dynamic_partitions
BOARD_PJA110_DYNAMIC_PARTITIONS_SIZE := 16101933056
BOARD_PJA110_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system system_ext product vendor odm system_dlkm vendor_dlkm

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# The minimal TWRP tree does not build full dynamic partition images, but
# Android's board configuration validation still requires a filesystem type
# for every TARGET_COPY_OUT_* partition declared above.
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs

# AVB is enforced by the bootloader; use the stock image footer when testing
# a repacked image, rather than inventing release keys here.
BOARD_AVB_ENABLE := false

# Recovery display/input configuration, measured on the attached PJA110.
TARGET_SCREEN_DENSITY := 480
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 1024
TW_NO_HAPTICS := true
TW_NO_SCREEN_BLANK := true

# TWRP features.
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_NTFS_3G := true
TW_NO_EXFAT_FUSE := true
TW_USE_TOOLBOX := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Qualcomm/OPlus-specific behavior.
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_QCOM_ATS_OFFSET := 0
TW_OVERRIDE_PROPS_ADDITIONAL_PARTITIONS := odm vendor
TW_INPUT_BLACKLIST := "oplus_fp_input"

# Keep rollback-sensitive properties newer than the ROM while building.
PLATFORM_VERSION := 17.0.0
PLATFORM_SECURITY_PATCH := 2026-11-01
VENDOR_SECURITY_PATCH := 2026-11-01
