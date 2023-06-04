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

connector_edge_width = CONNECTOR_WIDTH + 2 * CONNECTOR_EDGE;

difference() {
    union() {
        // Holder body, correctly positioned relative to plate
        translate(holder_offset)
            rotate(holder_rotation)
                cube([holder_width, holder_depth, HOLDER_HEIGHT], center = true);

        // Connector pins
        translate([CONNECTOR_POS_X1, CONNECTOR_POS_Y, HOLDER_OFFSET_Z])
            rotate([0, 180, 0])
                connector_pin(CONNECTOR_WIDTH, CONNECTOR_WIDTH, HOLDER_OFFSET_Z + NORMAL_FIT, NORMAL_FIT);
        translate([CONNECTOR_POS_X1, CONNECTOR_POS_Y, HOLDER_OFFSET_Z])
            rotate([0, 180, 0])
                connector_pin(connector_edge_width, connector_edge_width, HOLDER_OFFSET_Z - PLATE_WIDTH, 0);

        translate([CONNECTOR_POS_X2, CONNECTOR_POS_Y, HOLDER_OFFSET_Z])
            rotate([0, 180, 0])
                connector_pin(CONNECTOR_WIDTH, CONNECTOR_WIDTH, HOLDER_OFFSET_Z + NORMAL_FIT, NORMAL_FIT);
        translate([CONNECTOR_POS_X2, CONNECTOR_POS_Y, HOLDER_OFFSET_Z])
            rotate([0, 180, 0])
                connector_pin(connector_edge_width, connector_edge_width, HOLDER_OFFSET_Z - PLATE_WIDTH, 0);
    }

    // Holder hole, correctly positioned
    translate(holder_offset)
        rotate(holder_rotation)
            cube([WALLET_WIDTH, WALLET_DEPTH, HOLDER_HEIGHT + 2 * DELTA], center = true);
}
