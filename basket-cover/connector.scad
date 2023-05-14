include <common.scad>

module connector_pin() {
    pin_height = CONNECTOR_DEPTH - LOOSE_FIT;
    pin_width = CONNECTOR_WIDTH - TIGHT_FIT;
    chamfer_size = CONNECTOR_WIDTH / 4;

    difference() {
        // Body
        translate([0, 0, pin_height / 2])
            cube([pin_width, pin_width, pin_height], center = true);

        // Chamfers
        union() {
            translate([-pin_width / 2, 0, pin_height])
                rotate([90, 45, 0])
                    cube([chamfer_size, chamfer_size, pin_width + 2 * DELTA], center = true);
            translate([pin_width / 2, 0, pin_height])
                rotate([90, 45, 0])
                    cube([chamfer_size, chamfer_size, pin_width + 2 * DELTA], center = true);

            translate([0, -pin_width / 2, pin_height])
                rotate([45, 0, 0])
                    rotate([0, 90, 0])
                        cube([chamfer_size, chamfer_size, pin_width + 2 * DELTA], center = true);
            translate([0, pin_width / 2, pin_height])
                rotate([45, 0, 0])
                    rotate([0, 90, 0])
                        cube([chamfer_size, chamfer_size, pin_width + 2 * DELTA], center = true);
        }
    }
}

module connector_hole() {
    translate([0, 0, CONNECTOR_DEPTH / 2])
        cube([CONNECTOR_WIDTH, CONNECTOR_WIDTH, CONNECTOR_DEPTH], center = true);
}
