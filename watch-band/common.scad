include <../common/constants.scad>

$fa = 1;
$fs = .4;

HOLE_X = 3.5;
HOLE_Y = 21.5;

WALL_TOP = 3;
WALL_BOTTOM = 1.5;
WALL_SIDE = 2;

OUTSIDE_RADIUS = 2.5;
EDGE_RADIUS = 0.5;
INSIDE_RADIUS = 0.5;
CAVE_RADIUS = 2;

CHIP_CAVE_X = 2;    // cave in the top side, where the chips are
CHIP_CAVE_Y = 1;    // cave in the sides, to fit the large NFC sticker
CHIP_CAVE_Z = 15.5; // RFID diameter is 15, NFC width is 12

// extra depth on the side of the cave that gets cut off
// this positions the rounded corners of the cave on that side to match the outside roundec corners, to keep the wall thick
CHIP_CAVE_CUTOFF_X = .8;

CAVE_BORDER = 2; // border around the chip cave

ICON_X = 10;
ICON_Y = 10;
ICON_Z = .4;
ICON_OFFSET_Y = -2.5;
