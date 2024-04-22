module general_tb();
	logic clk, rst,finished, a, b,encender;
	Quiz3_digitales sistema (.rst(rst),.clk(clk),.finished(finished), .a(a), .b(b), .encender(encender));
	always begin
		#5 clk = ~clk;
	end
	
	initial begin
	
		clk = 0;
		rst = 1;
		finished = 0;
		a = 0;
		b = 0;
		#20;
		rst=0;
		
		#20
		a = 1;
		#20
		a = 0;
		#20
		b = 1;
		#20
		b = 0;
		#20
		b = 1;
		#20
		b = 0;
		#20
		b = 1;
		#20
		b = 0;
		#20
		finished = 1;
		#20
		finished = 0;
		rst = 1;
		
		#20;
		rst=0;
		
		#20
		a = 1;
		#20
		a = 0;
		#20
		b = 1;
		#20
		b = 0;
		#20
		b = 1;
		#20
		b = 0;
		#20
		a = 1;
		#20
		a = 0;
		#20
		finished = 1;
		#20
		finished = 0;
		
		$stop;
	end
endmodule