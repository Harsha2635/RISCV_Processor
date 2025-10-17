module #(parameter WIDTH = 32)alu(
    input  [WIDTH-1:0] a, b,
    input  [3:0] alu_control,
    output reg [WIDTH-1:0] alu_result,
    output zero, msb, sltu
);

    always @(*) begin
        case(alu_control)
            4'b0000 : result = a + b;        //add
            4'b0001 : result = a + ~b + 1;   //sub
            4'b0010 : result = a << b;       //sll
            4'b0011 : begin                  //slt
                if(a[WIDTH-1] != b[WIDTH-1]) result = a[WIDTH-1] ? 1 : 0;
                else result = (a < b) ? 1 : 0;
            end
            4'b0100 : result = (a < b) ? 1 : 0;//sltu
            4'b0101 : result = a^b;            //xor
            4'b0110 : result = a >> b;         //srl
            4'b0111 : result = $signed(a) >>> b ;//sra
            4'b1000 : result = a|b;            //or
            4'b1001 : result = a&b;            //and
            default : result = x;
        endcase
    end

    assign zero = (result==0) ? 1 : 0;
    assign msb  = result[WIDTH-1];
    assign sltu = (a<b);
    
endmodule