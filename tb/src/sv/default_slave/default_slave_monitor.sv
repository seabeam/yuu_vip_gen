`ifndef DEFAULT_SLAVE_MONITOR_SV
`define DEFAULT_SLAVE_MONITOR_SV

class default_slave_monitor extends uvm_monitor;
  virtual default_slave_interface  vif;
  uvm_analysis_port #(default_item) out_monitor_ap;

  default_slave_config cfg;
  uvm_event_pool events;

  `uvm_register_cb(default_slave_monitor, default_slave_monitor_callback)

  `uvm_component_utils(default_slave_monitor)

  extern                   function      new(string name, uvm_component parent);
  extern           virtual function void build_phase(uvm_phase phase);
  extern           virtual function void connect_phase(uvm_phase phase);
  extern           virtual task          run_phase(uvm_phase phase);
endclass

function default_slave_monitor::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void default_slave_monitor::build_phase(uvm_phase phase);
  out_monitor_ap = new("out_monitor_ap", this);
endfunction

function void default_slave_monitor::connect_phase(uvm_phase phase);
  this.vif = cfg.vif;
  this.events = cfg.events;
endfunction

task default_slave_monitor::run_phase(uvm_phase phase);
endtask

`endif
