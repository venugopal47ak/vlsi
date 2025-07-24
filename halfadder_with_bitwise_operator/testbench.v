module hs_bw_tb;
  reg a,b;
  wire sum,cout;
  hs_bw hs(a,b,sum,cout);
  initial begin
     a=0;b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
  end
  initial begin
    $monitor("t=%t,a=%b,b=%b,sum=%b,cout=%b",$time,a,b,sum,cout);
    $dumpfile("hs.vcd");
    $dumpvars();
  end
endmodule

    
