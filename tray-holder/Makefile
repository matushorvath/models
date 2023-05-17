ifdef WSLENV
OPENSCAD="/mnt/c/Program Files/OpenSCAD/openscad.exe"
else
OPENSCAD=openscad
endif

.SUFFIXES: .scad .stl

SOURCES=base.stl head.stl stick.stl
INCLUDES=common.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all
all: $(SOURCES)
