include $(BSDHEADERDIR)/arch/$(CONFIG_ARCH)/build.mk

ifeq ($(CONFIG_ARCH), i386)
include $(BSDHEADERDIR)/arch/x86/build.mk
endif