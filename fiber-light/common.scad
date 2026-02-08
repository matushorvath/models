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

// Zigbee relay board
RELAY_BOARD_X = 38;
RELAY_BOARD_Y = 38;
RELAY_BOARD_Z = 1;

RELAY_HEIGHT_Z = 19; // for mocking the board
RELAY_RISER_Z = 3;
RELAY_BUTTON_X = 14.5;

// USB board
USB_BOARD_X = 30.5;
USB_BOARD_Y = 20.5;
USB_BOARD_Z = 2;

USB_PORT_MARGIN = .5;
USB_PORT_Y = 9 + USB_PORT_MARGIN;
USB_PORT_Z = 3 + USB_PORT_MARGIN;
USB_PORT_OFFSET_Z = 1.5 - USB_PORT_MARGIN / 2; // actual width of the board - half of the added Z margin

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
USB_BOARD_PORT_WALL = 1.5;

USB_BOARD_LATCH_LENGTH_X = 0.8;
USB_BOARD_LATCH_LENGTH_Y = 6;
USB_BOARD_LATCH_LENGTH_Z = 0.6;

USB_PLATE_MARGIN_Z = 2;
USB_PLATE_X = 1.5;
USB_MASK_X = 50;

USB_SOLDER_X = 5;
USB_SOLDER_Y = 3;
USB_SOLDER_Z = .5;

PIN_Z = 3; // should be at least USB_BOARD_Z

BULB_FRICTION_D = 0.3;
BULB_FRICTION_MARGIN_Z = .3;
BULB_FRICTION_RAMP_Z = .5;

RELAY_RISER_CORNER = 3;
RELAY_WALL = 1.5;
RELAY_HOLDER_Z = RELAY_WALL + RELAY_RISER_Z + RELAY_BOARD_Z + 1;

RELAY_BUTTON_HOLE = 10;
RELAY_BUTTON_MASK_Z = 50;
