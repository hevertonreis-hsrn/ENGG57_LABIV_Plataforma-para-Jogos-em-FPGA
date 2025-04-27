module ResetSync (
    input wire clk,            // Clock do sistema
    input wire rst_async,      // Reset assíncrono ativo baixo
    output wire rst_sync       // Reset sincronizado ativo alto
);

    reg sync1, sync2;

    // Sincronização de reset assíncrono usando dois flip-flops
    always @(posedge clk or negedge rst_async) begin
        if (!rst_async) begin
            sync1 <= 1'b0; // Reset imediato dos FFs (reset ativo)
            sync2 <= 1'b0;
        end else begin
            sync1 <= 1'b1;        // Após reset assíncrono ser desativado,
            sync2 <= sync1;       // os sinais vão sendo propagados com o clock
        end
    end

    // Reset sincronizado (ativo alto)
    assign rst_sync = ~sync2;

endmodule
