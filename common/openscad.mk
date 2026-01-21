# Detect OpenSCAD location

ifneq ($(shell wslinfo --version),)
	OPENSCAD="/mnt/c/Program Files/OpenSCAD/openscad.exe"
else ifeq ($(shell uname -s),Darwin)
	OPENSCAD="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
else
	OPENSCAD=openscad
endif
