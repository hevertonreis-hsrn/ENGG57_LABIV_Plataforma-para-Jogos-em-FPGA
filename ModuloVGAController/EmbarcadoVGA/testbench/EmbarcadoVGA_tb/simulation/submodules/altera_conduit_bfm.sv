// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
// $Revision: #7 $
// $Date: 2010/08/05 $
// $Author: klong $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_conduit_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Standard Conduit BFM
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Standard Conduit Master.
// This BFM sampled the input/bidirection port value or driving user's value to 
// output ports when user call the API.  
// This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
// Generation parameters:
// output_name:                                       altera_conduit_bfm
// role:width:direction:                              exportdata:32:input,fifo_empty:1:output,fifo_full:1:output,fifo_used:9:output,fifo_wr_en:1:input,pll_locked:1:output
// 1
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm
(
   clk,
   reset,
   reset_n,
   sig_exportdata,
   sig_fifo_empty,
   sig_fifo_full,
   sig_fifo_used,
   sig_fifo_wr_en,
   sig_pll_locked
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   input clk;
   input reset;
   input reset_n;
   input [31 : 0] sig_exportdata;
   output sig_fifo_empty;
   output sig_fifo_full;
   output [8 : 0] sig_fifo_used;
   input sig_fifo_wr_en;
   output sig_pll_locked;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic [31 : 0] ROLE_exportdata_t;
   typedef logic ROLE_fifo_empty_t;
   typedef logic ROLE_fifo_full_t;
   typedef logic [8 : 0] ROLE_fifo_used_t;
   typedef logic ROLE_fifo_wr_en_t;
   typedef logic ROLE_pll_locked_t;

   logic [31 : 0] sig_exportdata_in;
   logic [31 : 0] sig_exportdata_local;
   reg sig_fifo_empty_temp;
   reg sig_fifo_empty_out;
   reg sig_fifo_full_temp;
   reg sig_fifo_full_out;
   reg [8 : 0] sig_fifo_used_temp;
   reg [8 : 0] sig_fifo_used_out;
   logic [0 : 0] sig_fifo_wr_en_in;
   logic [0 : 0] sig_fifo_wr_en_local;
   reg sig_pll_locked_temp;
   reg sig_pll_locked_out;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). The application program interface provides methods for 
   // a testbench which instantiates, controls and queries state in this BFM 
   // component. Test programs must only use these public access methods and 
   // events to communicate with this BFM component. The API and module pins
   // are the only interfaces of this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   
   event signal_reset_asserted;
   event signal_input_exportdata_change;
   event signal_input_fifo_wr_en_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "18.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // exportdata
   // -------------------------------------------------------
   function automatic ROLE_exportdata_t get_exportdata();
   
      // Gets the exportdata input value.
      $sformat(message, "%m: called get_exportdata");
      print(VERBOSITY_DEBUG, message);
      return sig_exportdata_in;
      
   endfunction

   // -------------------------------------------------------
   // fifo_empty
   // -------------------------------------------------------

   function automatic void set_fifo_empty (
      ROLE_fifo_empty_t new_value
   );
      // Drive the new value to fifo_empty.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_fifo_empty_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // fifo_full
   // -------------------------------------------------------

   function automatic void set_fifo_full (
      ROLE_fifo_full_t new_value
   );
      // Drive the new value to fifo_full.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_fifo_full_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // fifo_used
   // -------------------------------------------------------

   function automatic void set_fifo_used (
      ROLE_fifo_used_t new_value
   );
      // Drive the new value to fifo_used.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_fifo_used_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // fifo_wr_en
   // -------------------------------------------------------
   function automatic ROLE_fifo_wr_en_t get_fifo_wr_en();
   
      // Gets the fifo_wr_en input value.
      $sformat(message, "%m: called get_fifo_wr_en");
      print(VERBOSITY_DEBUG, message);
      return sig_fifo_wr_en_in;
      
   endfunction

   // -------------------------------------------------------
   // pll_locked
   // -------------------------------------------------------

   function automatic void set_pll_locked (
      ROLE_pll_locked_t new_value
   );
      // Drive the new value to pll_locked.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_pll_locked_temp = new_value;
   endfunction

   always @(posedge clk) begin
      sig_exportdata_in <= sig_exportdata;
      sig_fifo_empty_out <= sig_fifo_empty_temp;
      sig_fifo_full_out <= sig_fifo_full_temp;
      sig_fifo_used_out <= sig_fifo_used_temp;
      sig_fifo_wr_en_in <= sig_fifo_wr_en;
      sig_pll_locked_out <= sig_pll_locked_temp;
   end
   
   assign sig_fifo_empty = sig_fifo_empty_out;
   assign sig_fifo_full = sig_fifo_full_out;
   assign sig_fifo_used = sig_fifo_used_out;
   assign sig_pll_locked = sig_pll_locked_out;

   always @(posedge reset or negedge reset_n) begin
      -> signal_reset_asserted;
   end

   always @(sig_exportdata_in) begin
      if (sig_exportdata_local != sig_exportdata_in)
         -> signal_input_exportdata_change;
      sig_exportdata_local = sig_exportdata_in;
   end
   
   always @(sig_fifo_wr_en_in) begin
      if (sig_fifo_wr_en_local != sig_fifo_wr_en_in)
         -> signal_input_fifo_wr_en_change;
      sig_fifo_wr_en_local = sig_fifo_wr_en_in;
   end
   


// synthesis translate_on

endmodule

