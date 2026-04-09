# Detect OpenSCAD location

ifneq ($(shell wslinfo --version),)
	OPENSCAD="/mnt/c/Program Files/OpenSCAD/openscad.exe"
else ifeq ($(shell uname -s),Darwin)
	OPENSCAD="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
else
	OPENSCAD=openscad
endif

define run-openscad
	$(OPENSCAD) $(OPENSCAD_FLAGS) -o $@ -d $@.deps $< ; \
	EXIT_CODE=$$? ; \
	sed -i -e 's/C:/\/mnt\/c/g' $@.deps ; \
	exit $$EXIT_CODE
endef
