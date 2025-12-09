`timescale 1ns/1ps

module alu_tb;

    // Inputs to ALU (reg because we drive them)
    reg  [31:0] A, B;
    reg  [2:0]  ALUControl;

    // Outputs from ALU (wire because ALU drives them)
    wire [31:0] Result;
    wire OverFlow, Carry, Zero, Negative;

    // Instantiate ALU
    ALU dut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .OverFlow(OverFlow),
        .Carry(Carry),
        .Zero(Zero),
        .Negative(Negative)
    );

    // Test procedure
    initial begin
        $display("Starting ALU Testbench...");
        
        // -------------------------
        // ADD operation (000)
        // -------------------------
        A = 32'd5;
        B = 32'd7;
        ALUControl = 3'b000;
        #10;
        $display("ADD: 5 + 7 = %0d, Result=%0d Carry=%b Overflow=%b", A, B, Result, Carry, OverFlow);

        // -------------------------
        // SUB operation (001)
        // -------------------------
        A = 32'd10;
        B = 32'd3;
        ALUControl = 3'b001;
        #10;
        $display("SUB: 10 - 3 = %0d, Result=%0d", A, B, Result);

        // -------------------------
        // AND operation (010)
        // -------------------------
        A = 32'hFF00FF00;
        B = 32'h0F0F0F0F;
        ALUControl = 3'b010;
        #10;

        // -------------------------
        // OR operation (011)
        // -------------------------
        ALUControl = 3'b011;
        #10;

        // -------------------------
        // SLT (signed) operation (101)
        // -------------------------
        A = -5;
        B = 10;
        ALUControl = 3'b101;
        #10;

        // -------------------------
        // ZERO flag test
        // -------------------------
        A = 32'd10;
        B = 32'd10;
        ALUControl = 3'b001; // 10 - 10 = 0
        #10;

        $display("Finished.");
        $stop;
    end

endmodule
