

module tb_simple_comparator;

    reg [3:0] A, B;
    wire A_greater, A_equal, A_less;

   
    simple_comparator sc (
        .A(A),
        .B(B),
        .A_greater(A_greater),
        .A_equal(A_equal),
        .A_less(A_less)
    );

    initial begin
        
        A = 4;  B = 7;  #10;
        A = 8;  B = 3;  #10;
        A = 5;  B = 5;  #10;
        A = 0;  B = 15; #10;
        A = 15; B = 0;  #10;
      $dumpfile("sc.vcd");
      $dumpvars;


        $finish;
    end

endmodule
