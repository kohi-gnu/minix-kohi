.SUFFIXES:
.DEFAULT_GOAL 	:= all

RM				= rm -f

MAKEDIR			= make
TOOLSDIR		= tools
ROOTBUILDDIR 	= build
SOURCEDIR 		= minix
BSDHEADERDIR	= bsdheader
include $(MAKEDIR)/config.mk
BUILDDIR 		= $(ROOTBUILDDIR)/$(CONFIG_TOOLCHAIN)-$(CONFIG_ARCH)

include $(MAKEDIR)/flags.mk
include $(MAKEDIR)/toolchain.mk

GARBADGE		= 

include $(TOOLSDIR)/build.mk
include $(BSDHEADERDIR)/arch/build.mk
include $(SOURCEDIR)/include/arch/$(CONFIG_ARCH)/build.mk
include $(SOURCEDIR)/kernel/build.mk

.PHONY: all
all:  $(KERNEL_ELF)

.PHONY: clean
clean:
	rm -f $(GARBADGE)

.PHONY: re
re: clean all
