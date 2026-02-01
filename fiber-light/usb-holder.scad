include <common.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

module usb_holder() {
    retainers();

    // Up by half height + measured offset of the USB port from board bottom
    up(USB_PORT_OFFSET_Y + USB_PORT_Y / 2)
        zrot(90) xrot(-90)
            port_plate();

    base_plate();
}

module retainers() {
    difference() {
        // The holder is carved out of this box
        cuboid([
            USB_BOARD_X + 2 * USB_BOARD_CORNER_WALL,
            USB_BOARD_Y + 2 * USB_BOARD_CORNER_WALL,
            USB_BOARD_BASE_WALL + USB_BOARD_Z + USB_BOARD_CORNER_WALL
        ], align = V_UP + V_RIGHT);

        up(USB_BOARD_BASE_WALL - DELTA) {
            // Inside cutout
            right(USB_BOARD_CORNER_WALL) {
                cuboid([USB_BOARD_X, USB_BOARD_Y, USB_BOARD_Z], align = V_UP + V_RIGHT);

            // Inside roof cutout, everywhere except the front two corners
            right(USB_BOARD_CORNER_LENGTH)
                cuboid([
                    USB_BOARD_X - USB_BOARD_CORNER_LENGTH,
                    USB_BOARD_Y,
                    USB_BOARD_Z + USB_BOARD_CORNER_WALL + 2 * DELTA
                ], align = V_UP + V_RIGHT);
            }

            // Long side cutout
            right(USB_BOARD_CORNER_LENGTH)
                cuboid([
                    USB_BOARD_X + 2 * USB_BOARD_CORNER_WALL - 2 * USB_BOARD_CORNER_LENGTH,
                    USB_BOARD_Y + 2 * USB_BOARD_CORNER_WALL + 2 * DELTA,
                    USB_BOARD_Z + USB_BOARD_CORNER_WALL + 2 * DELTA
                ], align = V_UP + V_RIGHT);

            // Short side cutout
            left(DELTA)
                cuboid([
                    USB_BOARD_X + 2 * USB_BOARD_CORNER_WALL + 2 * DELTA,
                    USB_BOARD_Y + 2 * USB_BOARD_CORNER_WALL - 2 * USB_BOARD_CORNER_LENGTH,
                    USB_BOARD_Z + USB_BOARD_CORNER_WALL + 2 * DELTA
                ], align = V_UP + V_RIGHT);
        }
    }

    // Pins
    yflip_copy()
        move([PIN_X, USB_BOARD_Y / 2 - PIN_Y, 0])
            cylinder(h = USB_BOARD_Z, d = PIN_D);
}

module port_plate() {
    difference() {
        // Plate body
        cuboid([
            USB_PORT_X + 2 * USB_PORT_MARGIN_X,
            USB_PORT_Y + 2 * USB_PORT_MARGIN_Y,
            USB_PLATE_Z
        ], align = V_UP);

        // Port opening
        down(DELTA)
            cuboid(
                [USB_PORT_X, USB_PORT_Y, USB_PLATE_Z + 2 * DELTA],
                edges = EDGES_Z_ALL,
                fillet = USB_PORT_Y / 2,
                align = V_UP
            );
    }
}

module port_mask() {
    // Reserve space beyond the plate, for the connector and cable
    cuboid([
            USB_PORT_X + 2 * USB_PORT_MARGIN_X,
            USB_PORT_Y + 2 * USB_PORT_MARGIN_Y,
            USB_MASK_Z
        ], align = V_UP);
}

// TODO connector - plate between the roofed corners + connector hole + correct depth for the hole/plate

usb_holder();
