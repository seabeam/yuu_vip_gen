`ifndef DEFAULT_ENV_SVH
`define DEFAULT_ENV_SVH

class default_env extends uvm_env;
  default_master_agent  master[];
  default_slave_agent   slave[];

  default_env_config    cfg;

  `uvm_component_utils(default_env)

  extern                   function      new(string name, uvm_component parent);
  extern                   function void build_phase(uvm_phase phase);
  extern                   function void connect_phase(uvm_phase phase);
endclass

function default_env::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void default_env::build_phase(uvm_phase phase);
  super.build_phase(phase);

  if (!uvm_config_db #(default_env_config)::get(null, get_full_name(), "cfg", cfg)) begin
    `uvm_fatal("CONFIG", "Cannot get default_env_config.");
  end

  master = new[cfg.mst_cfg.size()];
  foreach(master[i]) begin
    if (cfg.mst_cfg[i].index != -1) begin
      uvm_config_db#(default_master_config)::set(this, $sformatf("master_%s", cfg.mst_cfg[i].get_name()), "cfg", cfg.mst_cfg[i]);
      master[i] = default_master_agent::type_id::create($sformatf("master_%s", cfg.mst_cfg[i].get_name()), this);
    end
  end

  slave = new[cfg.slv_cfg.size()];
  foreach(slave[i]) begin
    if (cfg.slv_cfg[i].index != -1) begin
      uvm_config_db#(default_slave_config)::set(this, $sformatf("slave_%s", cfg.slv_cfg[i].get_name()), "cfg", cfg.slv_cfg[i]);
      slave[i] = default_slave_agent::type_id::create($sformatf("slave_%s", cfg.slv_cfg[i].get_name()), this);
    end
  end

  foreach (master[i]) begin
    if (cfg.mst_cfg[i].index != -1) begin
      uvm_config_db #(default_master_config)::set(this, $sformatf("master_%s", cfg.mst_cfg[i].get_name()), "cfg", cfg.mst_cfg[i]);
    end
  end
  foreach (slave[i]) begin
    if (cfg.slv_cfg[i].index != -1) begin
      uvm_config_db #(default_slave_config)::set(this, $sformatf("slave_%s", cfg.slv_cfg[i].get_name()), "cfg", cfg.slv_cfg[i]);
    end
  end
endfunction

function void default_env::connect_phase(uvm_phase phase);
  foreach (cfg.mst_cfg[i])
    cfg.mst_cfg[i].events = cfg.events;
  foreach (cfg.slv_cfg[i])
    cfg.slv_cfg[i].events = cfg.events;
endfunction

`endif
