`ifndef DEFAULT_SLAVE_ANALYZER_SV
`define DEFAULT_SLAVE_ANALYZER_SV

class default_slave_analyzer extends uvm_subscriber #(default_slave_item);
  virtual default_slave_interface vif;

  default_slave_config cfg;
  uvm_event_pool events;

  protected time m_start_time;
  protected time m_end_time;
  protected bit  m_start = 0;
  protected int  m_count = 0;

  `uvm_component_utils_begin(default_slave_analyzer)
  `uvm_component_utils_end

  extern                   function      new(string name, uvm_component parent);
  extern           virtual function void connect_phase(uvm_phase phase);
  extern           virtual task          run_phase(uvm_phase phase);
  extern           virtual function void report_phase(uvm_phase phase);

  extern           virtual function void write(default_slave_item t);
  extern protected virtual task          measure_start();
  extern protected virtual task          measure_end();
endclass

function default_slave_analyzer::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void default_slave_analyzer::connect_phase(uvm_phase phase);
  this.vif = cfg.vif;
  this.events = cfg.events;
endfunction

task default_slave_analyzer::run_phase(uvm_phase phase);
  measure_start();
  measure_end();
endtask


function void default_slave_analyzer::report_phase(uvm_phase phase);
  real tput_rate;

  if (m_count == 0) begin
    `uvm_warning("report_phase", "Analyzer haven't received any transaction")
    return;
  end

  tput_rate = real'(m_count)/(m_end_time - m_start_time) * 1000;
  `uvm_info("report_phase", $sformatf("DEFAULT slave speed is %f", tput_rate), UVM_LOW);
endfunction

function void default_slave_analyzer::write(default_slave_item t);
endfunction

task default_slave_analyzer::measure_start();
  uvm_event e = events.get($sformatf("%s_measure_begin", cfg.get_name()));

  e.wait_on();
  m_start_time = $realtime();
  m_start = 1;
  `uvm_info("measure_start", $sformatf("%s analyzer start measure @ %t", cfg.get_name(), m_start_time), UVM_LOW)
endtask

task default_slave_analyzer::measure_end();
  uvm_event e = events.get($sformatf("%s_measure_end", cfg.get_name()));

  e.wait_on();
  m_end_time = $realtime();
  m_start = 0;
  `uvm_info("measure_end", $sformatf("%s analyzer end measure @ %t", cfg.get_name(), m_end_time), UVM_LOW)
endtask

`endif
