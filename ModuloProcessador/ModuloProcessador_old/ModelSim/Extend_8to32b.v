module Extend_8to32 (
    input wire [7:0] immediate,         
    output wire [31:0] signExtImm        
);

    assign signExtImm = {{16{immediate[7]}}, immediate};

endmodule