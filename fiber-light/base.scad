include <common.scad>

use <shell.scad>
use <usb-holder.scad>

%shell(TOTAL_HEIGHT);

// Move the board to location
back(30) left(17)
    // Orient the board correctly
    up(USB_BOARD_Y / 2 + USB_BOARD_CORNER_WALL + SHELL_WALL - DELTA) xrot(90)
        usb_holder();

//port_mask
