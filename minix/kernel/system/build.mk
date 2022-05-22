KERNEL_SYSTEM_SRCS = do_fork.c \
	do_exec.c \
	do_clear.c \
	do_exit.c \
	do_trace.c \
	do_runctl.c \
	do_update.c \
	do_times.c \
	do_setalarm.c \
	do_stime.c \
	do_settime.c \
	do_vtimer.c \
	do_irqctl.c \
	do_copy.c \
	do_umap.c \
	do_umap_remote.c \
	do_vumap.c \
	do_memset.c \
	do_setgrant.c \
	do_privctl.c \
	do_safecopy.c \
	do_safememset.c \
	do_diagctl.c \
	do_getksig.c \
	do_endksig.c \
	do_kill.c \
	do_sigsend.c \
	do_sigreturn.c \
	do_abort.c \
	do_getinfo.c \
	do_vmctl.c \
	do_mcontext.c \
	do_schedule.c \
	do_schedctl.c \
	do_statectl.c \
	do_sprofile.c

ifeq ($(CONFIG_ARCH), i386)
KERNEL_SYSTEM_SRCS +=  \
	do_devio.c \
	do_vdevio.c
endif

KERNEL_OBJS += $(addprefix $(BUILDDIR)/kernel/system/, $(KERNEL_SYSTEM_SRCS:.c=.o))

$(BUILDDIR)/kernel/system/%.o: $(SOURCEDIR)/kernel/system/%.c
	@ mkdir -p $(dir $@)
	$(TARGET_CC) -o $@ -c $< $(KERNEL_CFLAGS)