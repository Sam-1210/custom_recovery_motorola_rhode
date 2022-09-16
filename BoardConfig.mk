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
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true


# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bengal
TARGET_NO_BOOTLOADER := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 \
			earlycon=msm_geni_serial,0x4a90000 \
			androidboot.hardware=qcom \
			androidboot.console=ttyMSM0 \
			androidboot.memcg=1 \
			lpm_levels.sleep_disabled=1 \
			video=vfb:640x400,bpp=32,memsize=3072000 \
			msm_rtb.filter=0x237\
			service_locator.enable=1 \
			swiotlb=2048 \
			androidboot.hab.csv=5 \
			androidboot.hab.product=rhode \
			androidboot.hab.cid=50 \
			firmware_class.path=/vendor/firmware_mnt/image
                        androidboot.selinux=permissive
BOARD_BOOTCONFIG += androidboot.hardware=qcom \
		    androidboot.console=ttyMSM0 \
	            androidboot.memcg=1 \
                    androidboot.hab.csv=5 \
		    androidboot.hab.product=rhode \
	            androidboot.hab.cid=50 
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/motorola/rhode
TARGET_KERNEL_CONFIG := rhode_defconfig
TARGET_KERNEL_CLANG_COMPILE := true

# Found Elf workaround
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := bengal
QCOM_BOARD_PLATFORMS += bengal
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_USES_UEFI := true

# Workarounds
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4


# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
#PRODUCT_COPY_FILES += device/motorola/rhode/twrp.fstab:recovery/root/system/etc/twrp.fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/twrp.fstab
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/init.recovery.qcom.rc
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
    libandroidicu \
    libcap \
    libion \
    libxml2

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so


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
TW_INCLUDE_INJECTTWRP := true
TW_DEVICE_VERSION := carlodeeCrypton
Maintainer := "carlodeeCrypton"
