// Memory stall unit: cuida só de memória
module MemoryStallUnit(
    input wire mem_ready,
    output wire memory_stall
);
    assign memory_stall = ~mem_ready;
endmodule
