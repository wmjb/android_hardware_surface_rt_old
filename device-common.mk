#
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_CHARACTERISTICS := tablet,nosdcard
PRODUCT_AAPT_CONFIG := normal large xlarge hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := hdpi

TARGET_HAS_LEGACY_CAMERA_HAL1 := true

PRODUCT_PROPERTY_OVERRIDES := \
    drm.service.enabled=true \
    persist.sys.media.legacy-drm=true \
    media.stagefright.less-secure=true \
    media.stagefright.legacyencoder=true \
    tf.enable=y \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

#--------------------------------------------------------------------------------------------------
# check for 7.x (normally starting with 8.1)
#--------------------------------------------------------------------------------------------------
# disable Captive portal check
PRODUCT_PROPERTY_OVERRIDES += \
    ro.disable_captive_portal=1

# Set lowram options
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lmk.critical_upgrade=true \
    ro.lmk.upgrade_pressure=40

# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
# Always preopt extracted APKs to prevent extracting out of the APK for gms
# modules.
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
# Default heap sizes. Allow up to 256m for large heaps to make sure a single app
# doesn't take all of the RAM.
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=192m
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=512m

#--------------------------------------------------------------------------------------------------

# ART
PRODUCT_PROPERTY_OVERRIDES += \
		dalvik.vm.dex2oat-flags=--no-watch-dog \
		dalvik.vm.dex2oat-swap=true \
		ro.sys.fw.dex2oat_thread_count=4

# libhwui flags
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.render_dirty_regions=false

include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    device/asus/grouper/ueventd.grouper.rc:root/ueventd.grouper.rc \
    device/asus/grouper/init.grouper.usb.rc:root/init.grouper.usb.rc \
    device/asus/grouper/set_hwui_params.sh:system/bin/set_hwui_params.sh

PRODUCT_PACKAGES += \
    libstlport

ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/bcm4329.ko
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

PRODUCT_COPY_FILES += \
    device/asus/grouper/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc \
    device/asus/grouper/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

#help GL work in M
PRODUCT_PACKAGES += \
    libdgv1

PRODUCT_PACKAGES += \
    libhealthd.tegra3 \
    lights.grouper \
    audio.primary.tegra \
    power.grouper \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    librs_jni \
    libemoji \
    l2ping \
    hcitool \
    bttest \
    libaudioutils \
    libtinyalsa \
    com.android.future.usb.accessory


PRODUCT_PACKAGES += \
    keystore.grouper

# Filesystem management tools
PRODUCT_PACKAGES += \
    fsck.f2fs \
    mkfs.f2fs \
    e2fsck

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media config xml file
PRODUCT_COPY_FILES += \
    device/asus/grouper/media_profiles.xml:system/etc/media_profiles.xml

# media codec config xml file
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/asus/grouper/media_codecs.xml:system/etc/media_codecs.xml

# audio mixer paths
PRODUCT_COPY_FILES += \
    device/asus/grouper/mixer_paths.xml:system/etc/mixer_paths.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
    device/asus/grouper/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_PACKAGES += \
    libstagefrighthw

PRODUCT_PACKAGES += \
    PerformanceControl

WIFI_BAND := 802_11_BG
PRODUCT_DEFAULT_WIFI_CHANNELS := 13

 $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# inherit from the non-open-source side
$(call inherit-product, vendor/asus/grouper/asus-vendor.mk)
$(call inherit-product, vendor/broadcom/grouper/broadcom-vendor.mk)
$(call inherit-product, vendor/elan/grouper/elan-vendor.mk)
$(call inherit-product, vendor/invensense/grouper/invensense-vendor.mk)
$(call inherit-product, vendor/nvidia/grouper/nvidia-vendor.mk)
$(call inherit-product-if-exists, vendor/widevine/arm-generic/widevine-vendor.mk)

