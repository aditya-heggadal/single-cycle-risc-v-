module imem (
    input  logic [31:0] a,
    output logic [31:0] rd
);
    logic [31:0] RAM [0:63];

    initial
        $readmemh("IMEM/memfile.txt", RAM);

    assign rd = RAM[a[31:2]];
endmodule
