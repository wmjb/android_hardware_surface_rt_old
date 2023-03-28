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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from the proprietary version
# needed for BP-flashing updater extensions

# Default value, if not overridden else where.
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/asus/grouper/bluetooth

TARGET_BOARD_PLATFORM := tegra3
TARGET_TEGRA_VERSION := t30

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9

# Jack
ifeq ($(ANDROID_JACK_VM_ARGS),)
  ANDROID_JACK_VM_ARGS := -Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m
endif

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400
BOARD_CACHEIMAGE_PARTITION_SIZE := 464519168
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6567231488
BOARD_FLASH_BLOCK_SIZE := 4096

# Disable journaling on system.img to save space
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Don't dex preoptimize because of small system partition
WITH_DEXPREOPT := false

# Configure jemalloc for low-memory
MALLOC_SVELTE := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/sd8xxx.ko"

WIFI_DRIVER_MODULE_NAME := "sd8xxx"

WIFI_DRIVER_MODULE_ARG  := "drv_mode=5 cfg80211_wext=0xc sta_name=wlan uap_name=wlan wfd_name=p2p max_uap_bss=1 fw_name=mrvl/sd8797_uapsta.bin"

WIFI_DRIVER_FW_PATH_PARAM := "/proc/mwlan/config"

WIFI_DRIVER_FW_PATH_STA := "drv_mode=5"

WIFI_DRIVER_FW_PATH_AP :=  "drv_mode=6"

WIFI_DRIVER_FW_PATH_P2P := "drv_mode=5"


#camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

TARGET_BOOTLOADER_BOARD_NAME := grouper

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

BOARD_USES_GENERIC_INVENSENSE := false

BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_BCM := false

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/asus/grouper/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
ifneq ($(HAVE_NVIDIA_PROP_SRC),false)
# needed for source compilation of nvidia libraries
-include vendor/nvidia/proprietary_src/build/definitions.mk
-include vendor/nvidia/build/definitions.mk
endif

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.tegra3

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

BOARD_USES_GROUPER_MODULES := true

TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# ViPER4Android
VIPER4ANDROID_MODE := NEON

# custom ota
BOARD_CUSTOM_OTA_MK := device/asus/grouper/custom/customota.mk

# SELinux
BOARD_SEPOLICY_DIRS += \
        device/asus/grouper/sepolicy
