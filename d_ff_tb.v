module d_f_tb;
  reg d,clk,rst;
  wire q;
  d_f ak(.d(d),.clk(clk),.rst(rst),.q(q));
  initial fork
      clk=0;
      rst=0;
     d=0;
    repeat(10)
        #20 clk=~clk;
    repeat(10)#20 rst=~rst;
  repeat(10)  #20 d=~d;
      join 
  initial begin
    $monitor("t=%0t,d=%b,clk=%b,rst=%b,q=%b",$time,d,clk,rst,q);
    $dumpfile("df.vcd");
    $dumpvars(0);
  end
 endmodule
      
