OPENSCAD="/mnt/c/Program Files/OpenSCAD/openscad.exe"

.SUFFIXES: .scad .stl

INCLUDES=common.scad connector.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all
all: clip.stl bar-rear.stl bar-front.stl interface.stl
