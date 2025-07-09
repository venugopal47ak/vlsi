module d_f(d,clk,rst,q);
  input d,clk,rst;
  output q;
  reg d,clk,rst,q;
  always @(posedge clk or posedge rst)
    begin
      if(!rst)
        q<=0;
      else
        if(d==0)
          q<=0;
      else
        q<=1;
    end
endmodule

  