class alu_driver extends uvm_driver #(alu_txn);
  `uvm_component_utils(alu_driver)

  virtual alu_interface vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual alu_interface)::get(this, "", "vif", vif))
      `uvm_fatal("DRV", "No interface found")
  endfunction

  virtual task run_phase(uvm_phase phase);
    forever begin
      alu_txn tx;
      seq_item_port.get_next_item(tx);

      vif.reset <= 0;
      vif.a <= tx.a;
      vif.b <= tx.b;
      vif.op_code <= tx.op_code;
      @(posedge vif.clock);
      @(posedge vif.clock); // wait 1 extra cycle
      seq_item_port.item_done();
    end
  endtask
endclass
