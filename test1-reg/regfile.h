`ifndef __REGFILE_H
`define __REGFILE_H

`define HIGH      1'b1
`define LOW       1'b0

`define ENABLE   1'b1
`define DISABLE  1'b0


`define DATA_W    32     //数据写宽度
`define DataBus   31:0   //数据总线宽度
`define DATA_D    32     //数据总线读宽度


`define ADDR_W    5    //地址总线宽度,最多可寻址32数据
`define AddrBus   4:0 //地址总线地址


`endif
