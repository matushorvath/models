use <glue_base.scad>
use <pins.scad>
include <common.scad>

module placed_pin() {
    translate([0, 0, LPIN_R])
        rotate(a = [0, 90, 90])
            pin();
}

translate([11, -10, 0])
    placed_pin();
translate([11,  10, 0])
    placed_pin();
translate([16, -10, 0])
    placed_pin();
translate([16,  10, 0])
    placed_pin();

rotate(a = [0, 0, 90])
    glue_base();