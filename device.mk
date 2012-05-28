#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL tuna devices, and
# are also specific to tuna devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/zte/v9/overlay
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := large mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_PACKAGES := \
        lights.v9 \
        sensors.v9 \
        librpc \
        gps.v9 \
        V9Parts \
        libmm-omxcore \
        libOmxCore \
        libOmxVdec \
        libOmxVenc \
        libstagefrighthw \
        camera.msm7x27 \
        gralloc.msm7x27 \
        copybit.msm7x27 \
        hwcomposer.msm7x27

PRODUCT_PACKAGES += \
        audio.primary.v9 \
        audio_policy.v9 \
        audio.a2dp.default \
        libaudioutils

PRODUCT_COPY_FILES := \
        device/zte/v9/init.v9.rc:root/init.v9.rc \
        device/zte/v9/init.v9.usb.rc:root/init.v9.usb.rc \
        device/zte/v9/ueventd.v9.rc:root/ueventd.v9.rc \
        device/zte/v9/vold.fstab:system/etc/vold.fstab \
        device/zte/v9/AudioFilter.csv:system/etc/AudioFilter.csv \
        device/zte/v9/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
        device/zte/v9/media_profiles.xml:system/etc/media_profiles.xml \
        device/zte/v9/prebuilt/start_usb0.sh:system/etc/start_usb0.sh \
        device/zte/v9/prebuilt/msm-touchscreen.idc:system/usr/idc/msm-touchscreen.idc \
        device/zte/v9/prebuilt/msm-touchscreen.kl:/system/usr/keylayout/msm-touchscreen.kl \
        device/zte/v9/prebuilt/v9-keypad.kl:/system/usr/keylayout/v9-keypad.kl \
        device/zte/v9/gps.conf:system/etc/gps.conf

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
        device/zte/v9/init.bt.sh:system/etc/init.bt.sh \
        system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# WiFi
PRODUCT_COPY_FILES += \
        device/zte/v9/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
        device/zte/v9/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
        device/zte/v9/firmware/regcode:system/wifi/regcode \
        device/zte/v9/firmware/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
        device/zte/v9/firmware/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
        device/zte/v9/firmware/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin \
        device/zte/v9/firmware/device.bin:system/wifi/device.bin \
        device/zte/v9/firmware/eeprom.bin:system/wifi/eeprom.bin \
        device/zte/v9/firmware/eeprom.data:system/wifi/eeprom.data

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
         frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
         frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
         frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
         frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
         frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
         frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
         frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
         frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
         frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
         packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
         librs_jni

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
         PRODUCT_PACKAGES += send_bug
         PRODUCT_COPY_FILES += \
                 system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
                 system/extras/bugmailer/send_bug:system/bin/send_bug
endif

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)
#$(call inherit-product, frameworks/base/build/phone-hdpi-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/zte/v9/v9-vendor.mk)
