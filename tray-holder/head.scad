include <common.scad>;

// w, d, h

// Head
difference() {
    union () {
        translate([0, 0, head_h / 2 + 1])   // the head isn't exactly head_h high, so +1
            rotate(-90)
                resize([0, head_h, 0], auto=[true, true, true])
                    import("../../hippo/hippo.stl");
            // cube([head_h + 2, head_h + 2, head_h + 2], center=true);
    }

    hole_extra = 10; // to be sure the hole reaches beyond the STL model
    translate([0, 0, head_hole_h / 2 - hole_extra])
        cube([stick_w, stick_d, head_hole_h + hole_extra], center=true);
}
