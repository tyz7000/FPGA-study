module vgamod(clk50m,md,hs,vs,rgbout);
input clk50m,md;
output hs,vs;
output [2:0]rgbout;

reg hs,vs; //
reg[9:0]hcnt;
reg[9:0]vcnt;
reg[2:0]rgbx,rgby,rgbxy;
reg[1:0]mmd;
reg[2:0]rgbout;
reg[1:0]cnt;
reg clk;

always@(posedge clk50m) begin
cnt=cnt+1;
if(cnt==1) begin clk=~clk;cnt=0; end
end

always@(posedge md) begin
mmd<=mmd+1;end

always@(mmd) begin
case(mmd)
2'b00: rgbxy<=rgbx;
2'b01: rgbxy<=rgby;
2'b10: rgbxy<=rgbx^rgby;
2'b11: rgbxy<=rgbx~^rgby;
default: rgbxy<=3'b000;
endcase
end

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
if(hcnt<80) rgbx<=3'b111;
else if(hcnt<160) rgbx<=3'b110;
else if(hcnt<240) rgbx<=3'b101;
else if(hcnt<320) rgbx<=3'b100;
else if(hcnt<400) rgbx<=3'b011;
else if(hcnt<480) rgbx<=3'b010;
else if(hcnt<560) rgbx<=3'b001;
else rgbx<=3'b000;

if(vcnt<60) rgby<=3'b111;
else if(vcnt<120) rgby<=3'b110;
else if(vcnt<180) rgby<=3'b101;
else if(vcnt<240) rgby<=3'b100;
else if(vcnt<300) rgby<=3'b011;
else if(vcnt<360) rgby<=3'b010;
else if(vcnt<420) rgby<=3'b001;
else rgby<=3'b000;
end

always@(hcnt,vcnt)
if((hcnt<640)&&(vcnt<480))
rgbout<=rgbxy;
else rgbout<=3'b000;
endmodule


