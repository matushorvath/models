include ../common/openscad.mk

.SUFFIXES: .scad .stl

SOURCES=bottom.stl
INCLUDES=common.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all clean
all: $(SOURCES)

clean:
	rm -f $(SOURCES:.scad=.stl)
