`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2026 19:28:28
// Design Name: 
// Module Name: counter4
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

module counter4 (
    input            clk,    
    input            reset,   
    output reg [3:0] count    
);

    always @(posedge clk) begin
        if (reset)
            count <= 4'd0;
        else
            count <= count + 1;
    end

endmodule
