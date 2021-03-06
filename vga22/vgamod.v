module vgamod(clk,r,g,b,hs,vs,rgbin,out);
input clk;
output hs,vs;
output r,g,b;
input [2:0]rgbin;
output[15:0]out;
reg hs,vs; 
reg[9:0]hcnt;
reg[9:0]vcnt;
reg r,g,b;
assign out={vcnt[7:0],hcnt[7:0]};

always@(posedge clk) begin
if(hcnt==799) hcnt<=0;else hcnt<=hcnt+1;end

always@(posedge clk) begin
if(hcnt==639+8) begin
if(vcnt==524) vcnt<=0; else vcnt<=vcnt+1; end
end

always@(posedge clk)
if((hcnt>=639+8+8)&&(hcnt<638+8+8+96)) hs<=0;else hs<=1;

always@(vcnt)
if((vcnt>=480+8+2)&&(vcnt>=480+8+2+2)) vs<=0;else vs<=1;


always@(posedge clk) begin
if((hcnt<640)&&(vcnt<480))
begin r<=rgbin[2];g<=rgbin[1];b<=rgbin[0];end
else begin r<=0;g<=0;b<=0; end
end
endmodule


