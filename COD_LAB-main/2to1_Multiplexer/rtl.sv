module MUX_2_1 #(parameter WIDTH = 8) (
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    input  logic             s,
    output logic [WIDTH-1:0] y
);
    assign y = s ? b : a;
endmodule
