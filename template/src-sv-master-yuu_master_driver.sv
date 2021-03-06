`ifndef {{ module.upper() }}_MASTER_DRIVER_SV
`define {{ module.upper() }}_MASTER_DRIVER_SV

class {{ module }}_master_driver extends uvm_driver #({{ module }}_master_item);
  // Data members
  virtual {{ module }}_master_interface vif;
  uvm_analysis_port #({{ module }}_master_item) out_driver_ap;

  {{ module }}_master_config cfg;
  uvm_event_pool events;

  `uvm_register_cb({{ module }}_master_driver, {{ module }}_master_driver_callback)

  `uvm_component_utils_begin({{ module }}_master_driver)
  `uvm_component_utils_end

  // Function declarations
  extern         function      new(string name, uvm_component parent);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual task          run_phase(uvm_phase phase);
endclass

function {{ module }}_master_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void {{ module }}_master_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);

  out_driver_ap = new("out_driver_ap", this);
endfunction

function void {{ module }}_master_driver::connect_phase(uvm_phase phase);
  this.vif = cfg.vif;
  this.events = cfg.events;
endfunction

task {{ module }}_master_driver::run_phase(uvm_phase phase);
endtask

`endif