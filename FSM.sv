module FSM(input logic clk, rst, finalizar, dos_p,
				output logic encender);

	logic [1:0] state, next_state;

	always @(posedge clk or posedge rst)
		if(rst) state = 0;
		else
			state = next_state;

	always_comb
		case(state)
			0: if(finalizar)  next_state = 1; else next_state = 0;
			1: if(dos_p) 		next_state = 2; else next_state = 1;
			2: next_state = 2;
			default: next_state = 0;
		endcase

	assign encender = (state == 2);

endmodule