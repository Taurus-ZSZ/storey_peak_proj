/*
 * led_intr.c
 *
 *  Created on: Nov 7, 2021
 *      Author: zsz
 */

#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "sys/alt_irq.h"

alt_u8 led_en;

alt_isr_func const_ip_isr(void)
{
	alt_u8 data;
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PIO_INTR_BASE,0x0);// 全部关闭按键中断。
	data = IORD_ALTERA_AVALON_PIO_EDGE_CAP(PIO_INTR_BASE);//读取边沿寄存器的值，确定是哪一个按键按下
	if (data == 0x3)
	{

	} else if (data & 0x1)
	{
		led_en = 1;
	} else if (data & 0x2)
	{
		led_en = 0;
	}
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_INTR_BASE, 0x3);
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PIO_INTR_BASE,0x3);// 打开中断。
	return 0;
}

int main(void)
{
	alt_u8 led =0;
	alt_u32 i;
	char *p;
	led_en = 0;
	//写中断服务函数
	//先注册 后使能。
	alt_ic_isr_register(PIO_INTR_IRQ_INTERRUPT_CONTROLLER_ID,
						PIO_INTR_IRQ,
						const_ip_isr,//中断服务函数
						 p,
						 0);

	 IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_INTR_BASE, 0x3);
	 IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PIO_INTR_BASE, 0x3);// 打开中断。
	 IOWR_ALTERA_AVALON_PIO_DIRECTION(PIO_LED_BASE, 0xff);



	 while(1)
	 {
		 if (led_en)
		 {
			 led = 0;
			 IOWR_ALTERA_AVALON_PIO_DATA(PIO_LED_BASE, led);

			 i = 0;
			 while(i <500000)
			 {
				 i++;
			 }

			 led =0xff;
			 IOWR_ALTERA_AVALON_PIO_DATA(PIO_LED_BASE, led);

			 i = 0;
			 while(i <500000)
			 {
				 i++;
			 }
		 } else
		 {
			 led = 0;
			 IOWR_ALTERA_AVALON_PIO_DATA(PIO_LED_BASE, led);
		 }

	 }

	return 0;
}



