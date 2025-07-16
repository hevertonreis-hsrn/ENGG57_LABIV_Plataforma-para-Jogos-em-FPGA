module sprite_rom_4port (
    input wire clk,
    input wire [15:0] addr0_in,
    input wire [15:0] addr1_in,
    input wire [15:0] addr2_in,
    input wire [15:0] addr3_in,
    output reg [23:0] data0_out,
    output reg [23:0] data1_out,
    output reg [23:0] data2_out,
    output reg [23:0] data3_out
);

    // Memória ROM: 65536 palavras de 24 bits
    reg [23:0] memory [0:1023];

    // Inicialização da ROM via arquivo .hex
    initial begin
        $readmemh("sprites.hex", memory);
    end

    // Acesso síncrono
    always @(posedge clk) begin
        data0_out <= memory[addr0_in];
        data1_out <= memory[addr1_in];
        data2_out <= memory[addr2_in];
        data3_out <= memory[addr3_in];
    end

endmodule
