include <common.scad>

// Parameters:

// Z1, Z2, Z3:
//
// The space for the spring is divided into 3 parts, zone1, zone2, zone3
// --------------------
// Z3       XXXXXXXXX
// --------------------
// Z2     XXX
// --------------------
// Z1 XXXXX
// --------------------
// XXXXXXXXXXXXXXXXXXXX

// D: Depth of the part
// STR0L: Length of the middle straight part
// A1: Angle of the first bend
// XT: Total spring length

module angle(Z1, Z2, A1, D) {
    rotate_extrude(angle = A1)
        translate([Z2, 0])
            square([Z1, D]);
}

module spring(Z1, Z2, Z3, D, STR0L, A1, XT) {
    cube([STR0L, Z1, D]);

    translate([STR0L - DELTA, Z1 + Z2, 0])
        rotate(-90)
            angle(Z1, Z2, A1, D);

    // Translate the cube to attach to the angle above
    TR1X = Z2 * sin(A1);
    TR1Y = Z2 - Z2 * cos(A1);

    // Translate the second angle to attach it to the cube
    TR2Y = (Z1 + Z2) - (Z1 + Z2) * cos(A1);

    // Length of the first straight part is defined by the angle A1, to reach up to zone 3
    STR1L = (Z2 + Z3 - TR1Y - TR2Y) / sin(A1);

    TR2X = 2 * TR1X + STR1L * cos(A1) + Z1 * sin(A1);

    translate([STR0L + TR1X - 2 * DELTA, Z1 + TR1Y, 0])
        rotate(A1 - 90)
            cube([Z1, STR1L, D]);

    translate([STR0L + TR2X - 3 * DELTA, -Z2 + TR1Y + (Z2 + Z3 - TR1Y), 0])
        rotate(90)
            angle(Z1, Z2, A1, D);

    // Length of the second straight part to fith the overall length
    STR2L = XT - STR0L - TR2X;

    translate([STR0L + TR2X - 4 * DELTA, Z2 + Z3, 0])
        cube([STR2L, Z1, D]);
}

//spring(37, 22, 10, 8, 37, 25, 173);
