////////////////////////////////////////////////////////
//                                                    //
// Filename     : shiftleft.v                         //
// Description  : shiftleft                           //
//                                                    //                  
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn    //
// Created On   : Wednesday November 13,2019          //
//                                                    //
////////////////////////////////////////////////////////

module shiftleft(out,in,sel);
output	[24:0]out;
input   [24:0]in;
input   [4:0]sel;

wire	[24:0]s4,s3,s2,s1;

shiftleftby16	stage4(s4,in,sel[4]);
shiftleftby8	stage3(s3,s4,sel[3]);
shiftleftby4	stage2(s2,s3,sel[2]);
shiftleftby2	stage1(s1,s2,sel[1]);
shiftleftby1	stage0(out,s1,sel[0]);

endmodule

module shiftleftby1(out,in,sel);
output	[24:0]out;
input   [24:0]in;
input   sel;

assign out = sel?{in[23:0],1'b0}:in;

endmodule

module shiftleftby2(out,in,sel);
output	[24:0]out;
input   [24:0]in;
input   sel;

assign out = sel?{in[22:0],2'b00}:in;

endmodule

module shiftleftby4(out,in,sel);
output	[24:0]out;
input   [24:0]in;
input   sel;

assign out = sel?{in[20:0],4'h0}:in;

endmodule

module shiftleftby8(out,in,sel);
output	[24:0]out;
input   [24:0]in;
input   sel;

assign out = sel?{in[16:0],8'h00}:in;

endmodule

module shiftleftby16(out,in,sel);
output	[24:0]out;
input   [24:0]in;
input   sel;

assign out = sel?{in[8:0],16'h0000}:in;

endmodule