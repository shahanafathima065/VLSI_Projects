`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2026 19:59:45
// Design Name: 
// Module Name: tb_counter4
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

module tb_counter4;
    reg        clk;
    reg        reset;
    wire [3:0] count;
    reg  [3:0] expected;   
    integer    i, errors;

   
    counter4 dut (.clk(clk), .reset(reset), .count(count));

 
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        errors   = 0;
        expected = 4'd0;
        reset    = 1;       

      
        @(posedge clk);
        @(posedge clk);
        #1;
        if (count !== 4'd0) begin
            errors = errors + 1;
            $display("ERROR: after reset, count should be 0 but is %d", count);
        end

        reset = 0;          
      
        for (i = 0; i < 40; i = i + 1) begin
            @(posedge clk);
            #1;
            expected = expected + 1;
            if (count !== expected) begin
                errors = errors + 1;
                $display("ERROR: expected %d but got %d", expected, count);
            end
        end

       
        reset = 1;
        @(posedge clk);
        #1;
        expected = 4'd0;
        if (count !== expected) begin
            errors = errors + 1;
            $display("ERROR: reset in the middle failed, got %d", count);
        end
        reset = 0;

       
        for (i = 0; i < 5; i = i + 1) begin
            @(posedge clk);
            #1;
            expected = expected + 1;
            if (count !== expected) begin
                errors = errors + 1;
                $display("ERROR: expected %d but got %d", expected, count);
            end
        end

        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%d TESTS FAILED", errors);
        $finish;
    end
endmodule