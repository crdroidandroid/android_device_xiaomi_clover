#
# Copyright (C) 2018-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from sdm660-common
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/clover/clover-vendor.mk)

DEVICE_PATH := device/xiaomi/clover

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(DEVICE_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Blur
TARGET_ENABLE_BLUR := true

# Control groups and task profiles
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Camera
PRODUCT_PACKAGES += \
    libstdc++_vendor

# Consumerir
BOARD_HAVE_IR := false

# Fingerprint
PRODUCT_PACKAGES += \
    com.fingerprints.extension@1.0.vendor

# FM
BOARD_HAVE_QCOM_FM := false

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.device.rc \
    init.macaddress_setup.sh

# Shims
PRODUCT_PACKAGES += \
    libcamera_sdm660_shim

# Tablet features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service.dual_role_usb

# Wifi
PRODUCT_PACKAGES += \
    CloverWifiOverlay
