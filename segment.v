module sev_seg (
  input clk,
  input rst_n,
  input [3:0] digit,      
  output reg [7:0] seg,   
  output reg [3:0] out    
);

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      seg <= 8'b11111111;
      out <= 4'b1111;
    end else begin
      case (digit)
        4'h0: seg = 8'b11000000;
        4'h1: seg = 8'b11111001;
        4'h2: seg = 8'b10100100;
        4'h3: seg = 8'b10110000;
        4'h4: seg = 8'b10011001;
        4'h5: seg = 8'b10010010;
        4'h6: seg = 8'b10000010;
        4'h7: seg = 8'b11111000;
        4'h8: seg = 8'b10000000;
        4'h9: seg = 8'b10010000;
        4'hA: seg = 8'b10001000;
        4'hB: seg = 8'b10000011;
        4'hC: seg = 8'b11000110;
        4'hD: seg = 8'b10100001;
        4'hE: seg = 8'b10000110;
        4'hF: seg = 8'b10001110;
        default: seg = 8'b11111111;
      endcase
      out = 4'b1110; 
    end
  end

endmodule
