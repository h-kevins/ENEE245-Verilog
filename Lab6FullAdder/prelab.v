module prelab(x, y, Cin, Cout, Sum);
	input x, y, Cin;
	output Cout, Sum;
	
	assign Sum = (x ^ y) ^ Cin;
	assign Cout = ((x ^ y) & Cin) | (x & y);
endmodule

/*
x   y   Cin   Cout  Sum 
0   0   0     0     0   
0   0   1     0     1   
0   1   0     0     1   
0   1   1     1     0   
1   0   0     0     1   
1   0   1     1     0   
1   1   0     1     0   
1   1   1     1     1   
*/