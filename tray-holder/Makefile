OPENSCAD="/mnt/c/Program Files/OpenSCAD/openscad.exe"

.SUFFIXES: .scad .stl

%.stl: %.scad common.scad
	$(OPENSCAD) -o $@ $<

.PHONY: all
all: base.stl head.stl stick.stl
