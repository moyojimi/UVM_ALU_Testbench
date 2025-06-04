class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)

  alu_env env;
  
//constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TEST_CLASS", "Inside Constructor!", UVM_LOW)
  endfunction

//build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = alu_env::type_id::create("env", this);
    `uvm_info("TEST_CLASS", "Build Phase!", UVM_LOW)
  endfunction
  
//connect phase
  virtual function void connect_phase(uvm_phase phase);
    `uvm_info("TEST_CLASS", "Connect Phase!", UVM_LOW)
  endfunction
  
//run phase
  virtual task run_phase(uvm_phase phase);
    alu_sequence seq = alu_sequence::type_id::create("seq");
    seq.start(env.agent.sequencer);
  endtask
endclass