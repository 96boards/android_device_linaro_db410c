#
# Copyright (C) 2011 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

PRODUCT_PACKAGES += \
	libGLES_android \
	gralloc.default \
	hwcomposer.default \
	libGLESv1_CM_emulation \
	lib_renderControl_enc \
	libEGL_emulation \
	libGLESv2_enc \
	libOpenglSystemCommon \
	libGLESv2_emulation \
	libGLESv1_enc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.nohardwaregfx=true \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=160 \
	debug.sf.no_hw_vsync=1 \
	ro.kernel.qemu.gles=0 \
	ro.kernel.qemu=1

