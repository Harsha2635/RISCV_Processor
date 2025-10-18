module riscv_cpu #(parameter WIDTH=32)(
    input  clk, reset,
    input  [31:0]instr,
    input  [WIDTH-1:0]read_data,
    output [WIDTH-1:0]pc,
    output [WIDTH-1:0]mem_wr_addr,
    output [WIDTH-1:0]mem_wr_data,
    output mem_write,
    output [2:0]funct3,
    output [WIDTH-1:0]result
);

//Intermediate wires
wire pc_src, alu_src, reg_write;
wire [1:0]result_src, imm_src;
wire [3:0]alu_control;
wire zero, msb, sltu;

//datapath instantiation
datapath #(WIDTH) dp(clk, reset, instr, pc_src, result_src, mem_write, alu_control, alu_src, imm_src, reg_write, read_data, pc, zero, msb, sltu, mem_wr_addr, mem_wr_data, result);

//controller instantiation
controller cp(instr[6:0], instr[14:12], instr[30], instr[5], zero, msb, sltu, pc_src, result_src, mem_write, alu_control, alu_src, imm_src, reg_write);

assign funct3 = instr[14:12];

endmodule