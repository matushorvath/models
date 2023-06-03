include <common.scad>
include <connector.scad>

holder_width = WALLET_WIDTH + HOLDER_BORDER;
holder_depth = WALLET_DEPTH + HOLDER_BORDER;

module plate() {
    linear_extrude(PLATE_WIDTH)
        difference() {
            // Plate body
            polygon([
                [0, 0],
                [PLATE_LENGTH, 0],
                [PLATE_LENGTH, PLATE_INSIDE_HEIGHT],
                [0, PLATE_OUTSIDE_HEIGHT]
            ]);

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
        connector_hole(CONNECTOR_WIDTH, PLATE_WIDTH + 2 * DELTA);
    translate([CONNECTOR_POS_X2, CONNECTOR_POS_Y, -DELTA])
        connector_hole(CONNECTOR_WIDTH, PLATE_WIDTH + 2 * DELTA);
}

//include <frame.scad>
