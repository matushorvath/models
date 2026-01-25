include <common.scad>
include <BOSL/shapes.scad>

module plate(plate_x, plate_y, plate_z, plate_conn_x, plate_conn_y, plate_screw_dist, plate_screw_d) {
    difference() {
        // Base
        cuboid(
            size = [plate_x, plate_y, plate_z],
            fillet = plate_y / 2,
            edges = EDGES_Z_ALL
        );

        // Connector hole
        cuboid(
            size = [plate_conn_x, plate_conn_y, plate_z + DELTA]
        );

        // Screw holes
        translate([-plate_screw_dist / 2, 0, 0])
        cyl(
            d = plate_screw_d,
            h = plate_z + DELTA
        );

        translate([plate_screw_dist / 2, 0, 0])
        cyl(
            d = plate_screw_d,
            h = plate_z + DELTA
        );
    }
}
