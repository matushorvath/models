include <common.scad>
use <MCAD/boxes.scad>

// TODO make the spring compress when inserting the front plate
// (shorter width + everything extended beyond total_width - 5 must compress)

module frame() {
    union() {
        difference() {
            union() {
                translate([0, 0, OUTER_FRAME / 2 - DELTA])
                    roundedCube([WIDTH + 2 * BORDER, HEIGHT + 2 * BORDER, OUTER_FRAME], CORNER_RADIUS, true, true);
                translate([0, 0, DEPTH / 2])
                    roundedCube([WIDTH, HEIGHT, DEPTH], CORNER_RADIUS, true, true);
            }

            roundedCube([WIDTH - 2 * INNER_FRAME, HEIGHT - 2 * INNER_FRAME, 2 * DEPTH + 10], CORNER_RADIUS, true, true);

            translate([+(WIDTH / 2 + BORDER - NOTCH_DEPTH / 2 + DELTA), +((HEIGHT - NOTCH_LENGTH) / 2 - NOTCH_POS), (OUTER_FRAME + NOTCH_FRAME) / 2 + DELTA])
                cube([NOTCH_DEPTH + DELTA, NOTCH_LENGTH, OUTER_FRAME - NOTCH_FRAME], center = true);
            translate([-(WIDTH / 2 + BORDER - NOTCH_DEPTH / 2 + DELTA), +((HEIGHT - NOTCH_LENGTH) / 2 - NOTCH_POS), (OUTER_FRAME + NOTCH_FRAME) / 2 + DELTA])
                cube([NOTCH_DEPTH + DELTA, NOTCH_LENGTH, OUTER_FRAME - NOTCH_FRAME], center = true);
            translate([+(WIDTH / 2 + BORDER - NOTCH_DEPTH / 2 + DELTA), -((HEIGHT - NOTCH_LENGTH) / 2 - NOTCH_POS), (OUTER_FRAME + NOTCH_FRAME) / 2 + DELTA])
                cube([NOTCH_DEPTH + DELTA, NOTCH_LENGTH, OUTER_FRAME - NOTCH_FRAME], center = true);
            translate([-(WIDTH / 2 + BORDER - NOTCH_DEPTH / 2 + DELTA), -((HEIGHT - NOTCH_LENGTH) / 2 - NOTCH_POS), (OUTER_FRAME + NOTCH_FRAME) / 2 + DELTA])
                cube([NOTCH_DEPTH + DELTA, NOTCH_LENGTH, OUTER_FRAME - NOTCH_FRAME], center = true);

            translate([WIDTH / 2 + BORDER - FRAME_SPRING - FRAME_HOLE / 2 + DELTA, +(FRAME_MID_HEIGHT / 4 + HEIGHT / 4 - NOTCH_POS / 2), 0])
                cube([FRAME_HOLE, (HEIGHT - FRAME_MID_HEIGHT) / 2 - NOTCH_POS, 2 * OUTER_FRAME + 10], center = true);
            translate([WIDTH / 2 + BORDER - FRAME_SPRING - FRAME_HOLE / 2 + DELTA, -(FRAME_MID_HEIGHT / 4 + HEIGHT / 4 - NOTCH_POS / 2), 0])
                cube([FRAME_HOLE, (HEIGHT - FRAME_MID_HEIGHT) / 2 - NOTCH_POS, 2 * OUTER_FRAME + 10], center = true);

            translate([WIDTH / 2 + BORDER - FRAME_SPRING / 2 , +((HEIGHT - FRAME_GAP) / 2 - NOTCH_POS), 0])
                cube([FRAME_SPRING + DELTA, FRAME_GAP, 2 * OUTER_FRAME + 10], center = true);
            translate([WIDTH / 2 + BORDER - FRAME_SPRING / 2 , -((HEIGHT - FRAME_GAP) / 2 - NOTCH_POS), 0])
                cube([FRAME_SPRING + DELTA, FRAME_GAP, 2 * OUTER_FRAME + 10], center = true);
        }

        HOLE_HEIGHT_SHIFT = (HEIGHT + 2 * BORDER + 2 * BUMP) / 2 - HOLE_POS;

        translate([-HOLE_DIST / 2, HOLE_HEIGHT_SHIFT, DEPTH / 2])
            difference() {
                roundedCube([HOLE_SURROUND_W + 2 * INNER_FRAME, HOLE_SURROUND_H + 2 * INNER_FRAME, DEPTH], CORNER_RADIUS, true, true);

                translate([0, 0, OUTER_FRAME / 2 + DELTA])
                    union() {
                        roundedCube([HOLE_SURROUND_W, HOLE_SURROUND_H, DEPTH - OUTER_FRAME], CORNER_RADIUS, true, true);
                        cylinder(r = HOLE_R, h = 2 * DEPTH + 10, center = true);
                    }
            }

        translate([HOLE_DIST / 2, HOLE_HEIGHT_SHIFT, DEPTH / 2])
            difference() {
                roundedCube([HOLE_SURROUND_W + 2 * INNER_FRAME, HOLE_SURROUND_H + 2 * INNER_FRAME, DEPTH], CORNER_RADIUS, true, true);

                translate([0, 0, OUTER_FRAME / 2 + DELTA])
                    union() {
                        roundedCube([HOLE_SURROUND_W, HOLE_SURROUND_H, DEPTH - OUTER_FRAME], CORNER_RADIUS, true, true);
                        cylinder(r = HOLE_R, h = 2 * DEPTH + 10, center = true);
                    }
            }

        translate([+(WIDTH / 2 + BORDER), +(HEIGHT / 2), OUTER_FRAME / 2])
            cylinder(r = BUMP, h = OUTER_FRAME, center = true);
        translate([-(WIDTH / 2 + BORDER), +(HEIGHT / 2), OUTER_FRAME / 2])
            cylinder(r = BUMP, h = OUTER_FRAME, center = true);
        translate([+(WIDTH / 2 + BORDER), -(HEIGHT / 2), OUTER_FRAME / 2])
            cylinder(r = BUMP, h = OUTER_FRAME, center = true);
        translate([-(WIDTH / 2 + BORDER), -(HEIGHT / 2), OUTER_FRAME / 2])
            cylinder(r = BUMP, h = OUTER_FRAME, center = true);

        translate([+(WIDTH / 2), +(HEIGHT / 2 + BORDER), OUTER_FRAME / 2])
            cylinder(r = BUMP, h = OUTER_FRAME, center = true);
        translate([-(WIDTH / 2), +(HEIGHT / 2 + BORDER), OUTER_FRAME / 2])
            cylinder(r = BUMP, h = OUTER_FRAME, center = true);
        translate([+(WIDTH / 2), -(HEIGHT / 2 + BORDER), OUTER_FRAME / 2])
            cylinder(r = BUMP, h = OUTER_FRAME, center = true);
        translate([-(WIDTH / 2), -(HEIGHT / 2 + BORDER), OUTER_FRAME / 2])
            cylinder(r = BUMP, h = OUTER_FRAME, center = true);
    }
}
