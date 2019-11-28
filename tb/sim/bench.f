// +--------------+
// | MACRO DEFINE |
// +--------------+
-timescale=1ns/1ps

// +------------+ 
// |  SV DEFINE |
// +------------+ 

// +------------------+
// | INTERFACE DEFINE |
// +------------------+

// +-----------------+ 
// | PACKET FILELIST |
// +-----------------+ 
../include/default_pkg.sv

// +---------------+ 
// | CASE FILELIST |
// +---------------+ 

// +----------+ 
// | TOP FILE |
// +----------+ 
top.sv

// +------------+ 
// |  Package   |
// +------------+ 
+incdir+../include
+incdir+../src/sv/default_common
+incdir+../src/sv/default_master
+incdir+../src/sv/default_slave
+incdir+../src/sv/default_env
