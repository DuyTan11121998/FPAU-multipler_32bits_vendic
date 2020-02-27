////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : normalize.v                                                 //
// Description  : subtraction and addition floating 32 bits                   //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Friday November 22,2019                                     //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////

module normalize(exp_out,frac_out,exp_in,frac_in);
output	[7:0]exp_out;
output	[23:0]frac_out;
input	[7:0]exp_in;
input	[24:0]frac_in;

wire	checkzero;
wire	[4:0]shift_left_by_n;
wire	[24:0]temp_frac;
wire	[9:0]tc_n;

wire	[9:0]ext_exp_out,temp_tc_n;

//Normalize fraction 
findbit1	find_bit_to_shift(.flagzero(checkzero),.Z(shift_left_by_n),.Y(frac_in));
shiftleft	shift_left_frac(.out(temp_frac),.in(frac_in),.sel(shift_left_by_n));

assign	frac_out=temp_frac[24:1];

//Normalize exponent
tc10		tc_shiftleft(.out(tc_n),.in({5'd0,shift_left_by_n}));

adder10		normalize_exp1(.S(temp_tc_n),.A(10'd1),.B(tc_n));
adder10		normalize_exp2(.S(ext_exp_out),.A({2'b00,exp_in}),.B(temp_tc_n));


assign	exp_out=(ext_exp_out[8]|checkzero)?8'd0:ext_exp_out[7:0];

endmodule