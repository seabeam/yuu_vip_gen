`ifndef DEFAULT_MASTER_ITEM_SV
`define DEFAULT_MASTER_ITEM_SV

class default_master_item extends default_common_item;
  default_master_config cfg;

  `uvm_object_utils_begin(default_master_item)
  `uvm_object_utils_end

  function new(string name="default_master_item");
    super.new(name);
  endfunction

endclass

`endif
