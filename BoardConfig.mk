# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 TeamWin Recovery Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/tecno/LH8n

# For building with minimal manifest
# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
SOONG_ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Arch Suffix
TARGET_IS_64_BIT := true
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# APEX
#DEXPREOPT_GENERATE_APEX_IMAGE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := LH8n

# Platform
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)
PRODUCT_PLATFORM := mt6833

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_OTA_ASSERT_DEVICE)
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Display
#TARGET_SCREEN_DENSITY := 480

# Kernel
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
BOARD_KERNEL_PAGESIZE := 2048
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_IMAGE_NAME := Image.gz

# Boot Command line
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
BOARD_KERNEL_CMDLINE += androidboot.force_normal_boot=1

# Boot Img Args
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Kernel - prebuilt
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value

 # File System
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs

# Dynamic Partition
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 9122611200 # TODO: Fix hardcoded value 
BOARD_MAIN_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor

# Workaround for error copying vendor/product files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# System as root
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Fstab Path
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_VENDOR := vendor product
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 3
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Hack: prevent anti rollback
#PLATFORM_SECURITY_PATCH := 2099-12-31
#VENDOR_SECURITY_PATCH := 2099-12-31
#PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
#TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_LOAD_VENDOR_MODULES := true
TW_FRAMERATE := 60
TW_PREPARE_DATA_MEDIA_EARLY := true
TW_INCLUDE_FASTBOOTD := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Include binaries
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

# Excludes
TW_EXCLUDE_TWRP_APP := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_SUPERSU := true
TW_BACKUP_EXCLUSIONS := /data/fonts \
                        /data/nandswap

# Set brightness path and level
TW_MAX_BRIGHTNESS := 1000
TW_DEFAULT_BRIGHTNESS := 500
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"                        

# Disable the Battery/CPU Temperature percentage for devices where it doesn't work properly
TW_NO_BATT_PERCENT := true
TW_NO_CPU_TEMP := true

# Prevent TWRP from unmounting /system
TW_NEVER_UNMOUNT_SYSTEM := true

# On some device, TWRP backup folder name will show 0000000000 bcos cpuinfo has no serial number. Using this flag then it will use ro.product.model as the folder name instead of all 0000000000
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# Maintainer/Version
TW_DEVICE_VERSION := perilouspike