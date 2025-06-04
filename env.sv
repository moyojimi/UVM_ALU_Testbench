class alu_env extends uvm_env;
  `uvm_component_utils(alu_env)
  
//component declaration
  alu_agent agent;
  alu_scoreboard scoreboard;

//constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

//build phase
  virtual function void build_phase(uvm_phase phase);
    agent = alu_agent::type_id::create("agent", this);
    scoreboard = alu_scoreboard::type_id::create("scoreboard", this);
  endfunction
  
//connect phase
  virtual function void connect_phase(uvm_phase phase);
    agent.monitor.ap.connect(scoreboard.imp);
  endfunction
endclass
