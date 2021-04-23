`timescale 1ns/1ps

`include "regfile.h"

module regfile_TestBench;

	reg clk;
	reg reset;

	reg we;
	reg  [`AddrBus] addr;
	reg  [`DataBus] wdata;
	wire [`DataBus] rdata;

	integer i;

	parameter STEP = 100.0000;

	always #(STEP / 2) begin
		clk <= ~clk;
	end

	regfile regfile(
		.clk (clk),
		.reset (reset),
		.we (we),
		.addr (addr),
		.indata (wdata),
		.outdata (rdata)
	);

	initial begin
		#0 begin
			clk <= `HIGH;
			reset <= `ENABLE;
			addr <= {`ADDR_W{1'b0}};
			wdata <= {`DATA_W{1'b0}};
		end

		# STEP begin
			reset <= `DISABLE;
		end

		#STEP begin
			for (i = 0; i < `DATA_D; i = i + 1) begin
				#STEP begin
					addr <= i;
					wdata <= i;
					we <= `ENABLE;
				end

				#STEP begin
					addr <= i;
					wdata <= {`ADDR_W{1'b0}};
					we <= `DISABLE;

					if (rdata == i) begin
						$display($time,"regstack[%d] Read/Write Check OK !", i);
					end else begin
						$display($time,"regstack[%d] Read/Write Check Failed !", i);
					end
				end
			end

			# STEP begin
				$finish;
			end
		end
	end

	initial begin
		$dumpfile("regfile.vcd");
		$dumpvars(0,regfile);
	end
endmodule
