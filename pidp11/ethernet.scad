include <common.scad>
include <BOSL/shapes.scad>

module pin() {
    pin_z = BASE_Z - BASE_WALL_Z + LPIN_Z - LPIN_Z_FIT;
    cyl(h = pin_z, r = LPIN_R, chamfer = LPIN_R / 2);
}

module pin_hole() {
    pin_hole_z = BASE_Z - BASE_WALL_Z;
    translate([0, 0, -pin_hole_z / 2 + DELTA])
        cyl(h = pin_hole_z, r = LPIN_R + LPIN_R_FIT);
}

module pin_holes() {
    translate([-LPIN_DX / 2, -LPIN_DY / 2, 0])
        pin_hole();
    translate([-LPIN_DX / 2,  LPIN_DY / 2, 0])
        pin_hole();
    translate([ LPIN_DX / 2, -LPIN_DY / 2, 0])
        pin_hole();
    translate([ LPIN_DX / 2,  LPIN_DY / 2, 0])
        pin_hole();
}

//pin_holes();
rotate(a = [0, 90, 90])
    pin();
