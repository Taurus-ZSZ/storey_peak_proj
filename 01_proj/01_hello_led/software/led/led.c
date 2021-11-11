/*
 * led.c
 *
 *  Created on: Nov 5, 2021
 *      Author: zsz
 */


#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

int main(void)
{
	alt_u8 	led = 0;
	alt_u32 i;

	IOWR_ALTERA_AVALON_PIO_DIRECTION(PIO_LED_BASE, 0xf);

	while(1){
		led = 0;
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_LED_BASE, led);

		i = 0;
		while(i < 500000){

			i++;
		}
		led = 0xf;
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_LED_BASE, led);

		i = 0;
		while(i < 500000){
			i++;
		}
	}
	return 0;
}

