include <common.scad>

module connector_pin(depth) {
    pin_height = depth - LOOSE_FIT;

    difference() {
        // Body
        translate([0, 0, pin_height / 2])
            cube([CONNECTOR_WIDTH, CONNECTOR_WIDTH, pin_height], center = true);

        // Chamfers
        union() {
            translate([-CONNECTOR_WIDTH / 2, 0, pin_height])
                rotate([90, 45, 0])
                    cube([CONNECTOR_CHAMFER, CONNECTOR_CHAMFER, CONNECTOR_WIDTH + 2 * DELTA], center = true);
            translate([CONNECTOR_WIDTH / 2, 0, pin_height])
                rotate([90, 45, 0])
                    cube([CONNECTOR_CHAMFER, CONNECTOR_CHAMFER, CONNECTOR_WIDTH + 2 * DELTA], center = true);

            translate([0, -CONNECTOR_WIDTH / 2, pin_height])
                rotate([45, 0, 0])
                    rotate([0, 90, 0])
                        cube([CONNECTOR_CHAMFER, CONNECTOR_CHAMFER, CONNECTOR_WIDTH + 2 * DELTA], center = true);
            translate([0, CONNECTOR_WIDTH / 2, pin_height])
                rotate([45, 0, 0])
                    rotate([0, 90, 0])
                        cube([CONNECTOR_CHAMFER, CONNECTOR_CHAMFER, CONNECTOR_WIDTH + 2 * DELTA], center = true);
        }
    }
}

module connector_hole(depth) {
    translate([0, 0, depth / 2])
        cube([CONNECTOR_WIDTH, CONNECTOR_WIDTH, depth], center = true);
}
