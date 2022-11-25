#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/rhode

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload
    
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.0-service 

PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd \
    
PRODUCT_PACKAGES += \
    bootctrl.bengal.recovery \
    bootctrl.bengal

# Encryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Blacklist
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.bootimage.build.date.utc \
    ro.build.date.utc

# OEM otacerts
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/otacert

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Soong Config
SOONG_CONFIG_NAMESPACES += ufsbsg
SOONG_CONFIG_ufsbsg += ufsframework
SOONG_CONFIG_ufsbsg_ufsframework := bsg
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

# Enforce AB
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
