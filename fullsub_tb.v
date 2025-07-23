module full_sub_tb;
  reg x,y,bin;
  wire br,d;
  full_sub g1(
    x,y,bin,br,d
  );
  
  
  initial begin
    x=0; y=0; bin=0;
    #10; x=0; y=0; bin=1;
    #10; x=0; y=1; bin=0;
    #10; x=0; y=1; bin=1;
    #10; x=1; y=0; bin=0;
    #10; x=1; y=0; bin=1;
    #10; x=1; y=1; bin=0;
    #10; x=1; y=1; bin=1;
  end
  initial begin
    $monitor("t=%t,x=%0b,y=%0b,bin=%ob,br=%ob,d=%0b",$time,x,y,bin,br,d);
    $dumpfile("full.vcd");
    $dumpvars(1);
              end
              endmodule
