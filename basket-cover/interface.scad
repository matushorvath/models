include <common.scad>;

stand = [
    BAR_WIDTH + 2 * INTERFACE_EYE_WIDTH,
    BAR_WIDTH + 2 * INTERFACE_EYE_WIDTH,
    INTERFACE_STAND_HEIGHT
];

eye = [
        BAR_WIDTH + 2 * INTERFACE_EYE_WIDTH,
        INTERFACE_EYE_DEPTH,
        BAR_WIDTH + 2 * INTERFACE_EYE_WIDTH
];

eye_pos_z = stand[2] + eye[2] / 2 - INTERFACE_EYE_SINK;

opening = [
    BAR_WIDTH + TIGHT_FIT,
    eye[1] + 2 * DELTA,
    BAR_WIDTH + TIGHT_FIT
];

gap = [
    BAR_WIDTH - 2 * INTERFACE_EYE_OVERLAP,
    eye[1] + 2 * DELTA,
    INTERFACE_EYE_WIDTH + 2 * DELTA
];

gap_pos_z = eye_pos_z + eye[2] / 2 - gap[2] / 2 + DELTA;

difference() {
    union() {
        // Stand
        translate([0, 0, stand[2] / 2])
        cube(stand, center = true);

        // Eye body
        translate([0, 0, eye_pos_z])
            cube(eye, center = true);

        // Bottom fillets
    }

    union() {
        // Eye opening
        translate([0, 0, eye_pos_z])
            cube(opening, center = true);

        // Eye gap
        translate([0, 0, gap_pos_z])
            cube(gap, center = true);
    }
}
