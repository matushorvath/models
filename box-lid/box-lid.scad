include <common.scad>

module handle(length_big, length_small, width_big, width_small, height_curved, height_extra) {
    length_delta_half = (length_big - length_small) / 2;
    r_length_curve = 0.5 * (length_delta_half + height_curved * height_curved / length_delta_half);

    width_delta_half = (width_big - width_small) / 2;
    r_width_curve = 0.5 * (width_delta_half + height_curved * height_curved / width_delta_half);

    difference() {
        translate(v = [0, 0, (height_curved + height_extra) / 2 + DELTA])
            cube([length_big, width_big, height_curved + height_extra], center = true);

        translate(v = [0, r_width_curve + width_small / 2, 0])
            rotate([0, 90, 0])
                cylinder(h = length_big + 2 * DELTA, r = r_width_curve, center = true);

        translate(v = [0, -(r_width_curve + width_small / 2), 0])
            rotate([0, 90, 0])
                cylinder(h = length_big + 2 * DELTA, r = r_width_curve, center = true);

        translate(v = [r_length_curve + length_small / 2, 0, 0])
            rotate([90, 0, 0])
                cylinder(h = width_big + 2 * DELTA, r = r_length_curve, center = true);

        translate(v = [-(r_length_curve + length_small / 2), 0, 0])
            rotate([90, 0, 0])
                cylinder(h = width_big + 2 * DELTA, r = r_length_curve, center = true);
    }
}

union() {
    translate(v = [0, 0, INSIDE_HEIGHT / 2])
        cylinder(h = INSIDE_HEIGHT, r = BIG_R, center = true);

    #translate(v = [0, 0, INSIDE_HEIGHT + LID_HEIGHT / 2 - DELTA])
        cylinder(h = LID_HEIGHT, r = SMALL_R, center = true);

    handle_length_big = SMALL_R * HANDLE_LENGTH_BIG_FACTOR;
    handle_length_small = SMALL_R * HANDLE_LENGTH_SMALL_FACTOR;

    handle_width_big = SMALL_R * HANDLE_WIDTH_BIG_FACTOR;
    handle_width_small = SMALL_R * HANDLE_WIDTH_SMALL_FACTOR;

    translate(v = [0, 0, INSIDE_HEIGHT + LID_HEIGHT - DELTA])
        handle(
            handle_length_big, handle_length_small,
            handle_width_big, handle_width_small,
            HANDLE_HEIGHT_CURVED, HANDLE_HEIGHT_EXTRA);
}
