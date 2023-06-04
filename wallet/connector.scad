include <common.scad>

module connector_pin(width, height, depth, chamfer) {
    pin_height = depth;

    difference() {
        // Body
        translate([0, 0, pin_height / 2])
            cube([width, height, pin_height], center = true);

        // Chamfers
        union() {
            translate([-width / 2, 0, pin_height])
                rotate([90, 45, 0])
                    cube([chamfer, chamfer, height + 2 * DELTA], center = true);
            translate([width / 2, 0, pin_height])
                rotate([90, 45, 0])
                    cube([chamfer, chamfer, height + 2 * DELTA], center = true);

            translate([0, -height / 2, pin_height])
                rotate([45, 0, 0])
                    rotate([0, 90, 0])
                        cube([chamfer, chamfer, width + 2 * DELTA], center = true);
            translate([0, height / 2, pin_height])
                rotate([45, 0, 0])
                    rotate([0, 90, 0])
                        cube([chamfer, chamfer, width + 2 * DELTA], center = true);
        }
    }
}

module connector_hole(width, height, depth) {
    translate([0, 0, depth / 2])
        cube([width, height, depth], center = true);
}
