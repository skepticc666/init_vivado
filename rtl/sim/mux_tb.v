module mux_tb;

    reg  [31:0] a, b;
    reg         s;
    reg         clk;
    wire [31:0] c;

    // DUT instantiation
    Mux u_Mux (
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // toggle clock every 5 time units
    end

    // Stimulus
    initial begin
        // Initial values
        a = 32'hBF;
        b = 32'h09;
        s = 0;

        #15;
        s = 1;       // switch mux output to b

        #10;
        $finish;
    end

endmodule
