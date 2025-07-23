module mux_2_1(
  input s1,i0, i1,
 output reg y);
  assign y = s1 ? i1 : i0;
endmodule
