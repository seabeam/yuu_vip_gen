`ifndef DEFAULT_MASTER_ADAPTER_SV
`define DEFAULT_MASTER_ADAPTER_SV

class default_master_adapter extends uvm_reg_adapter;
  default_master_config cfg;

  `uvm_object_utils(default_master_adapter)

  function new(string name = "default_master_adapter");
    super.new(name);
  endfunction

  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
  endfunction

  virtual function void bus2reg(uvm_sequence_item bus_item,
                                ref uvm_reg_bus_op rw);
  endfunction
endclass

`endif
