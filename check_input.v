////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : check_input.v                                               //
// Description  : checkinf,checknan,checkzero                                 //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Friday November 22,2019                                     //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////

module checkspecial(flagInf,flagNaN,flagZero,in);
output	flagZero,flagInf, flagNaN;
input	[31:0]in;

wire	zeroFrac,oneExp;

assign	flagZero=~in[0]&~in[1]&~in[2]&~in[3]&~in[4]&~in[5]&~in[6]&~in[7]
	       &~in[8]&~in[9]&~in[10]&~in[11]&~in[12]&~in[13]&~in[14]&~in[15]
	       &~in[16]&~in[17]&~in[18]&~in[19]&~in[20]&~in[21]&~in[22]&~in[23]
	       &~in[24]&~in[25]&~in[26]&~in[27]&~in[28]&~in[29]&~in[30];

assign	zeroFrac=~in[0]&~in[1]&~in[2]&~in[3]&~in[4]&~in[5]&~in[6]&~in[7]
	       &~in[8]&~in[9]&~in[10]&~in[11]&~in[12]&~in[13]&~in[14]&~in[15]
	       &~in[16]&~in[17]&~in[18]&~in[19]&~in[20]&~in[21]&~in[22];

assign	oneExp=in[23]&in[24]&in[25]&in[26]&in[27]&in[28]&in[29]&in[30];
// Not a numbers
assign	flagNaN=(oneExp==1&&zeroFrac==0)?1:0;
//inf
assign	flagInf=(zeroFrac&oneExp)?1:0;

endmodule
