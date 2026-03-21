include <common.scad>
include <body_details.scad>
include <body_dimensions.scad>
include <body_planes.scad>
include <BOSL2/std.scad>

// TODO texture = "rough" for both body shapes?

module body_xy() {
    diff()

    linear_sweep(
        body_xy_plane(),
        center = true,
        height = 2 * max(YZ_BOTTOM_HALF),
        orient = UP
    )

    show_anchors()

    {
        // TODO notes
        // edge 11 is cleared by XZ mask
        // edge 1 should have different than 90 degree angle, but perhaps it works automatically, check
        // side edges also get partially cleared, we probably need to apply this to the finalized body to make it look right
        // keyboard/screen fillet does not work with the mask, probably needs to be handled explicitly or with masks with angled end caps
        // make this optional since it's very slow
        for (i = [1 : 11]) {
            attach(str("top_edge", i), FRONT+LEFT, inside=true)
                rounding_edge_mask(l = $edge_length, r = 10);
            attach(str("bot_edge", i), FRONT+LEFT, inside=true)
                rounding_edge_mask(l = $edge_length, r = 10);
        }

        attach("edge1", FRONT+LEFT, inside=true)
            rounding_edge_mask(l = $edge_length, r = 10);
        attach("edge12", FRONT+LEFT, inside=true)
            rounding_edge_mask(l = $edge_length, r = 10);
    }
}

module body_yz_half() {
    profiles = [
        body_yz_half_plane(YZ_TOP_HALF[0], YZ_BOTTOM_HALF[0], BODY_Y, YZ_TOP_CORNER_R, YZ_CURVE_X000),
        body_yz_half_plane(YZ_TOP_HALF[1], YZ_BOTTOM_HALF[1], BODY_Y, YZ_TOP_CORNER_R, YZ_CURVE_X050),
        body_yz_half_plane(YZ_TOP_HALF[2], YZ_BOTTOM_HALF[2], BODY_Y, YZ_TOP_CORNER_R, YZ_CURVE_X100),
        body_yz_half_plane(YZ_TOP_HALF[3], YZ_BOTTOM_HALF[3], BODY_Y, YZ_TOP_CORNER_R, YZ_CURVE_X150),
        body_yz_half_plane(YZ_TOP_HALF[4], YZ_BOTTOM_HALF[4], BODY_Y, YZ_TOP_CORNER_R, YZ_CURVE_X200),
        body_yz_half_plane(YZ_TOP_HALF[5], YZ_BOTTOM_HALF[5], BODY_Y, YZ_TOP_CORNER_R, YZ_CURVE_X250),
        body_yz_half_plane(YZ_TOP_HALF[6], YZ_BOTTOM_HALF[6], BODY_Y, YZ_TOP_CORNER_R, YZ_CURVE_X300),
        body_yz_half_plane(YZ_TOP_HALF[7], YZ_BOTTOM_HALF[7], BODY_Y, YZ_TOP_CORNER_R, YZ_CURVE_X350),
        body_yz_half_plane(YZ_TOP_HALF[8], YZ_BOTTOM_HALF[8], BODY_Y, YZ_TOP_CORNER_R, YZ_CURVE_X400),
        // TODO decide depth of the model
    ];

    skin(
        profiles,
        z = YZ_X,
        slices = 20,
        orient = RIGHT
    );
}

module body_yz() {
    union() {
        body_yz_half();
        zflip() body_yz_half();
    }
}

module body() {
    difference() {
        intersection() {
            body_xy();
            body_yz();
        };

        kbd_fwd_corners_mask();
    };
}

xrot(90) // orient the model for easy viewing in OpenSCAD
    body();
//body_xy();
//body_yz();