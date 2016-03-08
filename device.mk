#
# Copyright 2014 The Android Open-Source Project
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

# Adjust the dalvik heap to be appropriate for a tablet.
$(call inherit-product-if-exists,frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
			$(LOCAL_PATH)/root/fstab.db410c:root/fstab.db410c \
			$(LOCAL_PATH)/root/init.db410c.rc:root/init.db410c.rc \
			$(LOCAL_PATH)/root/init.db410c.usb.rc:root/init.db410c.usb.rc \
			$(LOCAL_PATH)/root/ueventd.db410c:root/ueventd.db410c.rc \
			$(LOCAL_PATH)/db410c_monkey_blacklist:data/db410c_monkey_blacklist)

# Set custom settings
DEVICE_PACKAGE_OVERLAYS := device/linaro/db410c/overlay

# Add openssh support for remote debugging and job submission
PRODUCT_PACKAGES += ssh sftp scp sshd ssh-keygen sshd_config start-ssh wpa_supplicant

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

# Build libion for new double-buffering HDLCD driver
# PRODUCT_PACKAGES += libion

# Build gatord daemon for DS-5/Streamline
PRODUCT_PACKAGES += gatord

# Include ION tests
#PRODUCT_PACKAGES += iontest \
#                    ion-unit-tests

# Set zygote config
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32
PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

PRODUCT_PACKAGES += \
    libGLES_mesa \
    libGLES_android \
    hwcomposer.drm \
    gralloc.drm

# Own boot image build script
$(call inherit-product-if-exists, device/linaro/db410c/boot_img.mk)

# Copy hardware config file(s)
PRODUCT_COPY_FILES += \
	$(call add-to-product-copy-files-if-exists,\
	device/linaro/build/android.hardware.screen.xml:system/etc/permissions/android.hardware.screen.xml)

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
	frameworks/native/data/etc/android.software.backup.xml:system/etc/permissions/android.software.backup.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	device/linaro/db410c/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Copy firmware files
PRODUCT_COPY_FILES += \
	$(call add-to-product-copy-files-if-exists,\
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/a300_pfp.fw:root/lib/firmware/a300_pfp.fw \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/a300_pm4.fw:root/lib/firmware/a300_pm4.fw \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/venus.b00:root/lib/firmware/venus.b00 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/venus.b01:root/lib/firmware/venus.b01 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/venus.b02:root/lib/firmware/venus.b02 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/venus.b03:root/lib/firmware/venus.b03 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/venus.b04:root/lib/firmware/venus.b04 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/venus.mbn:root/lib/firmware/venus.mbn \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/venus.mdt:root/lib/firmware/venus.mdt \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wcnss.b00:root/lib/firmware/wcnss.b00 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wcnss.b01:root/lib/firmware/wcnss.b01 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wcnss.b02:root/lib/firmware/wcnss.b02 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wcnss.b04:root/lib/firmware/wcnss.b04 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wcnss.b06:root/lib/firmware/wcnss.b06 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wcnss.b09:root/lib/firmware/wcnss.b09 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wcnss.b10:root/lib/firmware/wcnss.b10 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wcnss.b11:root/lib/firmware/wcnss.b11 \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wcnss.mdt:root/lib/firmware/wcnss.mdt \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wlan/prima/WCNSS_cfg.dat:root/lib/firmware/wlan/prima/WCNSS_cfg.dat \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wlan/prima/WCNSS_qcom_cfg.ini:root/lib/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wlan/prima/WCNSS_qcom_wlan_nv.bin:root/lib/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
	vendor/db410c/linux-ubuntu-board-support-package-v1.2/proprietary-ubuntu/wlan/prima/WCNSS_wlan_dictionary.dat:root/lib/firmware/wlan/prima/WCNSS_wlan_dictionary.dat)

$(call inherit-product-if-exists, device/linaro/build/common-device.mk)
