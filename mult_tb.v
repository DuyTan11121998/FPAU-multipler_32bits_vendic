////////////////////////////////////////////////////////
//                                                    //
// Filename     : mult_tb.v                           //
// Description  : test mult nbits                     //
//                                                    //                  
// Author       : hang.nguyen4264@hcmut.edu.vn        //
// Created On   : Wednesday November 13,2019          //
//                                                    //
////////////////////////////////////////////////////////

module mult_tb;
reg [31:0] A,B;


wire [31:0]S;

multiplier uut(S,A,B);


initial begin
	A=32'hC1CC0000;
	B=32'hC1CAC000;
#100
	A=32'hC7CAC000;
	B=32'h3E150027;
#100
	A=32'h44B1C8FE;
	B=32'hC891042A;
#100
	A=32'h40BC0000;
	B=32'h3F180000;
#100
	A=32'hBE480000;
	B=32'h3E380000;
#100
	A=32'h4173AE14;
	B=32'h41651EB8;
#100
	A=32'hC17E6666;
	B=32'hC17E6666;
#100
	A=32'h41751EB8;
	B=32'h41751EB8;
#100
	A=32'hC17E6666;
	B=32'hC17E6666;
#100
	A=32'h41CB1893;
	B=32'hC0AB0A3D;
#100
	A=32'h41751EB8;
	B=32'h4173AE14;
#100
	A=32'h465ac000;
	B=32'h46dac000;
#100
	A=32'h7f800000;
	B=32'h00000000;
#100
	A=32'h7f800000;
	B=32'h7f800000;	
#100
	A=32'hff800000;
	B=32'h40166666;
#100
	A=32'h00000000;
	B=32'h00000000;
#100
	A=32'h7f800000;
	B=32'h7f800000;
#100
	A=32'h7fffffff;
	B=32'h40166666;
#100
	A=32'hff800000;
	B=32'hff800000;
#100
	A=32'h7fffffff;
	B=32'hc1740000;//next
end


endmodule
