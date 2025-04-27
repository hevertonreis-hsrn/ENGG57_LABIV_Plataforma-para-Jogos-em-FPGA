module Stack (
    input wire clk,
    input wire rst,
    input wire push,
    input wire pop,
    input wire [7:0] data_in,
    output reg [7:0] data_out,  // Agora é reg, sempre consistente
    output reg empty,
    output reg full
);
    parameter STACK_DEPTH = 32;
    reg [7:0] stack_mem [0:STACK_DEPTH-1];
    reg [4:0] sp;

    always @(posedge clk) begin
        if (rst) begin
            sp <= 0;
            empty <= 1;
            full <= 0;
            data_out <= 8'b0;
        end else begin
            if (push && !full) begin
                stack_mem[sp] <= data_in;
                sp <= sp + 5'd1;
                data_out <= data_in;  // Atualiza o topo
            end else if (pop && !empty) begin
                sp <= sp - 5'd1;
                data_out <= stack_mem[sp - 1]; // Captura o novo topo antes de mudar sp
            end

            empty <= (sp == 0);
            full <= (sp == STACK_DEPTH);
        end
    end
endmodule
