include <../common/constants.scad>

$fa = 1;
$fs = .4;

HOLE_H = 3;
HOLE_W = 21.5;

WALL = 2;
WALL_ADD_TOP = 1;

DEPTH = 17; // 6.5;

OUTSIDE_RADIUS = 2.5;
EDGE_RADIUS = 0.5;
INSIDE_RADIUS = 0.5;
CAVE_RADIUS = 2;

RFID_OUTSIDE_R = 15 / 2;
RFID_INSIDE_R = 5.5 / 2; // actual diameter is 6

RFID_CHIP_X = 5.5;
RFID_Z = .6;

NFC_X = 29;
NFC_Y = 12;
NFC_Z = .4;
NFC_COVER_Z = .7;

CHIP_CAVE_EXTRA_Z = .7; // extra depth for chips (added to NFC and RFID depth)
CHIP_CAVE_STRAIGHTEN_Z = 5; // extra depth on the side of the cave that gets cut off; to remove rounded corners deep inside the cave
