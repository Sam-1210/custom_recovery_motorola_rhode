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

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rhode
PRODUCT_NAME := twrp_rhode
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Motorola G52
PRODUCT_MANUFACTURER := motorola

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Override Props
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="rhode_g-user 11 S1SR32.38-14-2 b5f55 release-keys"

BUILD_FINGERPRINT := motorola/rhode_g/rhode:11/S1SR32.38-14-2/b5f55:user/release-keys

# MTP support
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp
