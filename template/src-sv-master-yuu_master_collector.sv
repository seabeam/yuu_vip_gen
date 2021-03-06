`ifndef {{ module.upper() }}_MASTER_COLLECTOR_SV
`define {{ module.upper() }}_MASTER_COLLECTOR_SV

class {{ module }}_master_collector extends uvm_subscriber #({{ module }}_master_item);
  // Data members
  virtual {{ module }}_master_interface vif;

  {{ module }}_master_config cfg;
  uvm_event_pool events;

  {{ module }}_master_item item;

  `uvm_component_utils_begin({{ module }}_master_collector)
  `uvm_component_utils_end

  // Function declarations
  extern         function      new(string name, uvm_component parent);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual task          run_phase(uvm_phase phase);

  extern virtual function void write({{ module }}_master_item t);
endclass

function {{ module }}_master_collector::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void {{ module }}_master_collector::connect_phase(uvm_phase phase);
  this.vif = cfg.vif;
  this.events = cfg.events;
endfunction

task {{ module }}_master_collector::run_phase(uvm_phase phase);
endtask


function void {{ module }}_master_collector::write({{ module }}_master_item t);
endfunction

`endif