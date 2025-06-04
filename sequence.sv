class alu_sequence extends uvm_sequence #(alu_txn);
  `uvm_object_utils(alu_sequence)
  
  function new(string name = "alu_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    alu_txn tx;
    repeat (5) begin
      tx = alu_txn::type_id::create("tx");
      assert(tx.randomize());
      `uvm_info("SEQ", tx.convert2string(), UVM_MEDIUM)
      start_item(tx);
      finish_item(tx);
    end
  endtask
endclass
