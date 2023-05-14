include <common.scad>;
include <connector.scad>;

difference() {
    union() {
        // Bar body
        cube([BAR_LENGTH, BAR_WIDTH, BAR_WIDTH]);

        // Connector pin for rear half of the bar
        translate([BAR_LENGTH - DELTA, BAR_WIDTH / 2, BAR_WIDTH / 2])
            rotate([0, 90, 0])
                connector_pin();
    }

    union() {
        // Connector through hole for potential 90 degree rear bar (made from two blind holes)
        translate([BAR_WIDTH / 2, BAR_WIDTH / 2, BAR_WIDTH + DELTA])
            rotate([180, 0, 0])
                connector_hole();
        translate([BAR_WIDTH / 2, BAR_WIDTH / 2, -DELTA])
            rotate([0, 0, 0])
                connector_hole();
    }
}
