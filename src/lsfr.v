module lfsr (
    output reg [3:0] out, // 4-bit output
    input clk,            // Clock input
    input rst             // Reset input
);

    wire feedback;

    // Feedback function for LFSR (XOR of bit positions 4 and 3, then negated)
    assign feedback = ~(out[3] ^ out[2]);

    // Sequential logic to shift the LFSR and insert the feedback bit
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out <= 4'b0; // Reset LFSR to 0
        end else begin
            out <= {out[2:0], feedback}; // Shift left and insert feedback
        end
    end

endmodule
