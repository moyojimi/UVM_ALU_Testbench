class alu_txn extends uvm_sequence_item;
  rand bit [7:0] a, b;
  rand bit [3:0] op_code;
  bit [7:0] result;
  bit carry_out;
  
  `uvm_object_utils(alu_txn)
  
  function new(string name = "alu_txn");
    super.new(name);
  endfunction
  
  function string convert2string();
    return $sformatf("a=%0d, b=%0d, op=%b", a, b, op_code);
  endfunction
endclass
