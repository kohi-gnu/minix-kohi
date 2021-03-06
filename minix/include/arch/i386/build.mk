MINIX_INC	= archconst.h archtypes.h bios.h cmos.h \
	diskparm.h elf.h fpu.h interrupt.h \
	ipcconst.h memory.h partition.h \
	pci_amd.h pci.h pci_intel.h pci_sis.h \
	pci_via.h ports.h stackframe.h vm.h

MACHINE_INCS += $(addprefix $(BUILDDIR)/include/machine/, $(MINIX_INC))


$(BUILDDIR)/include/machine/%.h: $(SOURCEDIR)/include/arch/$(CONFIG_ARCH)/include/%.h
	@ mkdir -p $(dir $@)
	cp $< $@
