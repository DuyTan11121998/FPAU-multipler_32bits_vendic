////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Filename     : resultS.v                                                   //
// Description  : conjecture about the possible cases                         //
//                                                                            //
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn                            //
// Created On   : Friday November 22,2019                                     //
//                                                                            //  
////////////////////////////////////////////////////////////////////////////////


module resultS_mult(S,A,B,ansS);
output	[31:0]S;
input   [31:0]A,B,ansS;
reg	[31:0]S;

wire	flagNaNA,flagInfA,flag0A,flagNaNB,flagInfB,flag0B;

checkspecial	checkA(.flagInf(flagInfA),.flagNaN(flagNaNA),.flagZero(flag0A),.in(A));
checkspecial	checkB(.flagInf(flagInfB),.flagNaN(flagNaNB),.flagZero(flag0B),.in(B));

	
always@(A or B or ansS)
begin
	case ({flagInfA,flagInfB,flagNaNA,flagNaNB,flag0A,flag0B})
	6'b10_00_00, 6'b01_00_00,6'b11_00_00:	S={ansS[31],31'h7f800000};	//A=Inf or B=Inf => S=Inf
	6'b00_00_10, 6'b00_00_01, 6'b00_00_11:	S=32'h00000000;		//B=0 or A=0     => S=0
	6'b00_10_00, 6'b00_01_00, 6'b00_11_00:	S=32'h7FFFFFFF; 	//A or B NaN    => S=NaN 
	6'b10_00_01, 6'b01_00_10:  	        S=32'h7FFFFFFF;		//A=0 and B=Inf => S=NaN							
	default: S=ansS;
	endcase
end

endmodule
