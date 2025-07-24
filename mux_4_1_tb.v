module mux_4_1_tb;
  reg i0,i1,i2,i3;
  reg s0,s1;
  wire out;
  mux_4_1 ak2(i0,i1,i2,i3,s0,s1,out);
  initial begin
    i0=1;i1=2;i2=3;i3=4;
    #10 i0=2;i1=3;i2=4;i3=5;
    #10 i0=3;i1=4;i2=5;i3=6;
  end
   initial begin 
    s0=0;s1=0;
    #10 s0=0;s1=1;
    #10 s0=1;s1=0;
    #10 s0=1;s1=1;
  end
  initial begin
    $dumpfile("ak.vcd");
    $dumpvars;
  end
endmodule
