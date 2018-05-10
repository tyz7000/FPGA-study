module oushu(clk,kout);
input clk;
output kout;
parameter n=4;
reg[3:0]c1;
reg kout;
always@(posedge clk)
begin 
 c1<=c1+1;
 if (c1==n/2-1) 
   begin
   kout<=~kout;
   c1<=0;
   end
end
endmodule