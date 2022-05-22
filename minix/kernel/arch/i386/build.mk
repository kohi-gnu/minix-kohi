KERNEL_ARCH_SRCS_ASM	= mpx.S klib.S io_inb.S io_inl.S io_intr.S \
							io_inw.S io_outb.S io_outl.S io_outw.S \
							usermapped_glo_ipc.S
KERNEL_ARCH_SRCS_C = arch_clock.c arch_do_vmctl.c arch_system.c \
							memory.c protect.c direct_tty_utils.c \
							arch_reset.c pg_utils.c do_iopenable.c \
							do_readbios.c do_sdevio.c exception.c \
							i8259.c oxpcie.c usermapped_data_arch.c

ifneq ($(CONFIG_SMP), no)
KERNEL_ARCH_SRCS_C	+= arch_smp.c
KERNEL_ARCH_SRCS_ASM += trampoline.S
endif

ifneq ($(CONFIG_USE_ACPI), no)
KERNEL_ARCH_SRCS_C += acpi.c
KERNEL_CFLAGS += -DUSE_ACPI
endif

ifneq ($(CONFIG_USE_APIC), no)
KERNEL_ARCH_SRCS_C += apic.c
KERNEL_ARCH_SRCS_ASM += apic_asm.S
KERNEL_CFLAGS += -DUSE_APIC
endif

ifneq ($(CONFIG_USE_DEBUGREG), no)
KERNEL_ARCH_SRCS_C += breakpoints.c
KERNEL_ARCH_SRCS_ASM+= debugreg.S
endif

ifneq ($(CONFIG_USE_WATCHDOG), no)
KERNEL_ARCH_SRCS_C += arch_watchdog.c
KERNEL_CFLAGS += -DUSE_WATCHDOG
endif


KERNEL_OBJS += $(addprefix $(BUILDDIR)/kernel/arch/, $(KERNEL_ARCH_SRCS_C:.c=.o)) \
				$(addprefix $(BUILDDIR)/kernel/arch/, $(KERNEL_ARCH_SRCS_ASM:.S=.S.o))

MACHINE_INCS += $(BUILDDIR)/include/kernel/procoffsets.h

$(BUILDDIR)/kernel/arch/%.o: $(SOURCEDIR)/kernel/arch/$(CONFIG_ARCH)/%.c
	@ mkdir -p $(dir $@)
	$(TARGET_CC) -o $@ -c $< $(KERNEL_CFLAGS)

$(BUILDDIR)/kernel/arch/%.S.o: $(SOURCEDIR)/kernel/arch/$(CONFIG_ARCH)/%.S
	@ mkdir -p $(dir $@)
	$(TARGET_AS) -o $@ -c $< $(KERNEL_CFLAGS) -D__ASSEMBLY__

$(BUILDDIR)/include/kernel/procoffsets.h: $(SOURCEDIR)/kernel/arch/$(CONFIG_ARCH)/procoffsets.cf
	@ mkdir -p $(dir $@)
	cat $< | $(GENASSYM) -- $(TARGET_CC) $(KERNEL_CFLAGS) -no-integrated-as > $@