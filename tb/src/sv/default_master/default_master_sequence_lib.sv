`ifndef DEFAULT_MASTER_SEQUENCE_LIB_SV
`define DEFAULT_MASTER_SEQUENCE_LIB_SV

typedef class default_master_sequencer;
class default_master_sequence_base extends uvm_sequence #(default_master_item);
  virtual default_master_interface vif;

  default_master_config cfg;
  uvm_event_pool events;

  `uvm_object_utils_begin(default_master_sequence_base)
  `uvm_object_utils_end
  `uvm_declare_p_sequencer(default_master_sequencer)

  function new(string name = "default_master_sequence_base");
    super.new(name);
  endfunction

  virtual task pre_start();
    cfg = p_sequencer.cfg;
    vif = cfg.vif;
    events = cfg.events;
  endtask

  virtual task body();
    return;
  endtask
endclass

`endif
