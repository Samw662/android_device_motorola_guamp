#
# SPDX-FileCopyrightText: 2022-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
include device/motorola/sm6225-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/guamp

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := guamp

# Display
TARGET_SCREEN_DENSITY := 280

# HIDL
ODM_MANIFEST_SKUS += b c d dc dn dnc fb fc fd fdc fdn fdnc fn fnc n nc
ODM_MANIFEST_B_FILES := $(DEVICE_PATH)/sku/manifest_b.xml
ODM_MANIFEST_C_FILES := $(DEVICE_PATH)/sku/manifest_c.xml
ODM_MANIFEST_D_FILES := $(DEVICE_PATH)/sku/manifest_d.xml
ODM_MANIFEST_DC_FILES := $(DEVICE_PATH)/sku/manifest_dc.xml
ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/sku/manifest_dn.xml
ODM_MANIFEST_DNC_FILES := $(DEVICE_PATH)/sku/manifest_dnc.xml
ODM_MANIFEST_FB_FILES := $(DEVICE_PATH)/sku/manifest_fb.xml
ODM_MANIFEST_FC_FILES := $(DEVICE_PATH)/sku/manifest_fc.xml
ODM_MANIFEST_FD_FILES := $(DEVICE_PATH)/sku/manifest_fd.xml
ODM_MANIFEST_FDC_FILES := $(DEVICE_PATH)/sku/manifest_fdc.xml
ODM_MANIFEST_FDN_FILES := $(DEVICE_PATH)/sku/manifest_fdn.xml
ODM_MANIFEST_FDNC_FILES := $(DEVICE_PATH)/sku/manifest_fdnc.xml
ODM_MANIFEST_FN_FILES := $(DEVICE_PATH)/sku/manifest_fn.xml
ODM_MANIFEST_FNC_FILES := $(DEVICE_PATH)/sku/manifest_fnc.xml
ODM_MANIFEST_N_FILES := $(DEVICE_PATH)/sku/manifest_n.xml
ODM_MANIFEST_NC_FILES := $(DEVICE_PATH)/sku/manifest_nc.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
TARGET_KERNEL_CONFIG += vendor/ext_config/guamp-default.config
TARGET_KERNEL_CLANG_VERSION := r487747c

# Kernel Modules - Recovery
BOARD_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
RECOVERY_KERNEL_MODULES := $(BOARD_RECOVERY_KERNEL_MODULES_LOAD)

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 50616843776

BOARD_SUPER_PARTITION_SIZE := 9763291136
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 4877451264 # (BOARD_SUPER_PARTITION_SIZE / 2) - 4MB

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop

# Recovery
TARGET_RECOVERY_DENSITY := hdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 43

# Security patch level
BOOT_SECURITY_PATCH := 2022-09-01
VENDOR_SECURITY_PATCH := 2022-09-01

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 20

# Inherit from the proprietary version
include vendor/motorola/guamp/BoardConfigVendor.mk
