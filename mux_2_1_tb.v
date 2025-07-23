module mux_tb;
  reg i0, i1, s1;
  wire y;
  
  mux_2_1 mux(.s1(s1),.i0(i0),.i1(i1),.y(y));
  initial begin
    i0 = 0; i1 = 1;
    s1 = 0;
    #1;
    s1 = 1;
  end
  initial begin
    $dumpfile("ak.vcd");
    $dumpvars();
  end
endmodule
