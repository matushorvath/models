include <common.scad>
use <MCAD/boxes.scad>

// Higher than BASE_MAX_Z + CORNER_RADIUS, for cutting purposes
base_top_z = BASE_MAX_Z + CORNER_RADIUS + DELTA;

// Rounded cube to be subtracted from the body to create edges
module diagonal_cut_rounded_cube(min_z, max_z, edge) {
    difference() {
        translate([edge, edge, min_z])
            roundedCube([
                BASE_X - 2 * edge,
                BASE_Y - 2 * edge,
                base_top_z
            ], CORNER_RADIUS - edge, true, false);

        // Diagonal cut
        // 1 -- 2   4 -- 5
        //   \  |     \  |
        //      0        3
        polyhedron(points = [
            [BASE_X + DELTA, 0 - DELTA, 0],
            [0 - DELTA, BASE_Y, 0],
            [BASE_X + DELTA, BASE_Y + DELTA, 0],
            [BASE_X + DELTA, 0 - DELTA, min_z],
            [0 - DELTA, BASE_Y + DELTA, min_z],
            [BASE_X + DELTA, BASE_Y + DELTA, max_z]
        ], faces = [
            // points must be clockwise
            [0, 2, 1],
            [3, 4, 5],
            [0, 1, 4, 3],
            [1, 2, 5, 4],
            [2, 0, 3, 5]
        ]);

        // TODO the cut is not smooth in the corners
    }
}

module body() {
    difference() {
        // Base body
        roundedCube([
            BASE_X,
            BASE_Y,
            base_top_z
        ], CORNER_RADIUS, false, false);

        // Base inside
        translate([EDGE_WIDTH, EDGE_WIDTH, BOTTOM_Z])
            roundedCube([
                BASE_X - 2 * EDGE_WIDTH,
                BASE_Y - 2 * EDGE_WIDTH,
                base_top_z
            ], CORNER_RADIUS - EDGE_WIDTH, false, false);

        // Base edge
        diagonal_cut_rounded_cube(BASE_MIN_Z - EDGE_Z, BASE_MAX_Z - EDGE_Z, EDGE_X);

        // Base cutoff
        diagonal_cut_rounded_cube(BASE_MIN_Z, BASE_MAX_Z, -DELTA);
    }
}

module stand_top() {
    difference() {
        // Stand body
        cylinder(SCREW_Z - BOTTOM_Z, d = SCREW_TOP_D1, true);

        // Top hole
        translate([0, 0, SCREW_Z - BOTTOM_Z - SCREW_TOP_HOLE_Z])
            cylinder(SCREW_TOP_HOLE_Z + DELTA, d = SCREW_TOP_D2, true);

        // Screw hole
        translate([0, 0, -DELTA])
            cylinder(SCREW_Z - BOTTOM_Z + 2 * DELTA, d = SCREW_TOP_D3, true);
    }
}

module stand_bottom_hole() {
    union() {
        // Shallow hole
        cylinder(SCREW_BOTTOM_HOLE_Z1 + DELTA, d = SCREW_BOTTOM_HOLE_D1, true);

        // Deep hole
        cylinder(SCREW_BOTTOM_HOLE_Z2 + DELTA, d = SCREW_BOTTOM_HOLE_D2, true);
    }
}

module vent_hole() {
    // Recess inside
    translate([VENT_HOLE_X, BASE_Y / 2, BOTTOM_Z - VENT_HOLE_Z])
        cylinder(VENT_HOLE_Z + DELTA, d = VENT_HOLE_D1, true);

    // Hole through
    translate([VENT_HOLE_X, BASE_Y / 2, - DELTA])
        cylinder(BOTTOM_Z + 2 * DELTA, d = VENT_HOLE_D2, true);
}

screws = [
    [(BASE_X - SCREW_DIST) / 2, (BASE_Y - SCREW_DIST) / 2],
    [(BASE_X - SCREW_DIST) / 2, (BASE_Y + SCREW_DIST) / 2],
    [(BASE_X + SCREW_DIST) / 2, (BASE_Y - SCREW_DIST) / 2],
    [(BASE_X + SCREW_DIST) / 2, (BASE_Y + SCREW_DIST) / 2],
];

ribs = [
    [BASE_X / 2, (BASE_Y - RIB_DIST) / 2],
    [BASE_X / 2, (BASE_Y + RIB_DIST) / 2],
    [(BASE_X - RIB_DIST) / 2, BASE_Y / 2],
    [(BASE_X + RIB_DIST) / 2, BASE_Y / 2],
];

difference() {
    union() {
        body();

        // Screw stands, top part
        for (pos = screws) {
            translate([pos[0], pos[1], BOTTOM_Z - DELTA])
                stand_top();
        }

        // Ribs
        for (pos = ribs) {
            translate([pos[0], pos[1], BOTTOM_Z - DELTA])
                cylinder(RIB_Z, d = RIB_D, true);
        }
    }

    // Screw stands, bottom part
    for (pos = screws) {
        translate([pos[0], pos[1], -DELTA])
            stand_bottom_hole();
    }

    // Vent hole
    vent_hole();
}
