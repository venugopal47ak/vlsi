module fsm_1_tb;
  reg go,ws,clk,rst_n;
  wire  ds,rd;
  fsm_1 uut(.go(go),.ws(ws),.clk(clk),.rst_n(rst_n));
 initial begin
    clk=1;
    rst_n=1;
   go=0;
   ws=0;

  
   
   
 end
  
  always begin #5 clk=~clk;
    #5 rst_n=~rst_n;
    #5 go=~go;
    #5 ws=~ws;
  
   
  end
  initial begin
    $monitor("t=%0b,go=%b,ws=%b,clk=%b,rst_n=%b,ds=%b,rd=%b",$time,go,ws,clk,rst_n,ds,rd);
    
    $dumpfile("fsm.vcd");
    $dumpvars;
    
    #100
    $finish;
  end
endmodule

