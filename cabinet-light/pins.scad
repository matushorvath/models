include <common.scad>
include <BOSL/shapes.scad>

module pin() {
    translate([0, 0, LPIN_Z/2])
        cyl(h=LPIN_Z, r=LPIN_R, chamfer2=LPIN_R/2);
}

module pins() {
    translate([-LPIN_DX/2, -LPIN_DY/2, 0])
        pin();
    translate([-LPIN_DX/2,  LPIN_DY/2, 0])
        pin();
    translate([ LPIN_DX/2, -LPIN_DY/2, 0])
        pin();
    translate([ LPIN_DX/2,  LPIN_DY/2, 0])
        pin();
}

pins();