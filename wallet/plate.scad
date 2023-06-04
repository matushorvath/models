include <common.scad>
include <connector.scad>

module plate() {
    linear_extrude(PLATE_WIDTH)
        difference() {
            union() {
                // Plate inside body
                polygon([
                    [PLATE_OUTSIDE_LENGTH - DELTA, 0],
                    [PLATE_LENGTH, 0],
                    [PLATE_LENGTH, PLATE_INSIDE_HEIGHT],
                    [PLATE_OUTSIDE_LENGTH - DELTA, PLATE_INSIDE_HEIGHT]
                ]);

                // Plate outside body
                polygon([
                    [0, 0],
                    [PLATE_OUTSIDE_LENGTH, 0],
                    [PLATE_OUTSIDE_LENGTH, PLATE_OUTSIDE_HEIGHT_F],
                    [0, PLATE_OUTSIDE_HEIGHT_B]
                ]);
            }

            // Cut-off corner bottom
            polygon([
                [PLATE_LENGTH - PLATE_CUTOFF, 0 - DELTA],
                [PLATE_LENGTH + DELTA, 0 + PLATE_CUTOFF],
                [PLATE_LENGTH + DELTA, 0 - DELTA]
            ]);

            // Cut-off corner top
            polygon([
                [PLATE_LENGTH - PLATE_CUTOFF, PLATE_INSIDE_HEIGHT + DELTA],
                [PLATE_LENGTH + DELTA, PLATE_INSIDE_HEIGHT - PLATE_CUTOFF],
                [PLATE_LENGTH + DELTA, PLATE_INSIDE_HEIGHT + DELTA]
            ]);
        }
}

difference() {
    plate();

    // Make top edge parallel to the holder
    translate([-DELTA, 0, -DELTA])
        rotate([90 - PLATE_ANGLE, 0, 0])
            cube([PLATE_LENGTH + 2 * DELTA, PLATE_WIDTH * 2, PLATE_WIDTH]);

    // Connector holes
    translate([CONNECTOR_POS_X1, CONNECTOR_POS_Y, -DELTA])
        connector_hole(CONNECTOR_WIDTH, CONNECTOR_WIDTH, PLATE_WIDTH + 2 * DELTA);
    translate([CONNECTOR_POS_X2, CONNECTOR_POS_Y, -DELTA])
        connector_hole(CONNECTOR_WIDTH, CONNECTOR_WIDTH, PLATE_WIDTH + 2 * DELTA);

    // Bottom hole
    translate([BOTTOM_POS_X, BOTTOM_POS_Y, -DELTA])
        connector_hole(BOTTOM_WIDTH, BOTTOM_HEIGHT, PLATE_WIDTH + 2 * DELTA);
}
