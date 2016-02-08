boot_img: bootimage all_dtbs
	mkdir -p $(PRODUCT_OUT)/dtbs
	cp -f $(KERNEL_OUT)/arch/$(ARCH)/boot/msm8916-mtp.dtb $(PRODUCT_OUT)/dtbs
	cp -f $(KERNEL_OUT)/arch/$(ARCH)/boot/apq8016-sbc.dtb $(PRODUCT_OUT)/dtbs
	$(TOP)/external/skales/dtbTool -o $(PRODUCT_OUT)/dt.img -s 2048 $(PRODUCT_OUT)/dtbs
	$(TOP)/external/skales/mkbootimg \
		--kernel $(PRODUCT_OUT)/kernel \
		--ramdisk $(PRODUCT_OUT)/ramdisk.img \
		--output $(PRODUCT_OUT)/boot-db410c.img \
		--dt $(PRODUCT_OUT)/dt.img \
		--pagesize "2048" \
		--base "0x80000000" \
		--cmdline "$(BOARD_KERNEL_CMDLINE)"
droidcore: boot_img
