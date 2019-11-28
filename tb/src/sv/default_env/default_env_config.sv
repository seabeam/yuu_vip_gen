`ifndef DEFAULT_ENV_CONFIG_SV
`define DEFAULT_ENV_CONFIG_SV

class default_env_config extends uvm_object;
  default_master_config  mst_cfg[$];
  default_slave_config   slv_cfg[$];

  virtual default_interface vif;
  uvm_event_pool events;

  `uvm_object_utils_begin(default_env_config)
    `uvm_field_queue_object(mst_cfg, UVM_PRINT | UVM_COPY)
    `uvm_field_queue_object(slv_cfg, UVM_PRINT | UVM_COPY)
  `uvm_object_utils_end

  function new(string name="default_env_config");
    super.new(name);
  endfunction

  function void set_config(default_agent_config cfg);
    default_master_config m_cfg;
    default_slave_config  s_cfg;

    if (cfg == null)
      `uvm_fatal("NULL", "Which default agent config set is null")

    cfg.events = events;
    if ($cast(m_cfg, cfg)) begin
      if(m_cfg.index >= 0)
        m_cfg.vif = vif.get_master_if(m_cfg.index);
      mst_cfg.push_back(m_cfg);
    end
    else if ($cast(s_cfg, cfg))begin
      if (s_cfg.index >= 0)
        s_cfg.vif = vif.get_slave_if(s_cfg.index);
      slv_cfg.push_back(s_cfg);
    end
    else
      `uvm_fatal("Error Type", "Invalid default agent configure object type")
  endfunction

  function void set_configs(default_agent_config cfg[]);
    foreach (cfg[i])
      set_config(cfg[i]);
  endfunction
endclass

`endif
