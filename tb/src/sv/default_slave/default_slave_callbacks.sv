`ifndef DEFAULT_SLAVE_CALLBACKS_SV
`define DEFAULT_SLAVE_CALLBACKS_SV

typedef class default_slave_driver;
typedef class default_slave_monitor;

class default_slave_driver_callback extends uvm_callback;
  `uvm_object_utils(default_slave_driver_callback)

  function new(string name = "default_slave_driver_callback");
    super.new(name);
  endfunction

  virtual task pre_send(default_slave_driver driver, default_slave_item item);
  endtask

  virtual task post_send(default_slave_driver driver, default_slave_item item);
  endtask
endclass


class default_slave_monitor_callback extends uvm_callback;
  `uvm_object_utils(default_slave_monitor_callback)

  function new(string name = "default_slave_monitor_callback");
    super.new(name);
  endfunction

  virtual task pre_collect(default_slave_monitor monitor, default_slave_item item);
  endtask

  virtual task post_collect(default_slave_monitor monitor, default_slave_item item);
  endtask
endclass

`endif
