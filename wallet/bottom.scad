include <common.scad>
include <connector.scad>

angled_height = cos(PLATE_ANGLE) * BOTTOM_HEIGHT;

bottom_offset = [
    BOTTOM_POS_X - BOTTOM_WIDTH / 2,
    BOTTOM_POS_Y + BOTTOM_HEIGHT / 2,
    PLATE_WIDTH
];
bottom_rotation = [90 - PLATE_ANGLE, 0, 0];
extra_length = tan(PLATE_ANGLE) * BOTTOM_HEIGHT;

union() {
    // Bottom body
    translate(bottom_offset)
        rotate(bottom_rotation)
            translate([0, -extra_length, -0])
                cube([BOTTOM_WIDTH, BOTTOM_LENGTH + extra_length, angled_height], center = false);

    // Connector pins
    translate([BOTTOM_POS_X, BOTTOM_POS_Y, PLATE_WIDTH])
        rotate([0, 180, 0])
            connector_pin(BOTTOM_WIDTH, BOTTOM_HEIGHT, PLATE_WIDTH + NORMAL_FIT, NORMAL_FIT);
}
