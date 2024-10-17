// Question 1
module alu (A, B, Y, sel);
	input [7:0] A,B;
	input [3:0] sel;
	output reg [7:0] Y;
	
	always @(*)
	begin
    3'b000 : 
       begin 
        Y = 8`b00000000; 
        end
   3'b001 : 
       begin 
        Y = A & B;
        End
   3'b010 : 
       begin 
        Y = A | B;
        end
   3'b011 : 
       begin 
        Y = A ^ B;
        end
   3'b100 : 
       begin 
        Y = ~A;
        end
   3'b101 : 
       begin 
        Y = A - B;
        end
   3'b110 : 
       begin 
        Y = A + B;
        End
   3'b111 : 
       begin 
        Y =8`hFF;
        end
 endcase
end
endmodule

// Question 2
module gate_level(a,b,c,d,f);
	input a,b,c,d;
	output f;
	
	wire not_a;
	wire not_d;
	wire and1;
	wire and2;
	wire or1;

	not(not_a, a);
	not(not_d, d);
	
	or(or1, not_a, d);
	and(and1, b, c, not_d);
	and(f, or1,and1);
endmodule

module dataflow(a,b,c,d,f);
	input a,b,c,d;
	output f;
	
	assign f = (b & c & ~d) & (~a | d);
endmodule

`timescale 1ns / 1ps

module tb_dataaflow;
    reg a, b, c, d; 
    wire f;     

    question2_dataflow uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .f(f)
    );

    initial begin
        $monitor("Time: %0t | a: %b, b: %b, c: %b, d: %b | f: %b", $time, a, b, c, d, f);
        a = 0; b = 0; c = 0; d = 0; #10; // 0
        a = 0; b = 0; c = 0; d = 1; #10; // 1
        a = 0; b = 0; c = 1; d = 0; #10; // 2
        a = 0; b = 0; c = 1; d = 1; #10; // 3
        a = 0; b = 1; c = 0; d = 0; #10; // 4
        a = 0; b = 1; c = 0; d = 1; #10; // 5
        a = 0; b = 1; c = 1; d = 0; #10; // 6
        a = 0; b = 1; c = 1; d = 1; #10; // 7
        a = 1; b = 0; c = 0; d = 0; #10; // 8
        a = 1; b = 0; c = 0; d = 1; #10; // 9
        a = 1; b = 0; c = 1; d = 0; #10; // 10
        a = 1; b = 0; c = 1; d = 1; #10; // 11
        a = 1; b = 1; c = 0; d = 0; #10; // 12
        a = 1; b = 1; c = 0; d = 1; #10; // 13
        a = 1; b = 1; c = 1; d = 0; #10; // 14
        a = 1; b = 1; c = 1; d = 1; #10; // 15
        $finish;
    end
endmodule

// Question 4
module question4 (
    output reg Y,
    input X,
    input clock,
    input reset
);
    reg [2:0] state, next_state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
	
    always @(*) begin
        case (state)
            S0: next_state = (X) ? S4 : S3;
            S1: next_state = (X) ? S4 : S1;
            S2: next_state = (X) ? S0 : S2;
            S3: next_state = (X) ? S2 : S1;
            S4: next_state = (X) ? S3 : S2;
            default: next_state = S0; // Default case for safety
        endcase
    end

    always @(*) begin
        case (state)
            S0: Y = X;
            S1: Y = X;
            S2: Y = X;
            S3: Y = X;
            S4: Y = 0;
            default: Y = 0; // Default case for safety
        endcase
    end
endmodule

   	