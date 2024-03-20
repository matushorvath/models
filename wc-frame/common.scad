include <../common/constants.scad>

$fa = 1;
$fs = .4;

BUMP = 1;
BORDER = 14.5;
WIDTH = 168;
HEIGHT = 108;
// 199 total width with bumps
// 139 total height with bumps

INNER_FRAME = 2;
OUTER_FRAME = 3.4;
// total, including the outside bezel DEPTH = 16;
DEPTH = 13.6;

NOTCH_FRAME = 2;
NOTCH_DEPTH = 3;
NOTCH_LENGTH = 20;
NOTCH_POS = 5;

HOLE_R = 2.5;
HOLE_DIST = 155;
HOLE_POS = 63;
HOLE_SURROUND_H = 15;
HOLE_SURROUND_W = 10;
//HOLE_SURROUND_D = 10.2; = DEPTH - OUTER_FRAME

CORNER_RADIUS = 2;

FRAME_SPRING = NOTCH_DEPTH;
FRAME_HOLE = 10 - FRAME_SPRING;
FRAME_GAP = 3;
FRAME_MID_HEIGHT = 30;

CONNECTOR_SIZE = 8;
