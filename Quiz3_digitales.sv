module Quiz3_digitales(input logic rst,clk,finished, a, b, output logic encender);

	logic dos_p;
	logic [3:0] bits;
	logic serial_in;
	
	logic prev_a;
	logic prev_b;
	
	logic clk_r;
	
	logic [2:0] suma;
	
	assign suma = bits[0] + bits[1] + bits[2] + bits[3];
	assign dos_p = (suma >= 2);
	
	assign clk_r = ((a & !prev_a) | (b & !prev_b)) & clk;
	always_ff @(posedge clk) begin
		prev_a <= a;
		prev_b <= b;
	end
	
	FSM fsm(
				.clk(clk), 
				.rst(rst),
				.finalizar(finished), 
				.dos_p(dos_p),
				.encender(encender)
				);

	SerialInputRegister SerialRegister(
    .clk(clk_r),  
    .reset(rst),   
    .serial_in(serial_in), 
    .data_out(bits) 
	);

	mux_2to1 mux_input(
		.sel(a),
		.In_0(~b),
		.In_1(a),
		.data_out(serial_in));
	
endmodule