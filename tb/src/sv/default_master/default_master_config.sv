`ifndef DEFAULT_MASTER_CONFIG_SV
`define DEFAULT_MASTER_CONFIG_SV

class default_master_config extends default_agent_config;
  virtual default_master_interface  vif;

  `uvm_object_utils_begin(default_master_config)
  `uvm_object_utils_end

  function new(string name = "default_master_config");
    super.new(name);
  endfunction

endclass

`endif
