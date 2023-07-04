include <common.scad>
use <MCAD/boxes.scad>

// Higher than BASE_MAX_Z + CORNER_RADIUS, for cutting purposes
base_top_z = BASE_MAX_Z + CORNER_RADIUS + DELTA;

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
