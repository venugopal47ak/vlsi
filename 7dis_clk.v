module dis (
    input clk,                         
  input [3:0] data_in,               
  output reg [6:0] seg,          
    output reg [3:0] digit_select       
);

    reg [1:0] digit_index = 0;
    reg [3:0] current_digit;
    reg [15:0] refresh_counter = 0;
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        if (refresh_counter == 0) begin
            digit_index <= digit_index + 1;
        end
    end
    always @(*) begin
        case (digit_index)
            2'd0: current_digit = data_in[3:0];
            2'd1: current_digit = data_in[7:4];
            2'd2: current_digit = data_in[11:8];
            2'd3: current_digit = data_in[15:12];
        endcase
    end

    
    always @(*) begin
        digit_select = 4'b1111;  
        digit_select[digit_index] = 0;  
    end
    always @(*) begin
        case (current_digit)
            4'd0: seg = 7'b1111110;
            4'd1: seg = 7'b0110000;
            4'd2: seg = 7'b1101101;
            4'd3: seg = 7'b1111001;
            4'd4: seg = 7'b0110011;
            4'd5: seg = 7'b1011011;
            4'd6: seg = 7'b1011111;
            4'd7: seg = 7'b1110000;
            4'd8: seg = 7'b1111111;
            4'd9: seg = 7'b1111011;
            default: seg = 7'b0000001; 
        endcase
    end

endmodule
