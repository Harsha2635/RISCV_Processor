module #parameter(WIDTH=32)datapath(
    input  clk, reset,
    input  [31:0]instr,
    input  pc_src,
    input  [1:0]result_src,
    input  mem_write,
    input  [3:0]alu_control,
    input  alu_src,
    input  [1:0]imm_src,
    input  reg_write,
    input  [WIDTH-1:0]read_data,
    output [WIDTH-1:0]PC,
    output zero, msb, sltu, 
    output [WIDTH-1:0]mem_wr_data,
    output [WIDTH-1:0]mem_wr_addr,
    output [WIDTH-1:0]result
);

always @(negedge reset) begin
    PC = 0;
end

//PC-Logic
mux2 #(WIDTH) main_pc_mux(pc_plus_4, pc_target, pc_src, pc_next);

adder #(WIDTH) pc_plus_4_adder()


endmodule