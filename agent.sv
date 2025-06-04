class alu_agent extends uvm_agent;
  `uvm_component_utils(alu_agent)

  alu_driver driver;
  alu_monitor monitor;
  uvm_sequencer #(alu_txn) sequencer;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    driver = alu_driver::type_id::create("driver", this);
    monitor = alu_monitor::type_id::create("monitor", this);
    sequencer = uvm_sequencer #(alu_txn)::type_id::create("sequencer", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
endclass
