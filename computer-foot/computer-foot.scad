include <common.scad>

BARRIER_R = BIG_R + BARRIER_WIDTH;
BASE_WIDTH = BARRIER_R * 2 + BASE_EXTRA;

difference() {
    union() {
        // Base
        translate(v = [0, 0, -(RING_HEIGHT - BASE_HEIGHT) / 2])
            cube(size = [BASE_WIDTH, BASE_WIDTH, BASE_HEIGHT], center = true);

        // Outside cylinder
        cylinder(h = RING_HEIGHT, r = BARRIER_R, center = true);
    }

    // Inside cylinder
    cylinder(h = RING_HEIGHT + DELTA, r1 = SMALL_R + RING_FIT, r2 = BIG_R + RING_FIT, center = true);

    // Cut off
    translate(v = [(BASE_WIDTH - BASE_CUT) / 2, 0, 0])
        cube(size = [BASE_CUT + DELTA, BASE_WIDTH + DELTA, RING_HEIGHT + 2 * DELTA], center = true);
}
