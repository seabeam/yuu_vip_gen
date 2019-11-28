`ifndef DEFAULT_PKG_SV
`define DEFAULT_PKG_SV

`include "default_defines.svh"
`include "default_interface.svi"

package default_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "default_common_pkg.svh"
  `include "default_master_pkg.svh"
  `include "default_slave_pkg.svh"
  `include "default_env_pkg.svh"
endpackage

`endif
