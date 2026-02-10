include <common.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

use <shell.scad>
use <relay-holder.scad>
use <usb-holder.scad>

module move_usb_holder_to_position() {
    // Move to the correct place within the shell
    back(30) left(17)
        // Sink the bottom corners into the shell floor, to save space
        down(USB_BOARD_CORNER_WALL)
            // Orient the board correctly
            up(USB_BOARD_Y / 2 + USB_BOARD_CORNER_WALL + SHELL_WALL - DELTA) xrot(90)
                children();
}

module move_relay_holder_to_position() {
    // Move to the correct place within the shell
    forward(12)
        // Sink the holder floor into the shell floor, to save space
        up(SHELL_WALL - RELAY_WALL + DELTA)
            zrot(-90)
                children();
}

// Uncomment to print just the top interface
//top_half(z = TOTAL_HEIGHT - 6)
difference() {
    union() {
        shell(TOTAL_HEIGHT);

        // Intersect USB holder + the walls in front of the USB port with the shell
        intersection() {
            shell_mask(TOTAL_HEIGHT);
            move_usb_holder_to_position()
                usb_holder();
        }

        move_relay_holder_to_position()
            relay_holder();
    }

    // Cut off space in front of the USB port, where the cable and connector go
    move_usb_holder_to_position()
        port_mask();

    // Cut off access for the relay button
    move_relay_holder_to_position()
        relay_button_mask();
}

// Simulate the relay
// #forward(12) up(SHELL_WALL + RELAY_RISER_Z) union() {
//     cuboid([RELAY_BOARD_X, RELAY_BOARD_Y, RELAY_HEIGHT_Z], align = V_UP);
// }
