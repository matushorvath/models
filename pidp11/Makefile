include ../common/openscad.mk

.SUFFIXES: .scad .stl

TARGETS=ethernet.stl hdmi.stl
INCLUDES=common.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all clean

all: $(TARGETS)

clean:
	rm -f $(TARGETS:.scad=.stl)
