`ifndef DEFAULT_MASTER_CALLBACKS_SV
`define DEFAULT_MASTER_CALLBACKS_SV

typedef class default_master_driver;
typedef class default_master_monitor;

class default_master_driver_callback extends uvm_callback;
  `uvm_object_utils(default_master_driver_callback)

  function new(string name = "default_master_driver_callback");
    super.new(name);
  endfunction

  virtual task pre_send(default_master_driver driver, default_master_item item);
  endtask

  virtual task post_send(default_master_driver driver, default_master_item item);
  endtask
endclass


class default_master_monitor_callback extends uvm_callback;
  `uvm_object_utils(default_master_monitor_callback)

  function new(string name = "default_master_monitor_callback");
    super.new(name);
  endfunction

  virtual task pre_collect(default_master_monitor monitor, default_common_item item);
  endtask

  virtual task post_collect(default_master_monitor monitor, default_common_item item);
  endtask
endclass

`endif
