`timescale 1s / 1ns
module main (SW, LEDG, HEX0);
    input [1:0] SW; // Declare two inputs: SW[1] and SW[0]
    output [0:0] LEDG; // Declare one output: LEDG[0]
    output [6:0] HEX0; // Declare output for 7-segment display

    wire w1;
 
    light (SW[0], SW[1], w1);
    
    assign LEDG[0] = w1;
    display disp (w1, HEX0);
endmodule

module light (x1, x2, f);
    input x1, x2;
    output f;
    assign f = (x1 & ~x2) | (~x1 & x2); // XOR logic
endmodule

module display (out, HEX0);
    input out; 
    output reg [6:0] HEX0;
	 
    always @(*) begin
        if (out == 0)
            HEX0 = 7'b1000000; // If out is 0, HEX0 will display 0
        else
            HEX0 = 7'b1111001; // If out is 1, HEX0 will display 1
    end
endmodule
