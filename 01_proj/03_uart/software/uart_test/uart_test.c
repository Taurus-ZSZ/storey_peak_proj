/*
 * uart_test.c
 *
 *  Created on: Nov 13, 2021
 *      Author: zsz
 */

#include "sys/alt_stdio.h"

int main()
{
	alt_putstr("hello from Nios II!\n");

	while(1);

	return 0;
}


