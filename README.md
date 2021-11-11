# stratix_v_nios_II





## quartus use ft232





### 查看openocd与jtag进程

```shell
ps -ax |grep -i openocd
ps -ax |grep -i jtag

kill pid
```





### 配置openocd 

在linux 中使用quartus 配合ft232进行下载svf文件前，需要先运行一下下面的这个命令！

```shell
openocd \
    -f interface/ftdi/um232h.cfg \
    -c "adapter_khz 2000; transport select jtag; jtag newtap auto0 tap -irlen 10 -expected-id 0x029070dd; init; exit;"
```

###  使用命令转换sof -> svf

help : 
quartus_cpf --help=svf

```shell
quartus_cpf -c -q 12.0MHz -g 3.3 -n p 02_led.sof 02_led.svf
```



### stxV openocd 播放svf文件

```shell
openocd     -f interface/ftdi/um232h.cfg     -c "adapter_khz 20000; transport select jtag; jtag newtap auto0 tap -irlen 10 -expected-id 0x029070dd; init; svf /opt/FPGA_work/FPGA_Board/Microsoft_Board/storey_peak/02_led/02_led.svf; exit"
```

```shell
openocd     -f interface/ftdi/um232h.cfg     -c "adapter_khz 20000; transport select jtag; jtag newtap auto0 tap -irlen 10 -expected-id 0x029070dd; init; svf ./02_led_intr.svf; exit"
```



## 打开串口

```shell
cutecom
/dev/ttyUSB0
```



