module background_fifo_reader (
    input  wire        clk,
    input  wire        rst_n,

    // FIFO de entrada
    input  wire        rdempty,
    input  wire [23:0] q,
    output wire        rdreq,

    // Controle externo
    input  wire        next_pixel,      // Pulso: avançar leitura

    output wire [23:0] bg_pixel_out,
    output wire        ready            // Indica que bg_pixel_out é válido
);
    // A leitura da FIFO ocorre apenas quando solicitado
    assign rdreq = next_pixel && !rdempty;

    // O dado é imediatamente repassado
    assign bg_pixel_out = q;
    assign ready = !rdempty;  // Está pronto quando há dado

endmodule
