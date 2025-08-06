module async_counter (
    input clk,
    input reset,
    output reg [3:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count[0] <= 0;
        else
            count[0] <= ~count[0];
    end

    always @(posedge count[0] or posedge reset) begin
        if (reset)
            count[1] <= 0;
        else
            count[1] <= ~count[1];
    end

    always @(posedge count[1] or posedge reset) begin
        if (reset)
            count[2] <= 0;
        else
            count[2] <= ~count[2];
    end

    always @(posedge count[2] or posedge reset) begin
        if (reset)
            count[3] <= 0;
        else
            count[3] <= ~count[3];
    end
endmodule
