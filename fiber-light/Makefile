include ../common/openscad.mk

.SUFFIXES: .scad .stl

TARGETS=base.stl bulb-holder.stl usb-holder.stl
INCLUDES=common.scad shell.scad usb-holder.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all clean

all: $(TARGETS)

clean:
	rm -f $(TARGETS:.scad=.stl)
