module mux_2to1(
	input logic sel,
	input logic In_0,
	input logic In_1,
	output logic data_out);
	
	// Multiplexor 2 a 1
	
	always_comb begin
		case (sel)
			1'b0: begin
				data_out <= In_0;
			end
			1'b1: begin
				data_out <= In_1;
			end			
		endcase
	end
endmodule