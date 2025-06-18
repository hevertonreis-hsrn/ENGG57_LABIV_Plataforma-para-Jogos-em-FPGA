module top4_sprite_selector (
    input  [17:0] s0_in,
    input  [17:0] s1_in,
    input  [17:0] s2_in,
    input  [17:0] s3_in,
    input  [17:0] s4_in,
    input  [17:0] s5_in,
    input  [17:0] s6_in,
    input  [17:0] s7_in,
    input  [17:0] s8_in,
    input  [17:0] s9_in,
    input  [17:0] s10_in,
    input  [17:0] s11_in,
    input  [17:0] s12_in,
    input  [17:0] s13_in,
    input  [17:0] s14_in,
    input  [17:0] s15_in,
    input  [17:0] s16_in,
    input  [17:0] s17_in,
    input  [17:0] s18_in,
    input  [17:0] s19_in,
    input  [17:0] s20_in,
    input  [17:0] s21_in,
    input  [17:0] s22_in,
    input  [17:0] s23_in,
    input  [17:0] s24_in,
    input  [17:0] s25_in,
    input  [17:0] s26_in,
    input  [17:0] s27_in,
    input  [17:0] s28_in,
    input  [17:0] s29_in,
    input  [17:0] s30_in,
    input  [17:0] s31_in,

    output reg [17:0] h0_out,
    output reg [17:0] h1_out,
    output reg [17:0] h2_out,
    output reg [17:0] h3_out
);

    reg [17:0] top4 [0:3];
    integer count;

    always @* begin
        // Initialize top4 and counter
        top4[0] = 18'd0;
        top4[1] = 18'd0;
        top4[2] = 18'd0;
        top4[3] = 18'd0;
        count = 0;

        if (s31_in != 18'd0 && count < 4) begin top4[count] = s31_in; count = count + 1; end
        if (s30_in != 18'd0 && count < 4) begin top4[count] = s30_in; count = count + 1; end
        if (s29_in != 18'd0 && count < 4) begin top4[count] = s29_in; count = count + 1; end
        if (s28_in != 18'd0 && count < 4) begin top4[count] = s28_in; count = count + 1; end
        if (s27_in != 18'd0 && count < 4) begin top4[count] = s27_in; count = count + 1; end
        if (s26_in != 18'd0 && count < 4) begin top4[count] = s26_in; count = count + 1; end
        if (s25_in != 18'd0 && count < 4) begin top4[count] = s25_in; count = count + 1; end
        if (s24_in != 18'd0 && count < 4) begin top4[count] = s24_in; count = count + 1; end
        if (s23_in != 18'd0 && count < 4) begin top4[count] = s23_in; count = count + 1; end
        if (s22_in != 18'd0 && count < 4) begin top4[count] = s22_in; count = count + 1; end
        if (s21_in != 18'd0 && count < 4) begin top4[count] = s21_in; count = count + 1; end
        if (s20_in != 18'd0 && count < 4) begin top4[count] = s20_in; count = count + 1; end
        if (s19_in != 18'd0 && count < 4) begin top4[count] = s19_in; count = count + 1; end
        if (s18_in != 18'd0 && count < 4) begin top4[count] = s18_in; count = count + 1; end
        if (s17_in != 18'd0 && count < 4) begin top4[count] = s17_in; count = count + 1; end
        if (s16_in != 18'd0 && count < 4) begin top4[count] = s16_in; count = count + 1; end
        if (s15_in != 18'd0 && count < 4) begin top4[count] = s15_in; count = count + 1; end
        if (s14_in != 18'd0 && count < 4) begin top4[count] = s14_in; count = count + 1; end
        if (s13_in != 18'd0 && count < 4) begin top4[count] = s13_in; count = count + 1; end
        if (s12_in != 18'd0 && count < 4) begin top4[count] = s12_in; count = count + 1; end
        if (s11_in != 18'd0 && count < 4) begin top4[count] = s11_in; count = count + 1; end
        if (s10_in != 18'd0 && count < 4) begin top4[count] = s10_in; count = count + 1; end
        if (s9_in  != 18'd0 && count < 4) begin top4[count] = s9_in;  count = count + 1; end
        if (s8_in  != 18'd0 && count < 4) begin top4[count] = s8_in;  count = count + 1; end
        if (s7_in  != 18'd0 && count < 4) begin top4[count] = s7_in;  count = count + 1; end
        if (s6_in  != 18'd0 && count < 4) begin top4[count] = s6_in;  count = count + 1; end
        if (s5_in  != 18'd0 && count < 4) begin top4[count] = s5_in;  count = count + 1; end
        if (s4_in  != 18'd0 && count < 4) begin top4[count] = s4_in;  count = count + 1; end
        if (s3_in  != 18'd0 && count < 4) begin top4[count] = s3_in;  count = count + 1; end
        if (s2_in  != 18'd0 && count < 4) begin top4[count] = s2_in;  count = count + 1; end
        if (s1_in  != 18'd0 && count < 4) begin top4[count] = s1_in;  count = count + 1; end
        if (s0_in  != 18'd0 && count < 4) begin top4[count] = s0_in;  count = count + 1; end
    end

    // Output assignment (priority from highest to lowest)
    always @* begin
        h3_out = top4[0];
        h2_out = top4[1];
        h1_out = top4[2];
        h0_out = top4[3];
    end

endmodule
