use <MCAD/boxes.scad>

$fa = 1;
$fs = 0.4;

difference() {
    union() {
        translate([0, 0, 2.5])
            roundedCube([25, 50, 5], 5, sidesonly=true, center=true);

        // TODO make sure these overlap with the roundedCube, I think now they overlap 0.0005 may be too little
        translate([0, 10, -0.5])
            cylinder(1.001, d=5.8, center=true);
        translate([0, -10, -0.5])
            cylinder(1.001, d=5.8, center=true);
    }
    // TODO this is not 1cm, see below
    translate([0, 10, -0.5])
        cylinder(10.001, d=5, center=true);
}
    translate([0, 10, -0.5])
        cylinder(10.001, d=5, center=true);
