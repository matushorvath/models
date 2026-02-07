include <common.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

difference() {
    union() {
        cyl(h = BULB_BIG_Z, d = BULB_HOLDER_D, align = V_UP);
        cyl(h = BULB_BIG_Z + BULB_SMALL_Z, d = BULB_OUT_D, align = V_UP);
    }

    down(DELTA)
        cyl(h = BULB_BIG_Z + BULB_SMALL_Z + 2 * DELTA, d = BULB_IN_D, align = V_UP);
}

module friction_element(d, hramp, hbody) {
    // Bottom ramp
    cyl(h = hramp + DELTA, d1 = 0, d2 = d, align = V_UP, $fs = .01);
    // Body
    up(hramp) cyl(h = hbody + DELTA, d = d, align = V_UP, $fs = .01);
    // Top ramp
    up(hramp + hbody) cyl(h = hramp, d1 = d, d2 = 0, align = V_UP, $fs = .01);
}

// Inner hole friction elements
zring(n = 4, r = BULB_IN_D / 2 - BULB_FRICTION_D / 4)
    up(BULB_FRICTION_MARGIN_Z)
        friction_element(
            hramp = BULB_FRICTION_RAMP_Z,
            hbody = BULB_BIG_Z + BULB_SMALL_Z - 2 * BULB_FRICTION_MARGIN_Z - 2 * BULB_FRICTION_RAMP_Z,
            d = BULB_FRICTION_D,
            align = V_UP, $fs = .01);

// Outer hole friction elements
zring(n = 6, r = BULB_OUT_D / 2 + BULB_FRICTION_D / 4)
    up(BULB_FRICTION_MARGIN_Z)
        friction_element(
            hramp = BULB_FRICTION_RAMP_Z,
            hbody = BULB_BIG_Z + BULB_SMALL_Z - 2 * BULB_FRICTION_MARGIN_Z - 2 * BULB_FRICTION_RAMP_Z,
            d = BULB_FRICTION_D,
            align = V_UP, $fs = .01);
