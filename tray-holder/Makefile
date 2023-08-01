include ../common/openscad.mk

.SUFFIXES: .scad .stl

TARGETS=base.stl head.stl stick.stl
INCLUDES=common.scad hippo.stl

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all clean

all: $(TARGETS)

clean:
	rm -f $(TARGETS:.scad=.stl)
