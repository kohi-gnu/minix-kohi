COMMON_CFLAGS	= -I$(SOURCEDIR)/include \
					-I$(BSDHEADERDIR) \
					-D__minix \
					-D_MINIX_SYSTEM \
					-DEXTERN=extern \
					-Wall -Wextra -std=c99 -Wno-vla
COMMON_LDFLAGS	=

# ============================================================================
#  KERNEL
# ============================================================================

KERNEL_CFLAGS	= $(COMMON_CFLAGS) \
					-fno-stack-protector \
					-D__kernel__  \
					-ffreestanding \
					-I$(SOURCEDIR) \
					-I$(BUILDDIR)/include \
					-I$(SOURCEDIR)/kernel/arch/${CONFIG_ARCH} \
					-I$(SOURCEDIR)/kernel/arch/$(CONFIG_ARCH)/include \
					-I$(SOURCEDIR)/kernel/arch/$(CONFIG_ARCH)/bsp/include \
					-I$(SOURCEDIR)/include/arch/$(CONFIG_ARCH)/include \
					-I$(SOURCEDIR)/lib/libexec/ 

KERNEL_LDFLAGS	= -T $(SOURCEDIR)/kernel/arch/$(CONFIG_ARCH)/kernel.lds \
					 -nostdlib

ifneq ($(CONFIG_PAE), no)
KERNEL_CFLAGS += -DPAE=1
endif

ifneq ($(CONFIG_SMP), no)
KERNEL_CFLAGS += -DCONFIG_SMP
endif

ifdef CONFIG_MAX_CPUS
KERNEL_CFLAGS += -DCONFIG_MAX_CPUS=$(CONFIG_MAX_CPUS)
endif

ifneq ($(CONFIG_USE_WATCHDOG), no)
KERNEL_CFLAGS += -DUSE_WATCHDOG=1
endif

ifneq ($(CONFIG_USE_SYSDEBUG), no)
KERNEL_CFLAGS += -DUSE_SYSDEBUG=1
endif

ifneq ($(CONFIG_USE_LIVEUPDATE), no)
KERNEL_CFLAGS += -DUSE_UPDATE=1
endif
