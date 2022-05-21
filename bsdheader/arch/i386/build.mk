BSD_MACHINE_INCS = ansi.h aout_machdep.h apmvar.h asm.h \
	bioscall.h bootinfo.h bswap.h byte_swap.h \
	cdefs.h cpu.h cputypes.h \
	disklabel.h \
	elf_machdep.h endian.h endian_machdep.h \
	fenv.h float.h frame.h freebsd_machdep.h \
	gdt.h \
	ibcs2_machdep.h ieee.h ieeefp.h \
	int_const.h int_fmtio.h int_limits.h int_mwgwtypes.h int_types.h \
	intr.h intrdefs.h \
	joystick.h \
	kcore.h \
	limits.h lock.h \
	math.h mcontext.h mutex.h mtrr.h multiboot.h \
	param.h pcb.h pio.h pmap.h pmc.h proc.h profile.h psl.h \
	pte.h ptrace.h \
	reg.h rwlock.h \
	segments.h setjmp.h signal.h sljit_machdep.h specialreg.h spkr.h \
	svr4_machdep.h sysarch.h \
	trap.h tss.h types.h \
	vm86.h vmparam.h \
	wchar_limits.h

MACHINE_INCS += $(addprefix $(BUILDDIR)/include/machine/, $(BSD_MACHINE_INCS))

$(BUILDDIR)/include/machine/%.h: $(BSDHEADERDIR)/arch/$(CONFIG_ARCH)/include/%.h
	@ mkdir -p $(dir $@)
	cp $< $@
