// Code your design here
module uart_tx (
    input clk, reset, start,
    input [7:0] data,
    output reg tx,
    output reg busy
);
    reg [3:0] bit_cnt;
    reg [9:0] shift;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tx <= 1;
            busy <= 0;
            bit_cnt <= 0;
        end else if (start && !busy) begin
            shift <= {1'b1, data, 1'b0}; // stop + data + start
            bit_cnt <= 10;
            busy <= 1;
        end else if (busy) begin
            tx <= shift[0];
            shift <= shift >> 1;
            bit_cnt <= bit_cnt - 1;
            if (bit_cnt == 1)
                busy <= 0;
        end
    end
endmodule
