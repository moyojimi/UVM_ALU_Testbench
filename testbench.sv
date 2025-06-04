// top module

`timescale 1ns/1ns
import uvm_pkg::*;
`include "uvm_macros.svh"

`include "alu.sv"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"

module top;
  
  logic clock;
  alu_interface intf(clock);
  
  alu dut(
    .clock(intf.clock),
    .reset(intf.reset),
    .A(intf.a),
    .B(intf.b),
    .ALU_Sel(intf.op_code),
    .ALU_Out(intf.result),
    .CarryOut(intf.carry_out)
  );
  
  initial begin
    uvm_config_db#(virtual alu_interface)::set(null, "*", "vif", intf);
    run_test("alu_test");
  end
  
  always #5 clock = ~clock;
  initial clock = 0;
  
endmodule
