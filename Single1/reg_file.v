module #(parameter WIDTH = 32) reg_file(
    input  clk, reset,
    input  [4 : 0]rs1_addr,  rs2_addr, rd_addr,
    input  reg_write,
    input  [WIDTH - 1 : 0]wr_data,
    output [WIDTH - 1 : 0]rs1_data, rs2_data
);

parameter n_regs = 32,

reg [WIDTH - 1 : 0]reg_file_array[0 : n_regs - 1];

always @(posedge clk or negedge reset) begin
    if(!reset) begin
        for(int i = 0; i < n_regs; i++) begin
            reg_file_array[i] = 0;
        end
    end
    else begin
        if(reg_write) reg_file_array[rd_addr] = wr_data;
    end
end

assign rs1_data = reg_file_array[rs1_addr];
assign rs2_data = reg_file_array[rs2_addr];

endmodule