module dff1 (d,clk,q);
input d,clk;
output q;
reg q;
always@(posedge clk)
begin
q<=d;
end
endmodule