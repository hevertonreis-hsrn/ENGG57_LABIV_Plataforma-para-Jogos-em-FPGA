module MemAddressFormat (
    input  wire [31:0] data_in,  // Entrada de 32 bits
    output wire [7:0]  data_out  // Saída com os 8 bits mais significativos
);

    // Atribui os bits [31:24] da entrada à saída
    assign data_out = data_in[7:0];

endmodule
