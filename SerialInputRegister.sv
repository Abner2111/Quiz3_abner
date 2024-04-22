module SerialInputRegister (
    input wire clk,      // Clock input
    input wire reset,    // Reset input
    input wire serial_in, // Serial input
    output reg [3:0] data_out // Output data
);

// Internal register for storing data
reg [3:0] reg_data;

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset the register
        reg_data <= 4'b0000;
    end else begin
        // Shift the register right by 1 bit and assign serial_in to the "LSB"
        reg_data <= {serial_in,reg_data[3:1]};
    end
end

assign data_out = reg_data; // Output data is the register value

endmodule
