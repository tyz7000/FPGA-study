module LED7S(A,LED7S);
input[3:0] A;
output[6:0] LED7S;
reg[6:0] LED7S;
always@(A)
	case (A)
		4'b0000 : LED7S<=7'b0111111;
		4'b0001 : LED7S<=7'b0000110;
		4'b0010 : LED7S<=7'b1011011;
		4'b0011 : LED7S<=7'b1001111;
		4'b0100 : LED7S<=7'b1100110;
		4'b0101 : LED7S<=7'b1101101;
		4'b0110 : LED7S<=7'b1111101;
		4'b0111 : LED7S<=7'b0000111;
		4'b1000 : LED7S<=7'b1111111;
		4'b1001 : LED7S<=7'b1101111;
		4'b1010 : LED7S<=7'b1110111;
		4'b1011 : LED7S<=7'b1111100;
		4'b1100 : LED7S<=7'b0111001;
		4'b1101 : LED7S<=7'b1011110;
		4'b1110 : LED7S<=7'b1110001;
		4'b1111 : LED7S<=7'b1110001;
		default : LED7S<=7'b0111111;
	endcase
endmodule
