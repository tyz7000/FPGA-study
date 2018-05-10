module mux21(dataout,dataa,datab,sel);
input [11:0]dataa,datab;
input sel ;
output [11:0]dataout;
reg [11:0]dataout;
always@ *
if (sel==0)
dataout<=dataa;
else
dataout<=datab;
endmodule


module mux12(dataa,datab,sel,datain);
input [9:0]datain;
input sel;
output [9:0]dataa,datab;
reg [9:0]dataa,datab;
 always@ *
if (sel==0)
dataa<=datain;
else
datab<=datain;
endmodule 



