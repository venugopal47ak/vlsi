module elevator_fsm (
    input clk,
    input reset,
    input up,
    input down,
    output reg [1:0] floor
);
    typedef enum reg [1:0] {FLOOR_0 = 2'b00, FLOOR_1 = 2'b01} state_t;
    state_t state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= FLOOR_0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            FLOOR_0: next_state = up ? FLOOR_1 : FLOOR_0;
            FLOOR_1: next_state = down ? FLOOR_0 : FLOOR_1;
            default: next_state = FLOOR_0;
        endcase
    end

    always @(*) begin
        floor = state;
    end
endmodule
