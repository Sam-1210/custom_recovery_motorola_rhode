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

# Copy recovery depmod
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.ko,device/motorola/rhode/prebuilt/modules/,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/) \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/modules.alias:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/modules.alias \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/modules.blocklist:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/modules.blocklist \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/modules.dep:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/modules.dep \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/modules.load:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/modules.load \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/modules.softdep:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/modules.softdep 