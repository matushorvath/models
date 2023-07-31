include ../common/openscad.mk

.SUFFIXES: .scad .stl

SOURCES=clip.stl bar-rear.stl bar-front.stl interface.stl
INCLUDES=common.scad connector.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all
all: $(SOURCES)
