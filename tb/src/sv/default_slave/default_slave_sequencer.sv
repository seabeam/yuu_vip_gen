`ifndef DEFAULT_SLAVE_SEQUENCER_SV
`define DEFAULT_SLAVE_SEQUENCER_SV

class default_slave_sequencer extends uvm_sequencer #(default_slave_item);
  virtual default_slave_interface vif;

  default_slave_config cfg;
  uvm_event_pool events;

  `uvm_component_utils(default_slave_sequencer)

  extern                   function      new(string name, uvm_component parent);
  extern           virtual function void connect_phase(uvm_phase phase);
endclass

function default_slave_sequencer::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void default_slave_sequencer::connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  this.vif = cfg.vif;
  this.events = cfg.events;
endfunction

`endif
