`ifndef DEFAULT_COMMON_ITEM_SVH
`define DEFAULT_COMMON_ITEM_SVH

class default_common_item extends uvm_sequence_item;

  `uvm_object_utils_begin(default_common_item)
  `uvm_object_utils_end

  extern function      new(string name = "default_common_item");
endclass

function default_common_item::new(string name = "default_common_item");
  super.new(name);
endfunction

`endif
