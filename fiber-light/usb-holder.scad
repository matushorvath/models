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
            USB_BOARD_X + 2 * USB_BOARD_CORNER_WALL + USB_BOARD_LATCH_EXTRA_X,
            USB_BOARD_Y + 2 * USB_BOARD_CORNER_WALL,
            USB_BOARD_BASE_WALL + USB_BOARD_Z + USB_BOARD_CORNER_WALL
        ], align = V_UP + V_RIGHT);

        // Cutout moved up by base plate thickness
        up(USB_BOARD_BASE_WALL - DELTA) {
            // Inside cutout
            right(USB_BOARD_CORNER_WALL)
                cuboid([USB_BOARD_X, USB_BOARD_Y, USB_BOARD_Z], align = V_UP + V_RIGHT);

            // Inside roof cutout, everywhere except the front two corners
            right(USB_BOARD_CORNER_LENGTH)
                cuboid([
                    USB_BOARD_X + USB_BOARD_CORNER_WALL - USB_BOARD_CORNER_LENGTH,
                    USB_BOARD_Y,
                    USB_BOARD_Z + USB_BOARD_CORNER_WALL + 2 * DELTA
                ], align = V_UP + V_RIGHT);

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
                    USB_BOARD_X + USB_BOARD_CORNER_WALL + DELTA,
                    USB_BOARD_Y + 2 * USB_BOARD_CORNER_WALL - 2 * USB_BOARD_CORNER_LENGTH,
                    USB_BOARD_Z + USB_BOARD_CORNER_WALL + 2 * DELTA
                ], align = V_UP + V_RIGHT);
        }

        // Space for solder
        up(USB_BOARD_BASE_WALL - USB_SOLDER_Z) {
            right(USB_BOARD_X + USB_BOARD_CORNER_WALL - USB_SOLDER_X)
                yspread(USB_BOARD_Y - USB_SOLDER_Y)
                    cuboid([USB_SOLDER_X, USB_SOLDER_Y, USB_SOLDER_Z + DELTA], align = V_UP + V_RIGHT);
        }
    }

    // Latch
    up(USB_BOARD_BASE_WALL + USB_BOARD_Z + USB_BOARD_LATCH_EXTRA_Z)
        right(USB_BOARD_X + USB_BOARD_CORNER_WALL + DELTA)
            prismoid(
                size1 = [USB_BOARD_LATCH_LENGTH_X, USB_BOARD_LATCH_LENGTH_Y],
                size2 = [0, USB_BOARD_LATCH_LENGTH_Y],
                shift = [USB_BOARD_LATCH_LENGTH_X / 2, 0],
                h = USB_BOARD_LATCH_LENGTH_Z,
                align = V_UP + V_LEFT
            );
}

// Plate width = base plate width + port offset from board
usb_plate_z = USB_BOARD_BASE_WALL + USB_PORT_OFFSET_Z + USB_PORT_Z + USB_PLATE_MARGIN_Z;

module port_plate() {
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

module port_mask_walls() {
    // Solid block beyond the plate, to be sculpted into walls around port_mask
    // TODO this doesn't correctly connect to port_plate, there is a gap
    down(USB_BOARD_PORT_WALL)
    cuboid([
        USB_MASK_X,
        USB_BOARD_Y + 2 * USB_BOARD_CORNER_WALL + 2 * USB_BOARD_PORT_WALL,
        usb_plate_z + 2 * USB_BOARD_PORT_WALL,
    ], align = V_UP + V_LEFT);
}

module port_mask() {
    // Reserve space beyond the plate, for the connector and cable
    right(DELTA)
        cuboid([
            USB_MASK_X,
            USB_BOARD_Y,
            usb_plate_z
        ], align = V_UP + V_LEFT);
}

usb_holder();
//#port_mask_walls();
