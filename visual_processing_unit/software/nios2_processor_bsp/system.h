/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'processor' in SOPC Builder design 'embedded_vpu'
 * SOPC Builder design path: ../../embedded_vpu.sopcinfo
 *
 * Generated: Mon Jul 14 22:12:56 BRT 2025
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x08220020
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 100000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1c
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x08210020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 100000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x1c
#define ALT_CPU_NAME "processor"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x08210000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x08220020
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 100000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x1c
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x08210020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x1c
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x08210000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_NIOS2_GEN2
#define __BACKGROUND_LOADER
#define __COMPOSER


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/null"
#define ALT_STDERR_BASE 0x0
#define ALT_STDERR_DEV null
#define ALT_STDERR_TYPE ""
#define ALT_STDIN "/dev/null"
#define ALT_STDIN_BASE 0x0
#define ALT_STDIN_DEV null
#define ALT_STDIN_TYPE ""
#define ALT_STDOUT "/dev/null"
#define ALT_STDOUT_BASE 0x0
#define ALT_STDOUT_DEV null
#define ALT_STDOUT_TYPE ""
#define ALT_SYSTEM_NAME "embedded_vpu"


/*
 * background_loader configuration
 *
 */

#define ALT_MODULE_CLASS_background_loader background_loader
#define BACKGROUND_LOADER_BASE 0x8200000
#define BACKGROUND_LOADER_IRQ -1
#define BACKGROUND_LOADER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define BACKGROUND_LOADER_NAME "/dev/background_loader"
#define BACKGROUND_LOADER_SPAN 1024
#define BACKGROUND_LOADER_TYPE "background_loader"


/*
 * composer configuration
 *
 */

#define ALT_MODULE_CLASS_composer composer
#define COMPOSER_BASE 0x8200400
#define COMPOSER_IRQ -1
#define COMPOSER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define COMPOSER_NAME "/dev/composer"
#define COMPOSER_SPAN 1024
#define COMPOSER_TYPE "composer"


/*
 * gamepad_pins configuration
 *
 */

#define ALT_MODULE_CLASS_gamepad_pins altera_avalon_pio
#define GAMEPAD_PINS_BASE 0x8900000
#define GAMEPAD_PINS_BIT_CLEARING_EDGE_REGISTER 0
#define GAMEPAD_PINS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define GAMEPAD_PINS_CAPTURE 0
#define GAMEPAD_PINS_DATA_WIDTH 12
#define GAMEPAD_PINS_DO_TEST_BENCH_WIRING 0
#define GAMEPAD_PINS_DRIVEN_SIM_VALUE 0
#define GAMEPAD_PINS_EDGE_TYPE "NONE"
#define GAMEPAD_PINS_FREQ 100000000
#define GAMEPAD_PINS_HAS_IN 1
#define GAMEPAD_PINS_HAS_OUT 0
#define GAMEPAD_PINS_HAS_TRI 0
#define GAMEPAD_PINS_IRQ -1
#define GAMEPAD_PINS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define GAMEPAD_PINS_IRQ_TYPE "NONE"
#define GAMEPAD_PINS_NAME "/dev/gamepad_pins"
#define GAMEPAD_PINS_RESET_VALUE 0
#define GAMEPAD_PINS_SPAN 16
#define GAMEPAD_PINS_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * new_frame_irq configuration
 *
 */

#define ALT_MODULE_CLASS_new_frame_irq altera_avalon_pio
#define NEW_FRAME_IRQ_BASE 0x8910000
#define NEW_FRAME_IRQ_BIT_CLEARING_EDGE_REGISTER 0
#define NEW_FRAME_IRQ_BIT_MODIFYING_OUTPUT_REGISTER 0
#define NEW_FRAME_IRQ_CAPTURE 1
#define NEW_FRAME_IRQ_DATA_WIDTH 1
#define NEW_FRAME_IRQ_DO_TEST_BENCH_WIRING 0
#define NEW_FRAME_IRQ_DRIVEN_SIM_VALUE 0
#define NEW_FRAME_IRQ_EDGE_TYPE "RISING"
#define NEW_FRAME_IRQ_FREQ 100000000
#define NEW_FRAME_IRQ_HAS_IN 1
#define NEW_FRAME_IRQ_HAS_OUT 0
#define NEW_FRAME_IRQ_HAS_TRI 0
#define NEW_FRAME_IRQ_IRQ 0
#define NEW_FRAME_IRQ_IRQ_INTERRUPT_CONTROLLER_ID 0
#define NEW_FRAME_IRQ_IRQ_TYPE "EDGE"
#define NEW_FRAME_IRQ_NAME "/dev/new_frame_irq"
#define NEW_FRAME_IRQ_RESET_VALUE 0
#define NEW_FRAME_IRQ_SPAN 16
#define NEW_FRAME_IRQ_TYPE "altera_avalon_pio"


/*
 * ram_data configuration
 *
 */

#define ALT_MODULE_CLASS_ram_data altera_avalon_onchip_memory2
#define RAM_DATA_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define RAM_DATA_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define RAM_DATA_BASE 0x8210000
#define RAM_DATA_CONTENTS_INFO ""
#define RAM_DATA_DUAL_PORT 0
#define RAM_DATA_GUI_RAM_BLOCK_TYPE "AUTO"
#define RAM_DATA_INIT_CONTENTS_FILE "embedded_vpu_ram_data"
#define RAM_DATA_INIT_MEM_CONTENT 1
#define RAM_DATA_INSTANCE_ID "NONE"
#define RAM_DATA_IRQ -1
#define RAM_DATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RAM_DATA_NAME "/dev/ram_data"
#define RAM_DATA_NON_DEFAULT_INIT_FILE_ENABLED 0
#define RAM_DATA_RAM_BLOCK_TYPE "AUTO"
#define RAM_DATA_READ_DURING_WRITE_MODE "DONT_CARE"
#define RAM_DATA_SINGLE_CLOCK_OP 0
#define RAM_DATA_SIZE_MULTIPLE 1
#define RAM_DATA_SIZE_VALUE 65536
#define RAM_DATA_SPAN 65536
#define RAM_DATA_TYPE "altera_avalon_onchip_memory2"
#define RAM_DATA_WRITABLE 1

#endif /* __SYSTEM_H_ */
