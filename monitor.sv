class alu_monitor extends uvm_component;
  `uvm_component_utils(alu_monitor)

  virtual alu_interface vif;
  uvm_analysis_port #(alu_txn) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual alu_interface)::get(this, "", "vif", vif))
      `uvm_fatal("MON", "No interface found")
  endfunction

  virtual task run_phase(uvm_phase phase);
    alu_txn tx;
    forever begin
      tx = alu_txn::type_id::create("tx");
      @(posedge vif.clock);
      tx.result = vif.result;
      tx.carry_out = vif.carry_out;
      ap.write(tx);
    end
  endtask
endclass
