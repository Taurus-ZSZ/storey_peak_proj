

## 生成svf

```shell
quartus_cpf -c -q 12.0MHz -g 3.3 -n p 04_iic.sof 04_iic.svf
```





## svf 烧录

```tcl
openocd     -f interface/ftdi/um232h.cfg     -c "adapter_khz 20000; transport select jtag; jtag newtap auto0 tap -irlen 10 -expected-id 0x029070dd; init; svf ./04_iic.svf; exit"
```



## I2C 配置流程

```c
//1.打开对应的I2c设备
ALT_AVALON_I2C_DEV_t *i2c_dev_idt = alt_avalon_i2c_open(I2C_IDT_NAME);
//2.配置iic的速度模式，地址模式
ALT_AVALON_I2C_MASTER_CONFIG_t i2c_idt_cfg = {
    .addr_mode = ALT_AVALON_I2C_ADDR_MODE_7_BIT,
    .speed_mode = ALT_AVALON_I2C_SPEED_STANDARD,
};
//3.配置IIC总线的速度400khz
alt_avalon_i2c_master_config_speed_set(i2c_dev_idt, &i2c_idt_cfg, 400000);
//4.根据ALT_AVALON_I2C_ADDR_MODE_t 的类型设置寄存器。
alt_avalon_i2c_master_config_set(i2c_dev_idt, &i2c_idt_cfg);
//5.关于中断这里我并不知道这是干啥用的
IRQ_DATA_t irq_data;
alt_avalon_i2c_register_optional_irq_handler(i2c_dev_idt, &irq_data);

//6.读数据
//在使用alt_avalon_i2c_master_tx_rx读数据前必须先设置alt_avalon_i2c_master_target_set，
//流程是alt_avalon_i2c_master_tx_rx 先发送开始位，然后发送器件地址（alt_avalon_i2c_master_target_set 函数设置的地址），然后发送写数据idt_tx_buf中的数据，1个字节，在这里uint8_t idt_tx_buf[1] = {0}，这里表示的是单字节地址0。idt_rx_buf用于接受数据的buffer,接受24个byte。
// set IDT oscillator
   uint8_t idt_tx_buf[1] = {0};
   uint8_t idt_rx_buf[IDT8NXQ001_REG_SIZE] = {0};

   alt_avalon_i2c_master_target_set(i2c_dev_idt, IDT8NxQ001_I2C_ADDR);
   ALT_AVALON_I2C_STATUS_CODE rc = alt_avalon_i2c_master_tx_rx(
       i2c_dev_idt, idt_tx_buf, 1, idt_rx_buf, IDT8NXQ001_REG_SIZE, 1);

```







## read idt iic data

```shell
Hello from Nios II!
printf rx_bufferdata 
addr=0    data=33 
addr=1    data=33 
addr=2    data=33 
addr=3    data=33 
addr=4    data=0 
addr=5    data=1f 
addr=6    data=1f 
addr=7    data=1f 
addr=8    data=1f 
addr=9    data=0 
addr=10    data=0 
addr=11    data=0 
addr=12    data=0 
addr=13    data=0 
addr=14    data=0 
addr=15    data=0 
addr=16    data=0 
addr=17    data=0 
addr=18    data=0 
addr=19    data=0 
addr=20    data=0 
addr=21    data=0 
addr=22    data=0 
addr=23    data=0 


```

