////////////////////////////////////////////////////////
//                                                    //
// Filename     : shiftright.v                        //
// Description  : shiftright                          //
//                                                    //                  
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn    //
// Created On   : Wednesday November 13,2019          //
//                                                    //
////////////////////////////////////////////////////////

module shiftright24(out,in,sel);
output	[23:0]out;
input   [23:0]in;
input   [4:0]sel;

wire	[23:0]s4,s3,s2,s1;

shiftrightby16	stage4(s4,in,sel[4]);
shiftrightby8	stage3(s3,s4,sel[3]);
shiftrightby4	stage2(s2,s3,sel[2]);
shiftrightby2	stage1(s1,s2,sel[1]);
shiftrightby1	stage0(out,s1,sel[0]);

endmodule

module shiftrightby1(out,in,sel);
output	[23:0]out;
input   [23:0]in;
input   sel;

assign out = sel?{1'b0,in[23:1]}:in;

endmodule

module shiftrightby2(out,in,sel);
output	[23:0]out;
input   [23:0]in;
input   sel;

assign out = sel?{2'b00,in[23:2]}:in;

endmodule

module shiftrightby4(out,in,sel);
output	[23:0]out;
input   [23:0]in;
input   sel;

assign out = sel?{4'h0,in[23:4]}:in;

endmodule

module shiftrightby8(out,in,sel);
output	[23:0]out;
input   [23:0]in;
input   sel;

assign out = sel?{8'h00,in[23:8]}:in;

endmodule

module shiftrightby16(out,in,sel);
output	[23:0]out;
input   [23:0]in;
input   sel;

assign out = sel?{16'h0000,in[23:16]}:in;

endmodule