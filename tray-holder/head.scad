include <common.scad>;

// Head
difference() {
    union () {
        translate([0, 0, HEAD_H / 2 + 1])   // the head isn't exactly HEAD_H high, so +1
            rotate(-90)
                resize([0, HEAD_H, 0], auto=[true, true, true])
                    import("hippo.stl");
            // cube([HEAD_H + 2, HEAD_H + 2, HEAD_H + 2], center=true);
    }

    hole_extra = 10; // to be sure the hole reaches beyond the STL model
    translate([0, 0, HEAD_BEVEL_H / 2 - hole_extra])
        cube([STICK_W, STICK_D, HEAD_BEVEL_H + hole_extra], center=true);
}
