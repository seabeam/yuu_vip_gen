`ifndef DEFAULT_MASTER_SEQUENCER_SV
`define DEFAULT_MASTER_SEQUENCER_SV

class default_master_sequencer extends uvm_sequencer #(default_master_item);
  virtual default_master_interface vif;

  default_master_config cfg;
  uvm_event_pool events;

  `uvm_component_utils(default_master_sequencer)

  extern                   function      new(string name, uvm_component parent);
  extern           virtual function void connect_phase(uvm_phase phase);
endclass

function default_master_sequencer::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void default_master_sequencer::connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  this.vif = cfg.vif;
  this.events = cfg.events;
endfunction

`endif
