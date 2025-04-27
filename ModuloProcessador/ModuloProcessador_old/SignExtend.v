module SignExtend (
    input wire [15:0] immediate,         
    output wire [31:0] signExtImm        
);

    assign signExtImm = {{16{immediate[15]}}, immediate};

endmodule