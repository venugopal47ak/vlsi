module d_latch_tb;
  reg d,en,rstn;
  reg[2:0] d1;
  reg[1:0]d2;
  integer i;
  d_latch abc(.d(d),.en(en),.rstn(rstn),.q(q));
              initial begin
                d<=0;
                en<=0;
                rstn<=0;
                #10 rstn<=1;
                for(i=0;i<5;i=i+1)begin;
                d1=$random;
                d2=$random;
                #(d2)en<=~en;
                  #(d1)d<=i;
                end
              end
                initial begin
                   $dumpfile("d_latch.vcd");
                  $dumpvars();
                
                end
              
              endmodule
                
                
