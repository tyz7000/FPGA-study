module cnt(clk,dout);
input clk;
output [9:0]dout;
reg [9:0]dout;
always@ (posedge clk)
 dout<=dout+1;
endmodule 

module pad(dataa,datab,dout);
input [9:0]dataa,datab;
output [9:0]dout;
assign dout=dataa+datab;
endmodule 