KERNEL_ELF	= kernel.elf

KERNEL_SRCS	= clock.c cpulocals.c interrupt.c main.c proc.c \
				system.c table.c utility.c usermapped_data.c \
				profile.c

ifneq ($(CONFIG_SMP), no)
KERNEL_SRCS += smp.c
endif

ifneq ($(USE_WATCHDOG), no)
KERNEL_SRCS += watchdog.c
endif

ifneq ($(USE_SYSDEBUG), no)
KERNEL_SRCS += debug.c
endif

KERNEL_OBJS	= $(addprefix $(BUILDDIR)/kernel/, $(KERNEL_SRCS:.c=.o))

include $(SOURCEDIR)/kernel/arch/$(CONFIG_ARCH)/build.mk
include $(SOURCEDIR)/kernel/system/build.mk


GARBADGE	+= $(KERNEL_OBJS) $(MACHINE_INCS)

$(KERNEL_ELF): $(MACHINE_INCS) $(KERNEL_OBJS)
	$(TARGET_LD) -o $@ $(KERNEL_OBJS) $(KERNEL_LDFLAGS)

$(BUILDDIR)/kernel/%.o: $(SOURCEDIR)/kernel/%.c
	@ mkdir -p $(dir $@)
	$(TARGET_CC) -o $@ -c $< $(KERNEL_CFLAGS)
