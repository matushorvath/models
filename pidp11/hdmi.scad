include <common.scad>
include <BOSL/shapes.scad>

use <plate.scad>

HDMI_X = 37;
HDMI_Y = 10.5;
HDMI_Z = 2.5;

HDMI_CONN_X = 17.5;
HDMI_CONN_Y = 8;

HDMI_SCREW_DIST = 26.5;
HDMI_SCREW_D = 4;

plate(HDMI_X, HDMI_Y, HDMI_Z, HDMI_CONN_X, HDMI_CONN_Y, HDMI_SCREW_DIST, HDMI_SCREW_D);
