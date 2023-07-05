include <common.scad>
use <MCAD/boxes.scad>

// Higher than BASE_MAX_Z + CORNER_RADIUS, for cutting purposes
base_top_z = BASE_MAX_Z + CORNER_RADIUS + DELTA;

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

        // Horizontal base cut
        translate([0, 0, BASE_MIN_Z])
            linear_extrude(height = base_top_z)
                polygon(points = [
                    [0, 0], [BASE_X, 0], [0, BASE_Y]
                ]);

        // Diagonal base cut
        // 1 -- 2   4 -- 5
        //   \  |     \  |
        //      0        3
        polyhedron(points = [
            [BASE_X + DELTA, 0 - DELTA, BASE_MIN_Z],
            [0 - DELTA, BASE_Y + DELTA, BASE_MIN_Z],
            [BASE_X + DELTA, BASE_Y + DELTA, BASE_MAX_Z],
            [BASE_X + DELTA, 0 - DELTA, base_top_z],
            [0 - DELTA, BASE_Y, base_top_z],
            [BASE_X + DELTA, BASE_Y + DELTA, base_top_z]
        ], faces = [
            // points must be clockwise
            [0, 2, 1],
            [3, 4, 5],
            [0, 1, 4, 3],
            [1, 2, 5, 4],
            [2, 0, 3, 5]
        ]);
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

screws = [
    [(BASE_X - SCREW_DIST) / 2, (BASE_Y - SCREW_DIST) / 2],
    [(BASE_X - SCREW_DIST) / 2, (BASE_Y + SCREW_DIST) / 2],
    [(BASE_X + SCREW_DIST) / 2, (BASE_Y - SCREW_DIST) / 2],
    [(BASE_X + SCREW_DIST) / 2, (BASE_Y + SCREW_DIST) / 2],
];

difference() {
    union() {
        body();

        // Screw stands, top part
        for (pos = screws) {
            translate([pos[0], pos[1], BOTTOM_Z - DELTA])
                stand_top();
        }
    }

    // Screw stands, bottom part
    for (pos = screws) {
        translate([pos[0], pos[1], -DELTA])
            stand_bottom_hole();
    }
}

// TODO edges, ribs, hole