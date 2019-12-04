`ifndef DEFAULT_MASTER_AGENT_SV
`define DEFAULT_MASTER_AGENT_SV

class default_master_agent extends uvm_agent;
  default_master_sequencer sequencer;
  default_master_driver    driver;
  default_master_monitor   monitor;
  default_master_collector collector;
  default_master_analyzer  analyzer;

  default_master_config  cfg;

  uvm_analysis_port #(default_master_item) out_driver_ap;
  uvm_analysis_port #(default_master_item) out_monitor_ap;

  `uvm_component_utils_begin(default_master_agent)
  `uvm_component_utils_end

  extern         function      new(string name, uvm_component parent);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
endclass

function default_master_agent::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void default_master_agent::build_phase(uvm_phase phase);
  if (!uvm_config_db #(default_master_config)::get(null, get_full_name(), "cfg", cfg) && cfg == null) begin
    `uvm_fatal("build_phase", "Cannot get default_agent_config.");
  end

  monitor = default_master_monitor::type_id::create("monitor", this);
  monitor.cfg = cfg;
  if (cfg.is_active == UVM_ACTIVE) begin
    sequencer = default_master_sequencer::type_id::create("sequencer", this);
    driver    = default_master_driver::type_id::create("driver", this);
    sequencer.cfg = cfg;
    driver.cfg = cfg;
  end
  if (cfg.coverage_enable) begin
    collector = default_master_collector::type_id::create("collector", this);
    collector.cfg = cfg;
  end
  if (cfg.analysis_enable) begin
    analyzer = default_master_analyzer::type_id::create("analyzer", this);
    analyzer.cfg = cfg;
  end
endfunction

function void default_master_agent::connect_phase(uvm_phase phase);
  out_monitor_ap = monitor.out_monitor_ap;

  if (cfg.is_active == UVM_ACTIVE) begin
    driver.seq_item_port.connect(sequencer.seq_item_export);
    out_driver_ap = driver.out_driver_ap;
  end
  if (cfg.coverage_enable) begin
    monitor.out_monitor_ap.connect(collector.analysis_export);
  end
  if (cfg.analysis_enable) begin
    monitor.out_monitor_ap.connect(analyzer.analysis_export);
  end
endfunction

`endif
