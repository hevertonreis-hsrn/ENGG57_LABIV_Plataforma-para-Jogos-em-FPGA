#include <io.h>
#include <system.h>

// Master Interface register offsets (in bytes)
#define REG_BG_WIDTH        0   // Background width (e.g., 1920)
#define REG_BG_HEIGHT       4   // Background height (e.g., 1440)
#define REG_OFFSET_X        8   // Horizontal offset
#define REG_OFFSET_Y        12   // Vertical offset
#define REG_OFFSET_START    16   // Trigger configuration latch (write '1')

// Display dimensions
#define BG_WIDTH            1920
#define BG_HEIGHT           1440

// Viewport size (visible region)
#define VIEW_WIDTH          640
#define VIEW_HEIGHT         480

int main() {
	int offset_x = 0;
	int offset_y = 0;
	int last_btn = 0;

	// Initial setup: send full BG dimensions and latch config
	IOWR_32DIRECT(MASTER_INTERFACE_BASE, REG_BG_WIDTH, BG_WIDTH);
	IOWR_32DIRECT(MASTER_INTERFACE_BASE, REG_BG_HEIGHT, BG_HEIGHT);
	IOWR_32DIRECT(MASTER_INTERFACE_BASE, REG_OFFSET_START, 1);

    while (1) {
        int btns = IORD_32DIRECT(KEY_BASE, 0);

        // Trigger only on edge (change from last state)
		if (btns != last_btn) {
			if ((btns & 0x02) != 0) {  // Button 0: move right
				if (offset_x + VIEW_WIDTH < BG_WIDTH)
					offset_x += 10;
			}
			if ((btns & 0x01) != 0) {  // Button 1: move left
				if (offset_x >= 10)
					offset_x -= 10;
			}
			if ((btns & 0x04) != 0) {  // Button 2: move down
				if (offset_y + VIEW_HEIGHT < BG_HEIGHT)
					offset_y += 10;
			}
			if ((btns & 0x08) != 0) {  // Button 3: move up
				if (offset_y >= 10)
					offset_y -= 10;
			}

			// Send updated offsets to Master Interface
			IOWR_32DIRECT(MASTER_INTERFACE_BASE, REG_OFFSET_X, offset_x);
			IOWR_32DIRECT(MASTER_INTERFACE_BASE, REG_OFFSET_Y, offset_y);
		}

        last_btn = btns;
    }

    return 0;
}
