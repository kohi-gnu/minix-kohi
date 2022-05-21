TRIPLET		:= $(CONFIG_ARCH)-elf

ifeq ($(CONFIG_TOOLCHAIN), llvm)

	TARGET_CC	:= clang -target $(TRIPLET)
	TARGET_AS	:= $(TARGET_CC)
	TARGET_LD	:= ld.lld
else
	error "TODO"
endif