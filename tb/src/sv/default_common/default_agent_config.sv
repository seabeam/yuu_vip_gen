`ifndef DEFAULT_AGENT_CONFIG_SVH
`define DEFAULT_AGENT_CONFIG_SVH

class default_agent_config extends uvm_object;
  uvm_event_pool   events;

  int index = -1;
  uvm_active_passive_enum is_active = UVM_ACTIVE;

  // Struct control
  boolean analysis_enable = False;
  boolean coverage_enable = False;
  boolean protocol_check_enable = True;

  `uvm_object_utils_begin(default_agent_config)
    `uvm_field_int (                          index,                  UVM_PRINT | UVM_COPY)
    `uvm_field_enum(uvm_active_passive_enum,  is_active,              UVM_PRINT | UVM_COPY)
    `uvm_field_enum(boolean,                  coverage_enable,        UVM_PRINT | UVM_COPY)
    `uvm_field_enum(boolean,                  analysis_enable,        UVM_PRINT | UVM_COPY)
    `uvm_field_enum(boolean,                  protocol_check_enable,  UVM_PRINT | UVM_COPY)
  `uvm_object_utils_end

  function new (string name = "default_agent_config");
    super.new(name);
  endfunction
endclass

`endif
