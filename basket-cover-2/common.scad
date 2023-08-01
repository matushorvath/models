include <../common/constants.scad>

$fa = 1;
$fs = .4;

// Clip
CLIP_HOLE_R = 7.95;
CLIP_WALL = 5;
CLIP_ANGLE = 30;    // TODO tune the angle
CLIP_WIDTH = 10;

// Interface
INTERFACE_MARGIN = 10;
INTERFACE_WIDTH = 2;
INTERFACE_FILLET = 5;

// Connector
CONNECTOR_WIDTH = 5;
CONNECTOR_DEPTH = 5;
CONNECTOR_CHAMFER = .5;

CONNECTOR_OFFSET_L = CLIP_HOLE_R + CLIP_WALL - CLIP_WIDTH / 2;
