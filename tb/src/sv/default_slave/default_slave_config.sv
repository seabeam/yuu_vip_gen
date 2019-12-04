`ifndef DEFAULT_SLAVE_CONFIG_SV
`define DEFAULT_SLAVE_CONFIG_SV

class default_slave_config extends default_common_agent_config;
  virtual default_slave_interface  vif;

  `uvm_object_utils_begin(default_slave_config)
  `uvm_object_utils_end

  function new(string name = "default_slave_config");
    super.new(name);
  endfunction

endclass

`endif
