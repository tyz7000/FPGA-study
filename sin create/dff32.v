module dff32(data,clk,q);
input [31:0]data;
input clk;
output [31:0]q;
reg [31:0]q;
always@(posedge clk)
begin 
	q<=data;
end
endmodule
