////////////////////////////////////////////////////////
//                                                    //
// Filename     : vedic.v                             //
// Description  : mult with vedic                     //
//                                                    //                  
// Author       : hang.nguyen4264@hcmut.edu.vn        //
// Created On   : Thurday December 12,2019            //
//                                                    //
////////////////////////////////////////////////////////

module fa(output s,output cout, input a,input b,input cin);
wire g,p,gout,pout,c0;
assign g= a&b;
assign p= a^b;

assign c0=cin;
assign pout=p;
assign gout=g;
    
assign s=p^c0;
assign cout=g|(cin&p);

endmodule


module rca8(s,cout,a,b,cin);

output [7:0]s;
output cout;
input cin;
input [7:0]a,b;
wire [8:0]c;
fa  add0(s[0],c[1],a[0],b[0],cin);
fa  add1(s[1],c[2],a[1],b[1],c[1]);
fa  add2(s[2],c[3],a[2],b[2],c[2]);
fa  add3(s[3],c[4],a[3],b[3],c[3]);
fa  add4(s[4],c[5],a[4],b[4],c[4]);
fa  add5(s[5],c[6],a[5],b[5],c[5]);
fa  add6(s[6],c[7],a[6],b[6],c[6]);
fa  add7(s[7],cout,a[7],b[7],c[7]);

endmodule

module rca16(s,cout,a,b,cin);
output [15:0]s;
output cout;
input  [15:0]a,b;
input  cin;

wire    c1;

rca8    add1(s[7:0],c1,a[7:0],b[7:0],cin);
rca8    add2(s[15:8],cout,a[15:8],b[15:8],c1);

endmodule


module vedic4(s,a,b);
output [7:0]s;
input [3:0]a,b;

wire [3:0]s0,s1,s2,s3;
wire [20:0]c;
wire [10:0]temp;

assign s0[0]=a[0]&b[0];
assign s0[1]=a[1]&b[0];
assign s0[2]=a[2]&b[0];
assign s0[3]=a[3]&b[0];
assign s1[0]=a[0]&b[1];
assign s1[1]=a[1]&b[1];
assign s1[2]=a[2]&b[1];
assign s1[3]=a[3]&b[1];
assign s2[0]=a[0]&b[2];
assign s2[1]=a[1]&b[2];
assign s2[2]=a[2]&b[2];
assign s2[3]=a[3]&b[2];
assign s3[0]=a[0]&b[3];
assign s3[1]=a[1]&b[3];
assign s3[2]=a[2]&b[3];
assign s3[3]=a[3]&b[3];

    assign s[0]=s0[0];
fa  num1(s[1],c[0],s0[1],s1[0],1'b0);
fa  num2p(temp[0],c[1],s0[2],s1[1],c[0]);
fa  num2(s[2],c[2],temp[0],s2[0],1'b0);
fa  num3p1(temp[2],c[3],c[2],c[1],s0[3]);
fa  num3p2(temp[3],c[4],s1[2],s2[1],s3[0]);
fa  num3(s[3],c[5],temp[2],temp[3],1'b0);
fa  num4p1(temp[4],c[6],c[4],s1[3],s2[2]);
fa  num4p2(temp[5],c[7],c[5],s3[1],c[3]);
fa  num4(s[4],c[8],temp[4],temp[5],1'b0);
fa  num5p1(temp[6],c[9],c[7],c[8],s2[3]);
fa  num5(s[5],c[10],c[6],s3[2],temp[6]);
fa  num6(s[6],s[7],c[9],c[10],s3[3]);

endmodule

module vedic8(s,a,b);
output [15:0]s;
input [7:0]a,b;
wire [7:0]m0,m1,m2,m3;
wire [7:0]n0,n1,n2,n3;
wire c0,c1,c2;
vedic4  mul0(m0[7:0],a[3:0],b[3:0]);
vedic4  mul1(m1[7:0],a[7:4],b[3:0]);
vedic4  mul2(m2[7:0],a[3:0],b[7:4]);
vedic4  mul3(m3[7:0],a[7:4],b[7:4]);

assign  s[3:0]=m0[3:0];

rca8    add1(n1[7:0],c0,m1[7:0],m2[7:0],1'b0);
rca8    add2(n2[7:0],c1,n1[7:0],{4'b0000,m0[7:4]},1'b0);
assign  c2=c1|c0;
rca8    add3(n3[7:0],c3,m3[7:0],{3'b000,c2,n2[7:4]},1'b0);
assign  s[7:4]=n2[3:0];
assign  s[15:8]=n3[7:0];

endmodule

module vedic24(s,a,b);
output [47:0]s;
input  [23:0]a,b;

wire  [15:0]m0,m1,m2,m3,m4,m5,m6,m7,m8;
wire  [15:0]n0,n1,n2,n3,n4,n5,n6,n7,n8,n9;
wire  c0,c1,c2,c3,c4,c5,c6,c7,c8;

vedic8  mult0(m0[15:0],a[7:0],b[7:0]);
vedic8  mult1(m1[15:0],a[7:0],b[15:8]);
vedic8  mult2(m2[15:0],a[15:8],b[7:0]);
vedic8  mult3(m3[15:0],a[7:0],b[23:16]);
vedic8  mult4(m4[15:0],a[15:8],b[15:8]);
vedic8  mult5(m5[15:0],a[23:16],b[7:0]);
vedic8  mult6(m6[15:0],a[15:8],b[23:16]);
vedic8  mult7(m7[15:0],a[23:16],b[15:8]);
vedic8  mult8(m8[15:0],a[23:16],b[23:16]);

assign s[7:0]=m0[7:0];                                          //1 m0[7:0]
rca16   add0(n0[15:0],c0,{8'd0,m0[15:8]},m1[15:0],1'b0);       
rca16   add1(n1[15:0],c1,n0[15:0],m2[15:0],1'b0);               //2 n1[7:0]
assign  c2=c1|c0;
rca16   add2(n2[15:0],c3,{7'd0,c2,n1[15:8]},m3[15:0],1'b0);
rca16   add3(n3[15:0],c4,m4[15:0],m5[15:0],1'b0);
rca16   add4(n4[15:0],c5,n3[15:0],n2[15:0],1'b0);               //3 n4[7:0]
rca16   add5(n5[15:0],c6,{7'd0,c5,n4[15:8]},m6[15:0],1'b0);
rca16   add6(n6[15:0],c7,n5[15:0],m7[15:0],1'b0);               //4 n6[7:0]
rca16   add7(n7[15:0],,{7'd0,c6,7'd0,c3},{7'd0,c7,7'd0,c4},1'b0);
rca16   add8(n8[15:0],,{8'd0,n6[15:8]},m8[15:0],1'b0);          
rca16   add9(n9[15:0],,n8[15:0],n7[15:0],1'b0);          

assign  s[15:8]=n1[7:0];
assign  s[23:16]=n4[7:0];
assign  s[31:24]=n6[7:0];
assign  s[47:32]=n9[15:0];


endmodule



