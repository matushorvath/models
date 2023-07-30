include <common.scad>

module slot(length, width) {
    rotate(a = [0, 90, 0])
        cylinder(h = length, d = width);
    translate([0, -width / 2, 0])
        cube([length, width, width / 2 + DELTA]);
}

bt_axis_d = BT_BOTTOM_D + BT_W1 / 2;
// MT axis happens to work out well at the same position
mt_axis_d = bt_axis_d;
// ST axis is adjusted to make top of the tool the same as MT tool
st_axis_d = bt_axis_d + MT_W1 / 2 - ST_W1 / 2;

// Calculate margins based on equal space distribution
tools_l = max(BT_L1 + BT_L2, MT_L1 + MT_L2, ST_L1 + ST_L2);
margin_l = (BOX_L1 - tools_l) / 2;

bt_shift_x = BOX_L1 - margin_l - (BT_L1 + BT_L2);
mt_shift_x = BOX_L1 - margin_l - (MT_L1 + MT_L2);
st_shift_x = BOX_L1 - margin_l - (ST_L1 + ST_L2);

tools_w = BT_W1 + MT_W2 + ST_W2;
margin_w = (BOX_W - tools_w) / 4;

bt_shift_y = margin_w + BT_W1 / 2;
mt_shift_y = margin_w + BT_W1 + margin_w + MT_W2 / 2;
st_shift_y = margin_w + BT_W1 + margin_w + MT_W2 + margin_w + ST_W2 / 2;

difference() {
    //translate([10, 0, 0])     // TODO remove
        cube([BOX_L1, BOX_W, BOX_D_BOTTOM]);

    // Big tool
    translate([bt_shift_x, bt_shift_y, bt_axis_d])
        slot(BT_L1, BT_W1);
    translate([bt_shift_x + BT_L1 - DELTA, bt_shift_y, bt_axis_d])
        slot(BT_L2, BT_W2);
    // TODO maybe a narrow part for the middle of the tool? to hold it in place

    // Medium tool
    translate([mt_shift_x, mt_shift_y, mt_axis_d])
        slot(MT_L1, MT_W1);
    translate([mt_shift_x + MT_L1 - DELTA, mt_shift_y, mt_axis_d])
        slot(MT_L2, MT_W2);

    // Small tool
    translate([st_shift_x, st_shift_y, st_axis_d])
        slot(ST_L1, ST_W1);
    translate([st_shift_x + ST_L1 - DELTA, st_shift_y, st_axis_d])
        slot(ST_L2, ST_W2);

    // Cutout for removal
    cutout_d = min(mt_axis_d - MT_W1 / 2, st_axis_d - ST_W1 / 2);
    translate([margin_l + CUTOUT_SHIFT_X, margin_w, cutout_d - DELTA])
        cube([CUTOUT_L, BOX_W - margin_w * 2, BOX_D_BOTTOM - cutout_d + 2 * DELTA]);

    // TODO blade space; add space for extra blades as well; maybe slots? deep narrow holes (but how to remove) or blade-sized holes
}

// Supports under the blade
union() {
    bt_support_x = bt_shift_x + BT_L1 + BT_L2 - BT_BLADE_L;
    mt_support_x = mt_shift_x + MT_L1 + MT_L2 - MT_BLADE_L;
    st_support_x = st_shift_x + ST_L1 + ST_L2 - ST_BLADE_L;
    support_x = max(bt_support_x, mt_support_x, st_support_x);

    bt_z3 = bt_axis_d - BT_BLADE_D / 2;
    translate([support_x + SUPPORT_L / 2 + DELTA, bt_shift_y, bt_z3 / 2 + DELTA])
        cube([SUPPORT_L, BT_W2 + 2 * DELTA, bt_z3], center = true);

    mt_z3 = mt_axis_d - MT_BLADE_D / 2;
    translate([support_x + SUPPORT_L / 2 + DELTA, mt_shift_y, mt_z3 / 2 + DELTA])
        cube([SUPPORT_L, MT_W2 + 2 * DELTA, mt_z3], center = true);

    st_z3 = st_axis_d - ST_BLADE_D / 2;
    translate([support_x + SUPPORT_L / 2 + DELTA, st_shift_y, st_z3 / 2 + DELTA])
        cube([SUPPORT_L, ST_W2 + 2 * DELTA, st_z3], center = true);
}

// TODO space to keep the wooden extra parts
// TODO notches to locate the insert in existing box notches

// TODO split the insert into two parts, max 160 mm
