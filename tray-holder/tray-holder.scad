//use <MCAD/boxes.scad>

$fa = 1;
$fs = .4;

h1 = 40;
w1 = 2; // zmesti sa do skary?
d1 = 30;

h2 = 3; // zarovnane s vyskou dresu?
w2 = 40; // sirka medzery medzi chladnickou a dresom?
d2 = d1;

hole_wall = 3;
hole_h = 10;

stick_h = 160; // kolko sa zmesti na dosku?
stick_w = 5;
stick_d = 15;

press_fit = 0;
tight_fit = .13;
normal_fit = .250;
loose_fit = .5;

delta = .01;

// w, d, h

// Fitting
fitting_translation = [
    w2 - (hole_wall + stick_w + hole_wall),
    (d2 - (hole_wall + stick_d + hole_wall)) / 2,
    h2
];

// Base
difference() {
    union() {
        // Vertical part of base
        translate([0, 0, -h1])
            cube([w1, d1, h1 + delta]);

        // Horizontal part of base
        cube([w2, d2, h2]);

        translate(fitting_translation)
            cube([
                hole_wall + stick_w + hole_wall,
                hole_wall + stick_d + hole_wall,
                hole_h
            ]);
    };

    // Hole
    translate(fitting_translation)
        translate([hole_wall, hole_wall, -(h2 + delta)])
            cube([stick_w, stick_d, h2 + hole_h + 2*delta]);
};

//import("hippo.stl");

// difference() {
//     union() {
//         translate([0, 0, 2.5])
//             roundedCube([25, 50, 5], 5, sidesonly=true, center=true);

//         // TODO make sure these overlap with the roundedCube, I think now they overlap 0.0005 may be too little
//         translate([0, 10, -0.5])
//             cylinder(1.001, d=5.8, center=true);
//         translate([0, -10, -0.5])
//             cylinder(1.001, d=5.8, center=true);
//     }
//     // TODO this is not 1cm, see below
//     translate([0, 10, -0.5])
//         cylinder(10.001, d=5, center=true);
// }
//     translate([0, 10, -0.5])
//         cylinder(10.001, d=5, center=true);
