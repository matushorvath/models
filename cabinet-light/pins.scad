include <common.scad>
include <BOSL/shapes.scad>

module pin() {
    pin_z = BASE_Z - BASE_WALL_Z + LPIN_Z - LOOSE_FIT;
    cyl(h = pin_z, r = LPIN_R, chamfer = LPIN_R / 2);
}

module hole() {
    translate([0, 0, BASE_Z / 2])
        cyl(h = BASE_Z, r = LPIN_R + TIGHT_FIT);
}

module holes() {
    translate([-LPIN_DX / 2, -LPIN_DY / 2, 0])
        hole();
    translate([-LPIN_DX / 2,  LPIN_DY / 2, 0])
        hole();
    translate([ LPIN_DX / 2, -LPIN_DY / 2, 0])
        hole();
    translate([ LPIN_DX / 2,  LPIN_DY / 2, 0])
        hole();
}

rotate(a = [0, 90, 90])
    pin();

//holes();
