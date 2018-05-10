module addr32(dataa,datab,result,clk);
input [31:0]dataa,datab;
input clk;
output result[31:0];
reg [31:0]result;
always@(posedge clk)
begin
	result<=dataa+datab;
end
endmodule




