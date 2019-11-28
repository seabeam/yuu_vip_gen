`ifndef TOP_SV
`define TOP_SV

import uvm_pkg::*;
`include "uvm_macros.svh"

import default_pkg::*;

class uvc_test extends uvm_test;
  virtual default_interface vif;

  `uvm_component_utils(uvc_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
  endfunction : build_phase

endclass : uvc_test


module top;
  default_interface default_if();

  initial begin
    uvm_config_db #(virtual default_interface)::set(uvm_root::get(), "uvm_test_top", "default_interface", default_if);
    run_test("uvc_test");
  end
endmodule

`endif
