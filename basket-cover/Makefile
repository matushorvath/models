include ../common/openscad.mk

.SUFFIXES: .scad .stl

TARGETS=clip.stl bar-rear.stl bar-front.stl interface.stl
INCLUDES=common.scad connector.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all clean

all: $(TARGETS)

clean:
	rm -f $(TARGETS:.scad=.stl)
