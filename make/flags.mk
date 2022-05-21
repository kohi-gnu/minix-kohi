COMMON_CFLAGS	= -I$(SOURCEDIR)/include \
					-I$(BSDHEADERDIR) \
					-D__minix \
					-D_MINIX_SYSTEM
COMMON_LDFLAGS	=

KERNEL_CFLAGS	= $(COMMON_CFLAGS) \
					-D__kernel__  \
					-ffreestanding \
					-I$(SOURCEDIR) \
					-I$(BUILDDIR)/include \
					-I$(SOURCEDIR)/kernel/arch/${CONFIG_ARCH} \
					-I$(SOURCEDIR)/kernel/arch/$(CONFIG_ARCH)/include \
					-I$(SOURCEDIR)/kernel/arch/$(CONFIG_ARCH)/bsp/include \
					-I$(SOURCEDIR)/include/arch/$(CONFIG_ARCH)/include

KERNEL_LDFLAGS	= -T $(SOURCEDIR)/kernel/arch/$(CONFIG_ARCH)/kernel.lds \
					 -nostdlib 