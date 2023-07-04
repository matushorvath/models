ifdef WSLENV
OPENSCAD="/mnt/c/Program Files/OpenSCAD/openscad.exe"
else
OPENSCAD=openscad
endif

.SUFFIXES: .scad .stl

SOURCES=bottom.stl
INCLUDES=common.scad

%.stl: %.scad $(INCLUDES)
	$(OPENSCAD) -o $@ $<

.PHONY: all clean
all: $(SOURCES)

clean:
	rm -f $(SOURCES:.scad=.stl)
