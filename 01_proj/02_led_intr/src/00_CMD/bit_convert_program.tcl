# 1.完成工程类型的识别(quartus or vivado)
# 2.判断是否创建program_debug_file文件夹
# 3.复制bit or sof文件到program_debug_file文件夹
# 4.复制vivado debug_nets.ltx 文件到 program_debug_file 文件夹
# 5.复制prm or .map 文件到 program_debug_file 文件夹
# 6.可以完成对quartus 和 vivado 工程bit文件的转换(rbf, jic, bin )
# 
#   解决中文乱码的问题 这个脚本要以utf-8的编码格式
#   source -encoding utf-8  test.tcl 
#   目前中文编码乱码的问题还没有解决
#
#获取当前工作路径
# encoding system utf-8

#print system encoding
# puts [encoding system]

# encoding system gb2312
# encoding system cp936
set current_path [pwd]

#get parameter
# config_device_name EPCS128
# serial_flash_loader_device_name EP4SGX230
set config_device_name              [lindex $argv 0]
set serial_flash_loader_device_name [lindex $argv 1]
set script2workrelpath              [lindex $argv 2]
set program_file_path               [lindex $argv 3]

#完成工程类型的识别
set proj_work_path $script2workrelpath
set vivado_runname [glob -nocomplain "${script2workrelpath}/*.runs"]
set qaurtus_qpfname [glob -nocomplain "${script2workrelpath}/*.qpf"]
if {[llength $vivado_runname] > 0 } {
    set project_type "vivado"
    # encoding system cp936
    
    puts $vivado_runname
    puts $project_type
    
} elseif {[llength $qaurtus_qpfname] > 0} {
    # puts "file is not exists"
    puts $qaurtus_qpfname
    set project_type "quartus"
} else {
    # puts "未识别的工程类型"
    puts "Unknown type of project"
    set project_type "no_project"
}

#判断文件是否存在，如果不存在新建program_debug_file 文件夹

set outputfile_name [glob -nocomplain $program_file_path]

if {[llength $outputfile_name] > 0 } {
    #考虑是不是删除之前的文件夹下的bit bin sof jic 文件
    puts $outputfile_name
} else {
    file mkdir $program_file_path
    # puts "新建program_debug_file文件夹"
    puts "New program_debug_file folder"
}

# vivado project 需要先进入工程的impl文件夹

# 按照工程的类型进行不同的操作
if {$project_type == "vivado"} {
    #vivado工程
    #获取impl文件路径
    set vivadoimplname [glob -nocomplain "${vivado_runname}/im*"]
    #get top_name
    set top_tcl_name [glob -nocomplain "${vivadoimplname}/*.tcl"]
    set top_name [file rootname [file tail $top_tcl_name]]
    
    puts $vivadoimplname
    puts $top_tcl_name
    puts $top_name
    
    
    #copy debug_nets.ltx
    if {[file exists "${vivadoimplname}/debug_nets.ltx"]} {
        file copy -force "${vivadoimplname}/debug_nets.ltx" $program_file_path
    } else {
        # puts "debug_nets.ltx文件不存在"
        puts "debug_nets.ltx file does not exist"
    }
    
    #copy $top_name.bit
    if {[file exists "${vivadoimplname}/${top_name}.bit"]} {
        file copy -force "${vivadoimplname}/${top_name}.bit" $program_file_path
    } else {
        # puts "${top_name}.bit文件不存在"
        puts "${top_name}.bit file does not exist"
    }
    #generate conversion bit -> bin
    #考虑生成的bin文件的名字需不需要加上日期
    write_cfgmem  -format bin -size 128 -interface SPIx4 -loadbit "up 0x00000000 ${vivadoimplname}/${top_name}.bit " -force -file "${vivadoimplname}/${top_name}"
    
    #copy $top_name.bin
    if {[file exists "${vivadoimplname}/${top_name}.bin"]} {
        file copy -force "${vivadoimplname}/${top_name}.bin" $program_file_path
    } else {
        puts "${top_name}.bin file does not exist"
    }
    #copy $top_name.prm
    if {[file exists "${vivadoimplname}/${top_name}.prm"]} {
        file copy -force "${vivadoimplname}/${top_name}.prm" $program_file_path
    } else {
        puts "${top_name}.prm file does not exist"
    }
    
    #copy $top_name.mcs
    if {[file exists "${vivadoimplname}/${top_name}.mcs"]} {
        file copy -force "${vivadoimplname}/${top_name}.mcs" $program_file_path
    } else {
        puts "${top_name}.mcs file does not exist"
    }    
} elseif {$project_type == "quartus"} {
    #quartus工程
    #get proj name 
    set qaurtus_proj_name [file rootname [file tail $qaurtus_qpfname]]
    
    #copy .sof file 
    if {[file exists "${proj_work_path}/${qaurtus_proj_name}.sof"]} {
        file copy -force "${proj_work_path}/${qaurtus_proj_name}.sof" $program_file_path
    } else {
        puts "${qaurtus_proj_name}.sof file does not exist"
    }    
    #generate conversion sof -> jic rpd map
    #考虑生成的jic文件的名字需不需要加上日期
    
    exec quartus_cpf -c -o bitstream_compression=on -o auto_create_rpd=on -o memory_map_file=on -d $config_device_name -s  $serial_flash_loader_device_name "${proj_work_path}/${qaurtus_proj_name}.sof"  "${proj_work_path}/${qaurtus_proj_name}.jic"
    
    #copy .jic file
    if {[file exists "${proj_work_path}/${qaurtus_proj_name}.jic"]} {
        file copy -force "${proj_work_path}/${qaurtus_proj_name}.jic" $program_file_path
    } else {
        puts "${qaurtus_proj_name}.jic file does not exist"
    }
    #copy .rpd file 
    if {[file exists "${proj_work_path}/${qaurtus_proj_name}_auto.rpd"]} {
        file copy -force "${proj_work_path}/${qaurtus_proj_name}_auto.rpd" $program_file_path
    } else {
        puts "${qaurtus_proj_name}_auto.rpd file does not exist"
    }
    #copy .map file 
    if {[file exists "${proj_work_path}/${qaurtus_proj_name}.map"]} {
        file copy -force "${proj_work_path}/${qaurtus_proj_name}.map" $program_file_path
    } else {
        puts "${qaurtus_proj_name}.map file does not exist"
    }
    #copy signal tap file
    set signaltap_file_path [glob -nocomplain ../../signaltap]
    if {[llength $signaltap_file_path] > 0} {
        set signaltap_name [glob -nocomplain "${signaltap_file_path}/*.stp"]
        if {[llength $signaltap_name] > 0} {
            file copy -force $signaltap_name $program_file_path
        }
    } else {
        # puts "请手动复制 .stp 文件到 program_debug_file 文件夹"
        puts "Please copy the.stp file to the program_debug_file folder manually"
    }
    
    
} elseif {$project_type == "no_project"} {
    #没有工程
    puts "Please create the project !!!"
} else {
    #未识别的工程类型
    puts "Unable to identify project types !!!!"
}


exit
