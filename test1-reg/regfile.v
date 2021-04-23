`include "regfile.h"

module regfile(
    input wire clk,
    input wire reset,
    input wire we,
    input wire  [`AddrBus]  addr,  
    input wire  [`DataBus]  indata,
    output wire [`DataBus] outdata	
);

	reg[`DataBus] regstack[`DATA_D-1:0];//定义一个寄存器堆，每个寄存器有32位，总共有32个
	integer i;

	assign outdata = regstack[addr];

	always @(posedge clk or negedge reset) begin
		if (reset == `ENABLE) begin //异步复位
			for (i = 0; i < `DATA_D; i = i + 1)begin
				regstack[i] <= #1 {`DATA_W{1'b0}};
			end
		end else begin
			if (we == `ENABLE)begin
				regstack[addr] = indata;
			end
		end
	end
	
endmodule
