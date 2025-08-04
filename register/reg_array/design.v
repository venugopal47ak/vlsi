module register_file (
    input clk,
    input [2:0] read_addr1, read_addr2, write_addr,
    input [7:0] write_data,
    input write_enable,
    output [7:0] read_data1, read_data2
);


    always @(posedge clk) begin
        if (write_enable)
            mem[write_addr] <= write_data;
    end


    assign read_data1 = mem[read_addr1];
    assign read_data2 = mem[read_addr2];
endmodule
