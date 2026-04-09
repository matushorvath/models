include ../common/openscad.mk

.SUFFIXES: .scad .stl

TARGETS=box-lid.stl
PREVIEWS=$(TARGETS:.stl=.png)

all: $(TARGETS)
preview: $(PREVIEWS)

include $(wildcard *.deps)

%.stl: %.scad
	$(run-openscad)

%.png: %.scad
	$(run-openscad)

.PHONY: all preview clean

all: $(TARGETS)

clean:
	rm -f $(TARGETS) $(PREVIEWS) *.deps
