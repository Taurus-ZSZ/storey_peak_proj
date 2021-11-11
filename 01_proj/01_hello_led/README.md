# Led test





## 重新生成BSP

在重新编译了quartus 工程后需要重新生成BSP 

Nios -> generate BSP

## small 模式的优化

在使用hello small 模板创建的工程使用的是面积优化

![image-20211102221158268](README/image-20211102221158268.png)

所以工具可能会优化掉我们的while()延时循环

关掉优化：off

![image-20211102221319035](README/image-20211102221319035.png)



## BSP 文件结构

to do 

## 如何快速调用qsys 中添加的组件

![image-20211102221904362](README/image-20211102221904362.png)

## BSP 中的system.h文件

system.h 中的宏定义与我们qsys 中设计的硬件信息是一 一对应的，比如#define PIO_LED_BASE 0x4000

![image-20211102222318922](README/image-20211102222318922.png)



## Nios 固化程序：



### 片上ROM生成ROM 初始化文件

![image-20211102222914708](README/image-20211102222914708.png)

![image-20211102223120797](README/image-20211102223120797.png)

生成的存储器初始化文件

![image-20211102223434524](README/image-20211102223434524.png)

将meminit.qip文件添加到quartus 工程中

![image-20211102223757038](README/image-20211102223757038.png)

然后重新全编译工程

![image-20211102223855494](README/image-20211102223855494.png)

生成的.sof文件就会包含这个rom的初始化文件。

如果想要固化程序只需要生成jic然后烧写进flash中即可。

## PIO 中的 inout 与Bidir

信号放到管脚上设置成bidir

信号在FPGA内部使用，使用inout ,信号在FPGA 内部不支持三态，只有在FPGA的管脚上才有三态。



## 下载程序

1. 先把sof文件下载到fpga 
2. 下载软件程序
   - 在工程中右键选择debug as -> debug configure -> NiosII Hardware
   
   - 
   
     

