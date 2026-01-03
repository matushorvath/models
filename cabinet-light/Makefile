include ../common/openscad.mk

.SUFFIXES: .scad .stl

TARGETS=glue_base.stl
INCLUDES=common.scad pins.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all clean

all: $(TARGETS)

clean:
	rm -f $(TARGETS:.scad=.stl)
