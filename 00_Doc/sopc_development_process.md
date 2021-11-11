# SOPC 开发流程



sopc 开发流程包括硬件设计quartus与软件设计Nios IDE



## 硬件开发

首先确定系统需求：带宽，速度，接口，资源等等





## 软件开发





## 通过官方文档查看如何使用外设，如何配置寄存器

通过查看Embedded Peripherals IP User Guide 可以查找到官方提供的各种组件的使用说明，这个文档有相关寄存器的使用说明。



## 如何导入nios II 工程

1. 打开Nios II 软件，

2. 在Project Explorer 中右击-> Import ->General -> Existing Projects into Workspace
3. 选择要导入工程的根路径，
4. 如果勾选Copy projects into workspace 会把要导入的工程的bsp 和app 导入到当前的nios II 工作路径中。
5. 导入的工程需要注意sopcinfo使用的还是之前的（查看方法，BSP_Editor ），修改xxx_bsp工程下的settings.bsp文件，大概在第7行有一个bspGeneratedLocation的文件路径<BspGeneratedLocation>/opt/FPGA_work/04_SOC/01_Nios_II/01_proj/01_hello_led/software/hello_led_bsp</BspGeneratedLocation>。
6. clean project 清除工程缓存。
7. refresh 两个工程。
8. 在工程properties 中，将app 工程将bsp工程关联起来。



**注意：** 如果当前工程是从之前的工程拷贝过来的。这时要注意quartus 是可以正常使用的，但是那个Nios II 的工程是不能正常使用的，打开之后他的工程文件是链接到上一个原工程的nios II 工作文件夹的。所以需要重新导入工程。
