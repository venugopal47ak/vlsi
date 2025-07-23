module clk_div (
    input clk_in, rst,
    output reg clk_out
    );

  always @ (posedge(clk_in), posedge(rst))
begin
  if (rst) clk_out <= 0;
    else clk_out <= !clk_out;
end
endmodule
