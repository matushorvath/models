include ../common/openscad.mk

.SUFFIXES: .scad .stl

TARGETS=clip.stl interface.stl;
INCLUDES=common.scad connector.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all clean

all: $(TARGETS)

clean:
	rm -f $(TARGETS:.scad=.stl)
