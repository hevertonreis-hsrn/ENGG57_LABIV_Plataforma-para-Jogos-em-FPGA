module ResetSync (
    input wire clk,
    input wire rst_async,
    output wire rst_sync
);
    reg sync1, sync2;

    always @(posedge clk or negedge rst_async) begin
        if(!rst_async) begin
            sync1 <= 1'b0; // Sincroniza o reset assíncrono
            sync2 <= 1'b0; // Mantém o estado alto até o próximo clock
        end else begin
            sync1 <= 1'b1; // Reseta o sinal sincronizado
            sync2 <= sync1; // Passa o valor do primeiro flip-flop para o segundo
        end
    end

    assign rst_sync = ~sync2;
endmodule
