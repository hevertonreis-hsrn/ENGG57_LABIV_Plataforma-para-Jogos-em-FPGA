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
// output_name:                                       altera_conduit_bfm_0002
// role:width:direction:                              new_frame_test:1:input,pixel_out:24:input,wrfull:1:output,wrreq:1:input
// 1
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm_0002
(
   clk,
   reset,
   reset_n,
   sig_new_frame_test,
   sig_pixel_out,
   sig_wrfull,
   sig_wrreq
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   input clk;
   input reset;
   input reset_n;
   input sig_new_frame_test;
   input [23 : 0] sig_pixel_out;
   output sig_wrfull;
   input sig_wrreq;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_new_frame_test_t;
   typedef logic [23 : 0] ROLE_pixel_out_t;
   typedef logic ROLE_wrfull_t;
   typedef logic ROLE_wrreq_t;

   logic [0 : 0] sig_new_frame_test_in;
   logic [0 : 0] sig_new_frame_test_local;
   logic [23 : 0] sig_pixel_out_in;
   logic [23 : 0] sig_pixel_out_local;
   reg sig_wrfull_temp;
   reg sig_wrfull_out;
   logic [0 : 0] sig_wrreq_in;
   logic [0 : 0] sig_wrreq_local;

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
   event signal_input_new_frame_test_change;
   event signal_input_pixel_out_change;
   event signal_input_wrreq_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "18.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // new_frame_test
   // -------------------------------------------------------
   function automatic ROLE_new_frame_test_t get_new_frame_test();
   
      // Gets the new_frame_test input value.
      $sformat(message, "%m: called get_new_frame_test");
      print(VERBOSITY_DEBUG, message);
      return sig_new_frame_test_in;
      
   endfunction

   // -------------------------------------------------------
   // pixel_out
   // -------------------------------------------------------
   function automatic ROLE_pixel_out_t get_pixel_out();
   
      // Gets the pixel_out input value.
      $sformat(message, "%m: called get_pixel_out");
      print(VERBOSITY_DEBUG, message);
      return sig_pixel_out_in;
      
   endfunction

   // -------------------------------------------------------
   // wrfull
   // -------------------------------------------------------

   function automatic void set_wrfull (
      ROLE_wrfull_t new_value
   );
      // Drive the new value to wrfull.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_wrfull_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // wrreq
   // -------------------------------------------------------
   function automatic ROLE_wrreq_t get_wrreq();
   
      // Gets the wrreq input value.
      $sformat(message, "%m: called get_wrreq");
      print(VERBOSITY_DEBUG, message);
      return sig_wrreq_in;
      
   endfunction

   always @(posedge clk) begin
      sig_new_frame_test_in <= sig_new_frame_test;
      sig_pixel_out_in <= sig_pixel_out;
      sig_wrfull_out <= sig_wrfull_temp;
      sig_wrreq_in <= sig_wrreq;
   end
   
   assign sig_wrfull = sig_wrfull_out;

   always @(posedge reset or negedge reset_n) begin
      -> signal_reset_asserted;
   end

   always @(sig_new_frame_test_in) begin
      if (sig_new_frame_test_local != sig_new_frame_test_in)
         -> signal_input_new_frame_test_change;
      sig_new_frame_test_local = sig_new_frame_test_in;
   end
   
   always @(sig_pixel_out_in) begin
      if (sig_pixel_out_local != sig_pixel_out_in)
         -> signal_input_pixel_out_change;
      sig_pixel_out_local = sig_pixel_out_in;
   end
   
   always @(sig_wrreq_in) begin
      if (sig_wrreq_local != sig_wrreq_in)
         -> signal_input_wrreq_change;
      sig_wrreq_local = sig_wrreq_in;
   end
   


// synthesis translate_on

endmodule

