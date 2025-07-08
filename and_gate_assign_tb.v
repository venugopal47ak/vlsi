module and_tb;
reg a,b;
wire c;
and_gate_p and2(.a(a),
                     .b(b),
                     .c(c)
              );
              initial begin
                      $dumpfile("and1_tb.vcd");
                      $dumpvars;
                      $monitor("time=%0t | a=%b b=%b c=%b", $time,a,b,c);
                          a=0; b=0;
                      #10 a=0; b=1;
                      #10 a=1; b=0;
                      #10 a=1; b=1;
                      #10;
$finish;
              end 
endmodule