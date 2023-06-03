ifdef WSLENV
OPENSCAD="/mnt/c/Program Files/OpenSCAD/openscad.exe"
else
OPENSCAD=openscad
endif

.SUFFIXES: .scad .stl

SOURCES=frame.stl plate.stl
INCLUDES=common.scad connector.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all
all: $(SOURCES)
