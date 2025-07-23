module single_port_ram_tb;
  reg [7:0] data; 
  reg [5:0] addr; 
  reg we; 
  reg clk; 
  wire [7:0] q; 
  
  single_port_ram spr1(
    .data(data),
    .addr(addr),
    .we(we),
    .clk(clk),
    .q(q)
  );
  
  initial
    begin
      $monitor("t=%0t,data=%b,addr=%b,we=%b,clk=%b,q=%b",$time,data,addr,we,clk,q);
      $dumpfile("dump.vcd");
      $dumpvars(1);       
      
   clk=1;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      data = 8'h01;
      addr = 5'd0;
      we = 1'b1;
      #10;
           
	  data = 8'h02;
      addr = 5'd1;     
      #10;
      
      data = 8'h03;
      addr = 5'd2;     
      #10;
      
      addr = 5'd0;
      we = 1'b0;
      #10;
      
      addr = 5'd1;
      #10;
      
      addr = 5'd2;
      #10;
      
      data = 8'h04;
      addr = 5'd1;
      we = 1'b1;
      #10;
      
      addr = 5'd1;
      we = 1'b0;
      #10;
      
      addr = 5'd3;
      #10;
    #90 $stop;
    end
  
endmodule
