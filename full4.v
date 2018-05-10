module half(a,b,so,co);
 input a,b;
 output so;
 output co;
 assign so=a^b;
 assign co=a&b;
endmodule

module full (ain,bin,cin,so,co);
 input ain;
 input bin;
 input cin;
output so;
output co;
wire net1,net2,net3;
half u1 (.a(ain),.b(bin),.so(net1),.co(net2));
half u2  (.a(net1),.b(cin),.co(net3),.so(so));
 or u3  (co,net2,net3);
endmodule

module full4 (ain,bin,so,co);
 input [4:1]ain,bin;
 output [4:1]so;
 output co;
 wire net4,net5,net6;
 half u3 (.a(ain[1]),.b(bin[1]),.so(so[1]),.co(net4));
 full u4 (.ain(ain[2]),.bin(bin[2]),.cin(net4),.so(so[2]),.co(net5));
 full u5 (.ain(ain[3]),.bin(bin[3]),.cin(net5),.so(so[3]),.co(net6));
 full u6 (.ain(ain[4]),.bin(bin[4]),.cin(net6),.so(so[4]),.co(co));
endmodule