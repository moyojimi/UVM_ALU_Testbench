class alu_scoreboard extends uvm_component;
  `uvm_component_utils(alu_scoreboard)

  uvm_analysis_imp #(alu_txn, alu_scoreboard) imp;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    imp = new("imp", this);
  endfunction

  function void write(alu_txn tx);
     bit [8:0] expected_result; // 9 bits to hold carry + 8-bit result
  bit [7:0] expected_out;
  bit expected_carry;
    
    // Recalculate the expected result base on the op_code
     case (tx.op_code)
    4'b0000: expected_result = tx.a + tx.b;      // ADD
    4'b0001: expected_result = tx.a - tx.b;      // SUB
    4'b0010: expected_result = tx.a & tx.b;      // AND
    4'b0011: expected_result = tx.a | tx.b;      // OR
    default: expected_result = 0;
  endcase
    
    expected_out = expected_result[7:0];
    expected_carry = expected_result[8]; // overflow bit

    
     // Compare expected vs actual
      if (tx.result !== expected_out || tx.carry_out !== expected_carry) begin
    `uvm_error("SCORE", $sformatf(
      "Mismatch! a=%0d b=%0d op=%b | Expected: result=%0d carry=%0b, Got: result=%0d carry=%0b",
      tx.a, tx.b, tx.op_code,
      expected_out, expected_carry,
      tx.result, tx.carry_out
    ))
  end else begin
    `uvm_info("SCORE", $sformatf(
      "PASS! a=%0d b=%0d op=%b | Result=%0d Carry=%0b",
      tx.a, tx.b, tx.op_code,
      tx.result, tx.carry_out
    ), UVM_LOW)
  end
  endfunction
endclass
