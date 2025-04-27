module RFlagsRegister(
    input wire clk,
    input wire rst,
    input wire [6:0] RFlags_in,          // Flags vindas da ALU
    output reg [6:0] RFlags_out         // Flags armazenadas
);

    always @(posedge clk) begin
        if (rst)
            RFlags_out <= 7'b0000000;
        else
            RFlags_out <= RFlags_in;
    end

endmodule
