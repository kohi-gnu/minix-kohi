X86_INCS = aout_machdep.h \
	bootinfo.h \
	cacheinfo.h \
	cpu.h \
	cpu_extended_state.h \
	cpu_ucode.h \
	cputypes.h \
	cpuvar.h \
	float.h \
	fpu.h \
	ieee.h ieeefp.h \
	intr.h intrdefs.h \
	lock.h \
	math.h mutex.h mtrr.h \
	pio.h \
	pmap.h \
	pmap_pv.h \
	psl.h \
	pte.h \
	rwlock.h \
	specialreg.h \
	sysarch.h \
	trap.h \
	via_padlock.h

MACHINE_INCS += $(addprefix $(BUILDDIR)/include/x86/, $(X86_INCS))


$(BUILDDIR)/include/x86/%.h: $(BSDHEADERDIR)/arch/x86/include/%.h
	@ mkdir -p $(dir $@)
	cp $< $@
