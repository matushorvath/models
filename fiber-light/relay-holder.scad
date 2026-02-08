include <common.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

module relay_holder() {
    difference() {
        // The holder is carved out of this box
        cuboid([
            RELAY_BOARD_X + 2 * RELAY_WALL,
            RELAY_BOARD_Y + 2 * RELAY_WALL,
            RELAY_HOLDER_Z
        ], align = V_UP);

        // Remove inside of the box
        up(RELAY_WALL - DELTA)
            // RELAY_HOLDER_Z is unnecessarily large, but it doesn't matter
            cuboid([RELAY_BOARD_X, RELAY_BOARD_Y, RELAY_HOLDER_Z], align = V_UP);

        // // Add access for the button
        // down(DELTA)
        //     right(RELAY_BOARD_X / 2 - RELAY_BUTTON_X)
        //         cuboid([RELAY_BUTTON_HOLE, RELAY_BUTTON_HOLE, RELAY_WALL + 2 * DELTA], align = V_UP);
    }

    // Risers
    up(RELAY_WALL - DELTA)
        yflip_copy() xspread(RELAY_BOARD_X - RELAY_RISER_CORNER)
            forward(RELAY_BOARD_Y / 2 + DELTA)
    cuboid(
        [RELAY_RISER_CORNER, RELAY_RISER_CORNER, RELAY_RISER_Z],
        align = V_UP + V_BACK
    );

    // // Latches
    // up(RELAY_WALL + RELAY_RISER_Z + RELAY_BOARD_Z + RELAY_LATCH_EXTRA_Z)
    //     yflip_copy() xspread(RELAY_BOARD_X - 2 * RELAY_LATCH_OFFSET_X - RELAY_LATCH_LENGTH_X)
    //         forward(RELAY_BOARD_Y / 2 + DELTA)
    //             right_triangle(
    //                 [RELAY_LATCH_LENGTH_X, RELAY_LATCH_LENGTH_Y, RELAY_LATCH_LENGTH_Z],
    //                 orient = ORIENT_X,
    //                 align = V_UP + V_BACK);
}

module relay_button_mask() {
    // Access for the button
    up(RELAY_WALL + DELTA)
        right(RELAY_BOARD_X / 2 - RELAY_BUTTON_X)
            cuboid([RELAY_BUTTON_HOLE, RELAY_BUTTON_HOLE, RELAY_BUTTON_MASK_Z], align = V_DOWN);
}

difference() {
    relay_holder();
    relay_button_mask();
}
