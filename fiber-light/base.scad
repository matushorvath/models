include <common.scad>
include <BOSL/shapes.scad>
include <BOSL/transforms.scad>

use <shell.scad>
use <relay-holder.scad>
use <usb-holder.scad>

module moveUsbHolderToPosition() {
    // Move to the correct place within the shell
    back(30) left(17)
        // Sink the bottom corners into the shell floor, to save space
        down(USB_BOARD_CORNER_WALL)
            // Orient the board correctly
            up(USB_BOARD_Y / 2 + USB_BOARD_CORNER_WALL + SHELL_WALL - DELTA) xrot(90)
                children();
}

module moveRelayHolderToPosition() {
    // Move to the correct place within the shell
    forward(12)
        // Sink the holder floor into the shell floor, to save space
        up(SHELL_WALL - RELAY_WALL + DELTA)
            zrot(-90)
                children();
}

difference() {
    union() {
        shell(TOTAL_HEIGHT);

        moveUsbHolderToPosition()
            usb_holder();

        moveRelayHolderToPosition()
            relay_holder();
    }

    // Cut off space in front of the USB port, where the cable and connector go
    moveUsbHolderToPosition()
        port_mask();

    // Cut off access for the relay button
    moveRelayHolderToPosition()
        relay_button_mask();
}

// Simulate the relay
// forward(12) up(SHELL_WALL + RELAY_RISER_Z) union() {
//     cuboid([RELAY_BOARD_X, RELAY_BOARD_Y, RELAY_HEIGHT_Z], align = V_UP);
// }

// TODO the USB connector cutoff needs walls
// TODO also it should be moved left a bit more, except then the corner likely pokes out of shell
// TODO basically make a walled cutoff shape as a hollow cuboid, intersect that cuboid with full a shell-shaped mask, intersect the final shape with the masked hollow cuboid
// TODO consider a hole on bottom for the on/off switch on the relay module
