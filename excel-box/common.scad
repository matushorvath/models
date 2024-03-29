include <../common/constants.scad>

$fa = 1;
$fs = .4;

// Box
BOX_L1 = 160;
BOX_L2 = 41;
BOX_W = 65.5;
BOX_D_BOTTOM = 15.5;
BOX_D_LID = 9.5;
BOX_D = BOX_D_BOTTOM + BOX_D_LID;

// Misc
SUPPORT_L = 10;
CUTOUT_L = 30;
CUTOUT_SHIFT_X = 10;

// Big tool
BT_W1 = 20.2;
BT_W2 = 18.7;
BT_L1 = 74;
BT_L2 = 75;
//BT_BLADE_D = 6.3;
//BT_BLADE_L = 24;
BT_BOTTOM_D = 2;

// Medium tool
MT_W1 = 11.4;
MT_W2 = 18.7;
MT_L1 = 99;
MT_L2 = 55;
MT_BLADE_D = 6.3;
MT_BLADE_L = 24;

// Small tool
ST_W1 = 8.2;
ST_W2 = 14.3;
ST_L1 = 101;
ST_L2 = 51;
ST_BLADE_D = 5;
ST_BLADE_L = 24;

MT_ST_EXTRA_L2 = 10;

// Blade holder
BH_R1 = 12.9;
BH_R2 = 14;
BH_L = 53;
