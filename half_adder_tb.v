module half_adder_tb;
  reg a,b;
  wire sum,carry;
  half_adder g1(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
    );
  
  
    
  initial begin
    a=0;b=0;
    #10 a=0; b=1;
    #10 a=1; b=0;
    #10 a=1; b=1;
    
    end
  initial begin 
    $monitor("t=%0t,a=%0b,b=%0b,sum=%0b,carry=%0b",$time,a,b,sum,carry);
    $dumpfile("half_a.vcd");
    $dumpvars(1);
              
  end
  
    
endmodule
