`ifndef DEFAULT_ITEM_SVH
`define DEFAULT_ITEM_SVH

class default_item extends yuu_amba_item;

  `uvm_object_utils_begin(default_item)
  `uvm_object_utils_end

  extern function      new(string name = "default_item");
endclass

function default_item::new(string name = "default_item");
  super.new(name);
endfunction

`endif
