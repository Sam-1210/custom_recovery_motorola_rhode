#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/rhode

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_IS_64_BIT := true
TARGET_BOARD_SUFFIX := _64
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Assert
TARGET_OTA_ASSERT_DEVICE := rhode

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor


# Kernel
BOARD_KERNEL_CMDLINE := None
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/motorola/rhode
TARGET_KERNEL_CONFIG := rhode_defconfig
TARGET_KERNEL_CLANG_COMPILE := true

# Platform
TARGET_BOARD_PLATFORM := bengal
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_USES_UEFI := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
PRODUCT_COPY_FILES += device/motorola/rhode/twrp.fstab:recovery/root/system/etc/twrp.fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/twrp.fstab
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/system/etc/init/hw/init.rc
TARGET_PREBUILT_RECOVERY_RAMDISK_CPIO := $(DEVICE_PATH)/ramdisk-recovery.cpio
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice \
    ashmemd_aidl_interface-cpp \
    libashmemd_client

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so


# Hack: prevent anti rollback
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_SECURITY_PATCH := 2099-12-31
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 2
PLATFORM_VERSION := 12

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_INCLUDE_FUSE_EXFAT := true
TWRP_INCLUDE_LOGCAT := true
TW_INCLUDE_REPACKTOOLS := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_DEFAULT_LANGUAGE := en-US

# SHRP Prop
SHRP_MAINTAINER := carlodeeCryptonTestBuild
SHRP_DEVICE_CODE := rhode
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A/B
SHRP_NOTCH := true
SHRP_EDL_MODE := 1
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg
SHRP_FLASH := 1
SHRP_DARK := true
SHRP_REC := /dev/block/bootdevice/by-name/boot
SHRP_EXPRESS := true

# USE SHRP Addons

SHRP_EXTERNAL_ADDON_PATH := “device/motorola/rhode/addon/”
SHRP_EXTERNAL_ADDON_1_NAME := “SELinux Permissiver”
SHRP_EXTERNAL_ADDON_1_INFO := “Makes SELinux Permissive”
SHRP_EXTERNAL_ADDON_1_FILENAME := “permissiver.zip”
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := “Flash”
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := “Flashed Successfully”
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true
SHRP_EXTERNAL_ADDON_2_NAME := “SELinux Enforcer”
SHRP_EXTERNAL_ADDON_2_INFO := “Reverts Back to Enforcing SELinux”
SHRP_EXTERNAL_ADDON_2_FILENAME := “enforcer.zip”
SHRP_EXTERNAL_ADDON_2_BTN_TEXT := “Flash”
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := “Flashed Successfully”
SHRP_INC_IN_REC_EXTERNAL_ADDON_2 := true
SHRP_EXTERNAL_ADDON_3_NAME := “[MIUI] Disable Replace SHRP”
SHRP_EXTERNAL_ADDON_3_INFO := “Flash in MIUI To Stop MIUI Recovery From Replacing”
SHRP_EXTERNAL_ADDON_3_FILENAME := “disable-replace-shrp.zip”
SHRP_EXTERNAL_ADDON_3_BTN_TEXT := “Flash”
SHRP_EXTERNAL_ADDON_3_SUCCESSFUL_TEXT := “Flashed Successfully”
SHRP_INC_IN_REC_EXTERNAL_ADDON_3 := true
SHRP_EXTERNAL_ADDON_4_NAME := “Magisk-V25.2”
SHRP_EXTERNAL_ADDON_4_INFO := “Flash It To Get Root Access”
SHRP_EXTERNAL_ADDON_4_FILENAME := “Magisk-V25.2.zip”
SHRP_EXTERNAL_ADDON_4_BTN_TEXT := “Flash”
SHRP_EXTERNAL_ADDON_4_SUCCESSFUL_TEXT := “Installed”
SHRP_INC_IN_REC_EXTERNAL_ADDON_4 := true
