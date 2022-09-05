#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from rhode device
$(call inherit-product, device/motorola/rhode/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit some common Twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product-if-exists, vendor/twrp/config/gsm.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rhode
PRODUCT_NAME := twrp_rhode
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Motorola G52
PRODUCT_MANUFACTURER := motorola

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
INTERNAL_RECOVERY_RAMDISK_FILES_TIMESTAMP := $(call intermediates-dir-for,PACKAGING,recovery)/ramdisk_files-timestamp

# MTP support
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp
