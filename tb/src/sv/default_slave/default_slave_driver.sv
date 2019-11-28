`ifndef DEFAULT_SLAVE_DRIVER_SV
`define DEFAULT_SLAVE_DRIVER_SV

class default_slave_driver extends uvm_driver #(default_slave_item);
  virtual default_slave_interface vif;
  uvm_analysis_port #(default_slave_item) out_driver_ap;

  default_slave_config cfg;
  uvm_event_pool events;

  `uvm_register_cb(default_slave_driver, default_slave_driver_callback)

  `uvm_component_utils_begin(default_slave_driver)
  `uvm_component_utils_end

  extern                   function      new(string name, uvm_component parent);
  extern           virtual function void build_phase(uvm_phase phase);
  extern           virtual function void connect_phase(uvm_phase phase);
  extern           virtual task          run_phase(uvm_phase phase);
endclass

function default_slave_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void default_slave_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);

  out_driver_ap = new("out_driver_ap", this);
endfunction

function void default_slave_driver::connect_phase(uvm_phase phase);
  this.vif = cfg.vif;
  this.events = cfg.events;
endfunction

task default_slave_driver::run_phase(uvm_phase phase);
endtask

`endif
