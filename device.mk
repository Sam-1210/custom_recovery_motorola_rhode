#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/rhode

# A/B
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    product \
    recovery \
    vbmeta \
    vbmeta_system \
    dtbo

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

# Modules from vendor_boot.img
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/adapter_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/adapter_class.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/cw2217b_fg_mmi.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/cw2217b_fg_mmi.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/mmi_annotate.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/mmi_annotate.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/mmi_charger.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/mmi_charger.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/mmi_discrete_charger.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/mmi_discrete_charger.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/mmi_discrete_charger_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/mmi_discrete_charger_class.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/mmi_info.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/mmi_info.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/modules.alias:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/modules.alias \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/modules.blocklist:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/modules.blocklist \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/modules.dep:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/modules.dep \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/modules.load:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/modules.load \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/modules.softdep:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/modules.softdep \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/qpnp_adaptive_charge.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/qpnp_adaptive_charge.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/rt_pd_manager.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/rt_pd_manager.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/tcpc_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/tcpc_class.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/tcpc_sgm7220.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/tcpc_sgm7220.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/sgm4154x_charger.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/sgm4154x_charger.ko
