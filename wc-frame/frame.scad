include <common.scad>
use <spring.scad>
use <MCAD/boxes.scad>

module frame() {
    difference() {
        union() {
            difference() {
                union() {
                    translate([-SPRING_Z3 / 2, 0, OUTER_FRAME / 2 - DELTA])
                        roundedCube([WIDTH + 2 * BORDER - SPRING_Z3, HEIGHT + 2 * BORDER, OUTER_FRAME], CORNER_RADIUS, true, true);
                    translate([0, 0, DEPTH / 2])
                        roundedCube([WIDTH, HEIGHT, DEPTH], CORNER_RADIUS, true, true);
                }

                roundedCube([WIDTH - 2 * INNER_FRAME, HEIGHT - 2 * INNER_FRAME, 2 * DEPTH + 10], CORNER_RADIUS, true, true);

                // Hole for the springs
                translate([WIDTH / 2 + BORDER - (SPRING_Z1 + SPRING_Z2 + SPRING_Z3) / 2 + DELTA, 0, 0])
                    cube([SPRING_Z1 + SPRING_Z2 + SPRING_Z3, HEIGHT - 2 * NOTCH_POS, 2 * OUTER_FRAME + 10], center = true);
            }

            HOLE_HEIGHT_SHIFT = (HEIGHT + 2 * BORDER + 2 * BUMP) / 2 - HOLE_POS;

            // Screw holes
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

            // Bumps
            translate([-(WIDTH / 2 + BORDER), +(HEIGHT / 2), OUTER_FRAME / 2])
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

            // Springs
            translate([WIDTH / 2 + BORDER - (SPRING_Z1 + SPRING_Z2 + SPRING_Z3) - DELTA, +DELTA, 0])
                rotate(-90)
                    spring(SPRING_Z1, SPRING_Z2, SPRING_Z3, OUTER_FRAME, SPRING_MID_HEIGHT, SPRING_ANGLE, SPRING_TOTAL_HEIGHT);

            mirror([0, 1, 0])
                translate([WIDTH / 2 + BORDER - (SPRING_Z1 + SPRING_Z2 + SPRING_Z3) - DELTA, +DELTA, 0])
                    rotate(-90)
                        spring(SPRING_Z1, SPRING_Z2, SPRING_Z3, OUTER_FRAME, SPRING_MID_HEIGHT, SPRING_ANGLE, SPRING_TOTAL_HEIGHT);
        }

        // Notches
        translate([+(WIDTH / 2 + BORDER - NOTCH_DEPTH / 2), +((HEIGHT - NOTCH_LENGTH) / 2 - NOTCH_POS), (OUTER_FRAME + NOTCH_FRAME) / 2 + DELTA])
            cube([NOTCH_DEPTH + 3 * DELTA, NOTCH_LENGTH, OUTER_FRAME - NOTCH_FRAME], center = true);
        translate([-(WIDTH / 2 + BORDER - NOTCH_DEPTH / 2), +((HEIGHT - NOTCH_LENGTH) / 2 - NOTCH_POS), (OUTER_FRAME + NOTCH_FRAME) / 2 + DELTA])
            cube([NOTCH_DEPTH + 3 * DELTA, NOTCH_LENGTH, OUTER_FRAME - NOTCH_FRAME], center = true);
        translate([+(WIDTH / 2 + BORDER - NOTCH_DEPTH / 2), -((HEIGHT - NOTCH_LENGTH) / 2 - NOTCH_POS), (OUTER_FRAME + NOTCH_FRAME) / 2 + DELTA])
            cube([NOTCH_DEPTH + 3 * DELTA, NOTCH_LENGTH, OUTER_FRAME - NOTCH_FRAME], center = true);
        translate([-(WIDTH / 2 + BORDER - NOTCH_DEPTH / 2), -((HEIGHT - NOTCH_LENGTH) / 2 - NOTCH_POS), (OUTER_FRAME + NOTCH_FRAME) / 2 + DELTA])
            cube([NOTCH_DEPTH + 3 * DELTA, NOTCH_LENGTH, OUTER_FRAME - NOTCH_FRAME], center = true);
    }
}
