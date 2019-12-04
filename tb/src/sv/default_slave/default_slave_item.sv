`ifndef DEFAULT_SLAVE_ITEM_SV
`define DEFAULT_SLAVE_ITEM_SV

class default_slave_item extends default_common_item;
  default_slave_config cfg;

  `uvm_object_utils_begin(default_slave_item)
  `uvm_object_utils_end

  function new(string name="default_slave_item");
    super.new(name);
  endfunction

endclass

`endif
