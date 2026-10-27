module top(
    input  logic        clk,
    input  logic        reset,
    output logic [31:0] WriteData,
    output logic [31:0] DataAdr,
    output logic        MemWrite
);
    logic [31:0] PC;
    logic [31:0] Instr;
    logic [31:0] ReadData;

    imem instruction_memory (
        .a  (PC),
        .rd (Instr)
    );

    riscvsingle processor (
        .clk       (clk),
        .reset     (reset),
        .PC        (PC),
        .Instr     (Instr),
        .MemWrite  (MemWrite),
        .ALUResult (DataAdr),
        .WriteData (WriteData),
        .ReadData  (ReadData)
    );

    dmem data_memory (
        .clk (clk),
        .we  (MemWrite),
        .a   (DataAdr),
        .wd  (WriteData),
        .rd  (ReadData)
    );
endmodule
