include <common.scad>

module connector_pin() {
    translate([0, 0, (CONNECTOR_DEPTH - LOOSE_FIT) / 2])
        cube([CONNECTOR_WIDTH, CONNECTOR_WIDTH, CONNECTOR_DEPTH - LOOSE_FIT], center = true);
}

module connector_hole() {
    translate([0, 0, CONNECTOR_DEPTH / 2])
        cube([CONNECTOR_WIDTH, CONNECTOR_WIDTH, CONNECTOR_DEPTH], center = true);
}
