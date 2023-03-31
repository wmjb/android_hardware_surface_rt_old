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

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400
# Disable journaling on system.img to save space.
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Only pre-optimize the boot image
WITH_DEXPREOPT_BOOT_IMG_ONLY := true

BOARD_USERDATAIMAGE_PARTITION_SIZE := 6567231488
BOARD_CACHEIMAGE_PARTITION_SIZE := 457179136
BOARD_FLASH_BLOCK_SIZE := 4096

# Wi-Fi
BOARD_WLAN_DEVICE           := bcmdhd
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)


WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/sd8xxx.ko"

WIFI_DRIVER_MODULE_NAME := "sd8xxx"

WIFI_DRIVER_MODULE_ARG  := "drv_mode=5 cfg80211_wext=0xc sta_name=wlan uap_name=wlan wfd_name=p2p max_uap_bss=1 fw_name=mrvl/sd8797_uapsta.bin"

WIFI_DRIVER_FW_PATH_PARAM := "/proc/mwlan/config"

WIFI_DRIVER_FW_PATH_STA := "drv_mode=5"

WIFI_DRIVER_FW_PATH_AP :=  "drv_mode=6"

WIFI_DRIVER_FW_PATH_P2P := "drv_mode=5"



#WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/mwifiex_sdio.ko"

#WIFI_DRIVER_MODULE_NAME := "mwifiex_sdio"


TARGET_BOOTLOADER_BOARD_NAME := grouper

TARGET_FORCE_SCREENSHOT_CPU_PATH := true

BOARD_USES_GENERIC_AUDIO := false
#BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
#BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
#USE_LEGACY_AUDIO_POLICY := 1

#USE_PROPRIETARY_AUDIO_EXTENSIONS := true
#BOARD_USES_ALSA_AUDIO := true


BOARD_USES_TINY_AUDIO_HW := true

#BOARD_USES_TINY_ALSA_AUDIO := true

#BUILD_WITH_ALSA_UTILS := true



BOARD_USES_GENERIC_INVENSENSE := false

BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_BCM := false

USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true

ifneq ($(HAVE_NVIDIA_PROP_SRC),false)
# needed for source compilation of nvidia libraries
-include vendor/nvidia/proprietary_src/build/definitions.mk
-include vendor/nvidia/build/definitions.mk
endif

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libdumpstate.grouper libhealthd.tegra3

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

BOARD_USES_GROUPER_MODULES := true

BOARD_USES_FULL_RECOVERY_IMAGE := true

# Configure jemalloc for low-memory
MALLOC_SVELTE := false

# Use clang platform builds
USE_CLANG_PLATFORM_BUILD := true

BOARD_KERNEL_CMDLINE := androidboot.hardware=$(TARGET_BOOTLOADER_BOARD_NAME)
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-linux-androideabi-4.8/bin
ARM_EABI_TOOLCHAIN:= $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-linux-androideabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.8
#TARGET_GCC_VERSION_EXP := 4.9
TARGET_KERNEL_CONFIG := surface-rt_android_defconfig
TARGET_KERNEL_SOURCE := kernel/asus/grouper

TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
BOARD_SEPOLICY_DIRS += device/asus/grouper/sepolicy

TARGET_RELEASETOOLS_EXTENSIONS := device/asus/grouper

BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_SCREEN_HEIGHT := 1366
TARGET_SCREEN_WIDTH := 768


