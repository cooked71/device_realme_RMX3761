#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
# $(call inherit-product, 
#$(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_SHIPPING_API_LEVEL := 33

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-recovery \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio@2.1-impl \
    audio.primary.ums9230 \
    audio.bluetooth.default \
    audio.usb.default \
    audio.r_submix.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1-service.btlinux

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.7-impl \
    android.hardware.camera.provider@2.7-service \
    camera.device@3.2-impl

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0-impl \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@4.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    gralloc.ums9230 \
    hwcomposer.ums9230 \
    memtrack.ums9230

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Init
PRODUCT_PACKAGES += \
    init.RMX3761.rc \
    init.recovery.RMX3761.rc

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.3-service.unisoc \
    android.hardware.power.stats@1.0-service.mock

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.6 \
    android.hardware.radio.config@1.3 \
    android.hardware.radio.deprecated@1.0

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.unisoc

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service.unisoc

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# Inherit vendor
$(call inherit-product, vendor/realme/RMX3761/RMX3761-vendor.mk)
