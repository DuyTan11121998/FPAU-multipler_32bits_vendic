//////////////////////////////////////////////////////////////
//                                                          //
// Filename     : adder.v                                   //
// Description  : (CLA)Carry-lookahead adder for nbits      //
//                                                          //                  
// Author       : tan.nguyen_suunhj98@hcmut.edu.cn          //
// Created On   : Monday November 4,2019                    //
//                                                          //
//////////////////////////////////////////////////////////////



 /******************Adder6bits**************************/
module adder6(Cout,S,A,B);
output [5:0]S;
output	Cout;
input  [5:0]A,B;

wire   [5:0]g,p;
wire   [5:0]c;

wire   [1:0]g_s01;
wire   [1:0]p_s01;
wire   [1:0]c_s02;

//Preadder   
assign g = A&B;

assign p = A^B;

//Processing
clb4       stage11(g_s01[0],p_s01[0],c[3:0],g[3:0],p[3:0],c_s02[0]);	
clb2	   stage12(g_s01[1],p_s01[1],c[5:4],g[5:4],p[5:4],c_s02[1]);	

clb2 	   stage21(Cout,,c_s02,g_s01,p_s01,1'b0);

//Postadder  
assign S = p^c;

endmodule

/******************Adder8bits**************************/
module adder8(S,A,B);
output [7:0]S;
input  [7:0]A,B;

wire   [7:0]g,p;
wire   [7:0]c;

wire   [1:0]g_s01;
wire   [1:0]p_s01;
wire   [1:0]c_s02;

//Preadder   
assign g = A&B;

assign p = A^B;

//Processing
clb4       stage11(g_s01[0],p_s01[0],c[3:0],g[3:0],p[3:0],c_s02[0]);	
clb4	   stage12(g_s01[1],p_s01[1],c[7:4],g[7:4],p[7:4],c_s02[1]);	

clb2 	   stage21(,,c_s02,g_s01,p_s01,1'b0);

//Postadder  
assign S = p^c;

endmodule

/******************Adder9bits**************************/
module adder9(S,A,B);
output [8:0]S;
input  [8:0]A,B;

wire   [8:0]g,p;
wire   [8:0]c;

wire   [2:0]g_s01;
wire   [2:0]p_s01;
wire   [2:0]c_s02;

//Preadder   
assign g = A&B;

assign p = A^B;

//Processing
clb4       stage11(g_s01[0],p_s01[0],c[3:0],g[3:0],p[3:0],c_s02[0]);	
clb3	   stage12(g_s01[1],p_s01[1],c[6:4],g[6:4],p[6:4],c_s02[1]);
clb2       stage13(g_s01[2],p_s01[2],c[8:7],g[8:7],p[8:7],c_s02[2]);      

clb3 	   stage21(,,c_s02,g_s01,p_s01,1'b0);

//Postadder  
assign S = p^c;

endmodule

/******************Adder10bits**************************/
module adder10(S,A,B);
output [9:0]S;
input  [9:0]A,B;

wire   [9:0]g,p;
wire   [9:0]c;

wire   [2:0]g_s01;
wire   [2:0]p_s01;
wire   [2:0]c_s02;

//Preadder   
assign g = A&B;

assign p = A^B;

//Processing
clb4       stage11(g_s01[0],p_s01[0],c[3:0],g[3:0],p[3:0],c_s02[0]);	
clb4	   stage12(g_s01[1],p_s01[1],c[7:4],g[7:4],p[7:4],c_s02[1]);	
clb2	   stage21(g_s01[2],p_s01[2],c[9:8],g[9:8],p[9:8],c_s02[2]);	

clb3 	   s0200(,,c_s02,g_s01,p_s01,1'b0);

//Postadder  
assign S = p^c;

endmodule

/******************Adder12bits**************************/
module adder12(Cout,S,A,B);
output [11:0]S;
output	Cout;
input  [11:0]A,B;

wire   [11:0]g,p;
wire   [11:0]c;

wire   [2:0]g_s01;
wire   [2:0]p_s01;
wire   [2:0]c_s02;

//Preadder   
assign g = A&B;

assign p = A^B;


//Processing
clb4       stage11(g_s01[0],p_s01[0],c[3:0],g[3:0],p[3:0],c_s02[0]);	
clb4	   stage12(g_s01[1],p_s01[1],c[7:4],g[7:4],p[7:4],c_s02[1]);	
clb4	   stage21(g_s01[2],p_s01[2],c[11:8],g[11:8],p[11:8],c_s02[2]);	

clb3 	   s0200(Cout,,c_s02,g_s01,p_s01,1'b0);

//Postadder  
assign S = p^c;

endmodule

/******************Adder24bits**************************/
module adder24(Cout,S,A,B);
output [23:0]S;
output	Cout;
input  [23:0]A,B;

wire   [23:0]g,p;
wire   [23:0]c;

wire   [5:0]g_s01;
wire   [5:0]p_s01;
wire   [1:0]g_s02;
wire   [1:0]p_s02;
wire   [5:0]c_s02;
wire   [1:0]c_s03;	

//Preprocessing
assign g = A&B;
assign p = A^B;

//Processing
clb4       stage11(g_s01[0],p_s01[0],c[3:0],g[3:0],p[3:0],c_s02[0]);	
clb4	   stage12(g_s01[1],p_s01[1],c[7:4],g[7:4],p[7:4],c_s02[1]);	
clb4	   stage13(g_s01[2],p_s01[2],c[11:8],g[11:8],p[11:8],c_s02[2]);
clb4	   stage14(g_s01[3],p_s01[3],c[15:12],g[15:12],p[15:12],c_s02[3]);
clb4	   stage15(g_s01[4],p_s01[4],c[19:16],g[19:16],p[19:16],c_s02[4]);
clb4	   stage16(g_s01[5],p_s01[5],c[23:20],g[23:20],p[23:20],c_s02[5]);

clb4 	   stage21(g_s02[0],p_s02[0],c_s02[3:0],g_s01[3:0],p_s01[3:0],c_s03[0]);
clb2       stage22(g_s02[1],p_s02[1],c_s02[5:4],g_s01[5:4],p_s01[5:4],c_s03[1]);

clb2 	   stage31(Cout,,c_s03,g_s02,p_s02,1'b0);

//Postprocessing
assign S = p^c;

endmodule

/******************Adder25bits**************************/
module adder25(S,A,B);
output [24:0]S;
input  [24:0]A,B;

wire   [24:0]g,p;
wire   [24:0]c;

wire   [6:0]g_s01;
wire   [6:0]p_s01;
wire   [1:0]g_s02;
wire   [1:0]p_s02;
wire   [6:0]c_s02;
wire   [1:0]c_s03;	

//Preprocessing
assign g = A&B;

assign p = A^B;

//Processing
clb4       stage11(g_s01[0],p_s01[0],c[3:0],g[3:0],p[3:0],c_s02[0]);	
clb4	   stage12(g_s01[1],p_s01[1],c[7:4],g[7:4],p[7:4],c_s02[1]);	
clb4	   stage13(g_s01[2],p_s01[2],c[11:8],g[11:8],p[11:8],c_s02[2]);
clb4	   stage14(g_s01[3],p_s01[3],c[15:12],g[15:12],p[15:12],c_s02[3]);
clb4	   stage15(g_s01[4],p_s01[4],c[19:16],g[19:16],p[19:16],c_s02[4]);
clb3	   stage16(g_s01[5],p_s01[5],c[22:20],g[22:20],p[22:20],c_s02[5]);
clb2	   stage17(g_s01[6],p_s01[6],c[24:23],g[24:23],p[24:23],c_s02[6]);

clb4 	   stage21(g_s02[0],p_s02[0],c_s02[3:0],g_s01[3:0],p_s01[3:0],c_s03[0]);
clb3       stage22(g_s02[1],p_s02[1],c_s02[6:4],g_s01[6:4],p_s01[6:4],c_s03[1]);

clb2 	   stage31(,,c_s03,g_s02,p_s02,1'b0);

//Postprocessing
assign S = p^c;

endmodule

/******************Adder26bits**************************/
module adder26(S,A,B);
output [25:0]S;
input  [25:0]A,B;

wire   [25:0]g,p;
wire   [25:0]c;

wire   [6:0]g_s01;
wire   [6:0]p_s01;
wire   [1:0]g_s02;
wire   [1:0]p_s02;
wire   [6:0]c_s02;
wire   [1:0]c_s03;	

//Preprocessing
assign g = A&B;

assign p = A^B;

//Processing
clb4       stage11(g_s01[0],p_s01[0],c[3:0],g[3:0],p[3:0],c_s02[0]);	
clb4	   stage12(g_s01[1],p_s01[1],c[7:4],g[7:4],p[7:4],c_s02[1]);	
clb4	   stage13(g_s01[2],p_s01[2],c[11:8],g[11:8],p[11:8],c_s02[2]);
clb4	   stage14(g_s01[3],p_s01[3],c[15:12],g[15:12],p[15:12],c_s02[3]);
clb4	   stage15(g_s01[4],p_s01[4],c[19:16],g[19:16],p[19:16],c_s02[4]);
clb4	   stage16(g_s01[5],p_s01[5],c[23:20],g[23:20],p[23:20],c_s02[5]);
clb2	   stage17(g_s01[6],p_s01[6],c[25:24],g[25:24],p[25:24],c_s02[6]);

clb4 	   stage21(g_s02[0],p_s02[0],c_s02[3:0],g_s01[3:0],p_s01[3:0],c_s03[0]);
clb3       stage22(g_s02[1],p_s02[1],c_s02[6:4],g_s01[6:4],p_s01[6:4],c_s03[1]);

clb2 	   stage31(,,c_s03,g_s02,p_s02,1'b0);

//Postprocessing
assign S = p^c;

endmodule