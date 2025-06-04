// DUT (Design Under Test)

module alu(
  input logic clock, reset,
  input logic [7:0] A, B,
  input logic [3:0] ALU_Sel,
  output logic [7:0] ALU_Out,
  output logic CarryOut
);
  
  always_ff @(posedge clock or posedge reset) begin
    if (reset)
    {CarryOut, ALU_Out} <= 0;
    else begin
      case (ALU_Sel)
        4'b0000: {CarryOut, ALU_Out} <= A + B;
        4'b0001: {CarryOut, ALU_Out} <= A - B;
        4'b0010: {CarryOut, ALU_Out} <= A & B;
        4'b0011: {CarryOut, ALU_Out} <= A | B;
        default: {CarryOut, ALU_Out} <= 0;
      endcase
    end
  end
endmodule