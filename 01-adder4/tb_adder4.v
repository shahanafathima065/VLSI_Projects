`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2026 18:58:25
// Design Name: 
// Module Name: tb_adder4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_adder4;
    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;
    integer i, j, k, errors;

 
    adder4 uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        errors = 0;
        // every possible input: 16 x 16 x 2 = 512 cases
        for (i = 0; i < 16; i = i + 1)
            for (j = 0; j < 16; j = j + 1)
                for (k = 0; k < 2; k = k + 1) begin
                    a = i; b = j; cin = k;
                    #10; 
                    if ({cout, sum} !== (a + b + cin)) begin
                        errors = errors + 1;
                        $display("ERROR: %d + %d + %d gave %d", a, b, cin, {cout, sum});
                    end
                end

        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%d TESTS FAILED", errors);
        $finish;
    end
endmodule
