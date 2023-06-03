include <common.scad>
include <connector.scad>

holder_width = WALLET_WIDTH + HOLDER_BORDER;
holder_depth = WALLET_DEPTH + HOLDER_BORDER;

holder_offset = [
    PLATE_USABLE_LENGTH - holder_width / 2,
    HOLDER_OFFSET_Y,
    HOLDER_OFFSET_Z
];

holder_rotation = [90 - PLATE_ANGLE, 0, 0];

difference() {
    union() {
        // Holder body, correctly positioned relative to plate
        translate(holder_offset)
            rotate(holder_rotation)
                cube([holder_width, holder_depth, HOLDER_HEIGHT], center = true);

        // Connector pins
        translate([CONNECTOR_POS_X1, CONNECTOR_POS_Y, 0])
            connector_pin(CONNECTOR_WIDTH, HOLDER_OFFSET_Z, 0);
        translate([CONNECTOR_POS_X2, CONNECTOR_POS_Y, 0])
            connector_pin(CONNECTOR_WIDTH, HOLDER_OFFSET_Z, 0);
    }

    // Holder hole, correctly positioned
    translate(holder_offset)
        rotate(holder_rotation)
            cube([WALLET_WIDTH, WALLET_DEPTH, HOLDER_HEIGHT + 2 * DELTA], center = true);
}

//include <plate.scad>
