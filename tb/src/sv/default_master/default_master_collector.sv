`ifndef DEFAULT_MASTER_COLLECTOR_SV
`define DEFAULT_MASTER_COLLECTOR_SV

class default_master_collector extends uvm_subscriber #(default_item);
  virtual default_master_interface vif;

  default_master_config cfg;
  uvm_event_pool events;

  default_item item;

  `uvm_component_utils_begin(default_master_collector)
  `uvm_component_utils_end

  extern                   function      new(string name, uvm_component parent);
  extern           virtual function void connect_phase(uvm_phase phase);
  extern           virtual task          run_phase(uvm_phase phase);

  extern           virtual function void write(default_item t);
endclass

function default_master_collector::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void default_master_collector::connect_phase(uvm_phase phase);
  this.vif = cfg.vif;
  this.events = cfg.events;
endfunction

task default_master_collector::run_phase(uvm_phase phase);
endtask


function void default_master_collector::write(default_item t);
endfunction

`endif
