module sequence_detector_1011 (
    input clk,
    input reset,
    input in_bit,
    output reg detected
);
    typedef enum reg [2:0] {
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100
    } state_t;

    state_t state, next_state;

    
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    
    always @(*) begin
        case (state)
            S0: next_state = (in_bit == 1) ? S1 : S0;
            S1: next_state = (in_bit == 0) ? S2 : S1;
            S2: next_state = (in_bit == 1) ? S3 : S0;
            S3: next_state = (in_bit == 1) ? S4 : S2;
            S4: next_state = (in_bit == 1) ? S1 : S2; 
            default: next_state = S0;
        endcase
    end


    always @(*) begin
        detected = (state == S4) ? 1 : 0;
    end
endmodule
