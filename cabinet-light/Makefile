include ../common/openscad.mk

.SUFFIXES: .scad .stl

TARGETS=glue_set.stl glue_base.stl pins.stl
INCLUDES=common.scad glue_base.scad pins.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all clean

all: $(TARGETS)

clean:
	rm -f $(TARGETS:.scad=.stl)
