include ../common/openscad.mk

.SUFFIXES: .scad .stl

SOURCES=clip.stl
INCLUDES=common.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all
all: $(SOURCES)
