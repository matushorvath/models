include <../common/constants.scad>

$fa = 1;
$fs = .4;

// Measured original
TOP_OUTER_D = 67;
TOP_INNER_D = 65;
ORIG_BOTTOM_OUTER_D = 80;
ORIG_TOTAL_HEIGHT = 26;

// LED holder should be ~9mm from the top of the base (where base ends when looking at the assembled object)
// Base height (from lower lip of original base to where the base ends when looking) = ~22
// LED holder is ~13mm from the lower lip of original base

BULB_TOP_OFFSET_Z = 9;
BULB_OUTER_D = 13.5;
BULB_INNER_D = 10;

RELAY_X = 38;
RELAY_Y = 38;
RELAY_Z = 19;

// RELAY_BOARD_X = 40;
// RELAY_BOARD_Y = 40;
// RELAY_BOARD_Z = 20;

USB_BOARD_X = 30.5;
USB_BOARD_Y = 20.5;
USB_BOARD_Z = 2;

USB_PORT_MARGIN = 1;
USB_PORT_Y = 9 + USB_PORT_MARGIN;
USB_PORT_Z = 3 + USB_PORT_MARGIN;
USB_PORT_OFFSET_Z = 1.5 - USB_PORT_MARGIN / 2; // actual width of the board - half of the added Z margin

PIN_X = 2;
PIN_Y = 7.5;
PIN_D = 2;

// Lightbulb
BULB_IN_D = 10.2;
BULB_OUT_D = 16.6;
BULB_HOLDER_D = 25;
BULB_SMALL_Z = 3;
BULB_BIG_Z = 2;

// Additional parameters
SHELL_WALL = 2;
TOTAL_HEIGHT = 30;

USB_BOARD_CORNER_WALL = 1;
USB_BOARD_CORNER_LENGTH = 3;
USB_BOARD_BASE_WALL = 1;

USB_BOARD_LATCH_EXTRA_X = 0.5; // make the X wall near the latch a big sturdier
USB_BOARD_LATCH_LENGTH_X = 1.2;
USB_BOARD_LATCH_LENGTH_Y = 6;
USB_BOARD_LATCH_LENGTH_Z = 0.6;
USB_BOARD_LATCH_EXTRA_Z = 0.3; // move the latch up to give the board a little slack

USB_PLATE_MARGIN_Z = 2;
USB_PLATE_X = 1.5;
USB_MASK_X = 50;

PIN_Z = 3; // should be at least USB_BOARD_Z

BULB_FRICTION_D = 0.3;
BULB_FRICTION_MARGIN_Z = .3;
BULB_FRICTION_RAMP_Z = .5;
