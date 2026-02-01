include <common.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

module usb_holder() {
    port_plate();

    right(USB_PLATE_X - USB_BOARD_CORNER_WALL + DELTA)
        retainers();
}

module retainers() {
    difference() {
        // The holder is carved out of this box
        cuboid([
            USB_BOARD_X + 2 * USB_BOARD_CORNER_WALL,
            USB_BOARD_Y + 2 * USB_BOARD_CORNER_WALL,
            USB_BOARD_BASE_WALL + USB_BOARD_Z + USB_BOARD_CORNER_WALL
        ], align = V_UP + V_RIGHT);

        // Cutout moved up by base plate thickness
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

    // Pins moved up by base plate thickness
    up(USB_BOARD_BASE_WALL - DELTA)
        yflip_copy()
            move([PIN_X, USB_BOARD_Y / 2 - PIN_Y, 0])
                cylinder(h = USB_BOARD_Z, d = PIN_D);
}

// Plate width = base plate width + port offset from board
usb_plate_z = USB_BOARD_BASE_WALL + USB_PORT_OFFSET_Z + USB_PORT_Z + USB_PLATE_MARGIN_Z;

module port_plate() {
    // // Up by half height + measured offset of the USB port from board bottom
    // up(USB_BOARD_BASE_WALL + USB_PORT_OFFSET_Y + USB_PORT_Y / 2)
    //     zrot(90) xrot(-90)

    difference() {
        // Plate body
        cuboid([
            USB_PLATE_X,
            USB_BOARD_Y + 2 * USB_BOARD_CORNER_WALL,
            usb_plate_z
        ], align = V_UP + V_RIGHT);

        // Port opening
        up(USB_BOARD_BASE_WALL + USB_PORT_OFFSET_Z) left(DELTA)
            cuboid([
                USB_PLATE_X + 2 * DELTA,
                USB_PORT_Y,
                USB_PORT_Z
            ], edges = EDGES_X_ALL, fillet = USB_PORT_Z / 2, align = V_UP + V_RIGHT);
    }
}

module port_mask() {
    // Reserve space beyond the plate, for the connector and cable
    cuboid([
        USB_MASK_X,
        // Don't worry about 2 * USB_BOARD_CORNER_WALL, it complicates sinking the board holder into the shell base
        // This mask should be smaller anyway, just enough for the connector to fit
        // Then the board could probably move closer to the edge of the shell (by USB_PLATE_X)
        USB_BOARD_Y,
        usb_plate_z
    ], align = V_UP + V_LEFT);
}

usb_holder();
