module dac7513 (clk50,dacclk,daccs,dacdout,dacdata);
input clk50;
input [11:0]dacdata;
output dacclk,daccs,dacdout;
reg clk1m,clk25k;
reg[4:0]cnt;
reg[9:0]cnt1;
reg[4:0]cnt2;
reg dacdout;

assign dacclk=clk1m;
assign daccs=clk25k;
always@(posedge clk50)
begin 
cnt=cnt+1;
if(cnt==5)
  begin
  clk1m=~clk1m;
  cnt=0;
  end
end


always@(posedge clk50)
 begin
 cnt1=cnt1+1;
if (cnt1==200)
	begin
	clk25k=~clk25k;
	cnt1=0;
	end
end

always@(negedge clk1m)
begin
	if(!clk25k) cnt2=cnt2+1;else cnt2=0;
	case (cnt2)
	5:dacdout=dacdata[11];
	6:dacdout=dacdata[10];
	7:dacdout=dacdata[9];
	8:dacdout=dacdata[8];
	9:dacdout=dacdata[7];
	10:dacdout=dacdata[6];
	11:dacdout=dacdata[5];
	12:dacdout=dacdata[4];
	13:dacdout=dacdata[3];
	14:dacdout=dacdata[2];
	15:dacdout=dacdata[1];
	16:dacdout=dacdata[0];
	default dacdout=0;
	endcase
end
endmodule



