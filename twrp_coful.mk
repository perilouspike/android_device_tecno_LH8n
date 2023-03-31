# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 TeamWin Recovery Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
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

# Device Target Name
PRODUCT_RELEASE_NAME := moto g31

# Inherit from coful device
$(call inherit-product, device/motorola/coful/device.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, vendor/twrp/config/gsm.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B OTA
# https://source.android.com/docs/core/ota/virtual_ab/implement#build-flags
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable updating of APEXes
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := coful
PRODUCT_NAME := twrp_coful
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g31
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-$(PRODUCT_RRAND)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="coful_g-user 12 S3RWB32.125-29-2 be967 release-keys"

BUILD_FINGERPRINT := motorola/coful_g/coful:12/S3RWB32.125-29-2/be967:user/release-keys