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
// output_name:                                       altera_conduit_bfm_0004
// role:width:direction:                              ADDR:20:input,CE_N:1:input,DQ:16:bidir,LB_N:1:input,OE_N:1:input,UB_N:1:input,WE_N:1:input
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm_0004
(
   sig_ADDR,
   sig_CE_N,
   sig_DQ,
   sig_LB_N,
   sig_OE_N,
   sig_UB_N,
   sig_WE_N
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   input [19 : 0] sig_ADDR;
   input sig_CE_N;
   inout wire [15 : 0] sig_DQ;
   input sig_LB_N;
   input sig_OE_N;
   input sig_UB_N;
   input sig_WE_N;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic [19 : 0] ROLE_ADDR_t;
   typedef logic ROLE_CE_N_t;
   typedef logic [15 : 0] ROLE_DQ_t;
   typedef logic ROLE_LB_N_t;
   typedef logic ROLE_OE_N_t;
   typedef logic ROLE_UB_N_t;
   typedef logic ROLE_WE_N_t;

   logic [19 : 0] sig_ADDR_in;
   logic [19 : 0] sig_ADDR_local;
   logic [0 : 0] sig_CE_N_in;
   logic [0 : 0] sig_CE_N_local;
   logic sig_DQ_oe;
   logic sig_DQ_oe_temp = 0;
   reg [15 : 0] sig_DQ_temp;
   reg [15 : 0] sig_DQ_out;
   logic [15 : 0] sig_DQ_in;
   logic [15 : 0] sig_DQ_local;
   logic [0 : 0] sig_LB_N_in;
   logic [0 : 0] sig_LB_N_local;
   logic [0 : 0] sig_OE_N_in;
   logic [0 : 0] sig_OE_N_local;
   logic [0 : 0] sig_UB_N_in;
   logic [0 : 0] sig_UB_N_local;
   logic [0 : 0] sig_WE_N_in;
   logic [0 : 0] sig_WE_N_local;

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
   
   event signal_input_ADDR_change;
   event signal_input_CE_N_change;
   event signal_input_DQ_change;
   event signal_input_LB_N_change;
   event signal_input_OE_N_change;
   event signal_input_UB_N_change;
   event signal_input_WE_N_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "18.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // ADDR
   // -------------------------------------------------------
   function automatic ROLE_ADDR_t get_ADDR();
   
      // Gets the ADDR input value.
      $sformat(message, "%m: called get_ADDR");
      print(VERBOSITY_DEBUG, message);
      return sig_ADDR_in;
      
   endfunction

   // -------------------------------------------------------
   // CE_N
   // -------------------------------------------------------
   function automatic ROLE_CE_N_t get_CE_N();
   
      // Gets the CE_N input value.
      $sformat(message, "%m: called get_CE_N");
      print(VERBOSITY_DEBUG, message);
      return sig_CE_N_in;
      
   endfunction

   // -------------------------------------------------------
   // DQ
   // -------------------------------------------------------
   function automatic ROLE_DQ_t get_DQ();
   
      // Gets the DQ input value.
      $sformat(message, "%m: called get_DQ");
      print(VERBOSITY_DEBUG, message);
      return sig_DQ_in;
      
   endfunction

   function automatic void set_DQ (
      ROLE_DQ_t new_value
   );
      // Drive the new value to DQ.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_DQ_temp = new_value;
   endfunction
   
   function automatic void set_DQ_oe (
      bit enable
   );
      // bidir port DQ will work as output port when set to 1.
      // bidir port DQ will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      sig_DQ_oe_temp = enable;
   endfunction

   // -------------------------------------------------------
   // LB_N
   // -------------------------------------------------------
   function automatic ROLE_LB_N_t get_LB_N();
   
      // Gets the LB_N input value.
      $sformat(message, "%m: called get_LB_N");
      print(VERBOSITY_DEBUG, message);
      return sig_LB_N_in;
      
   endfunction

   // -------------------------------------------------------
   // OE_N
   // -------------------------------------------------------
   function automatic ROLE_OE_N_t get_OE_N();
   
      // Gets the OE_N input value.
      $sformat(message, "%m: called get_OE_N");
      print(VERBOSITY_DEBUG, message);
      return sig_OE_N_in;
      
   endfunction

   // -------------------------------------------------------
   // UB_N
   // -------------------------------------------------------
   function automatic ROLE_UB_N_t get_UB_N();
   
      // Gets the UB_N input value.
      $sformat(message, "%m: called get_UB_N");
      print(VERBOSITY_DEBUG, message);
      return sig_UB_N_in;
      
   endfunction

   // -------------------------------------------------------
   // WE_N
   // -------------------------------------------------------
   function automatic ROLE_WE_N_t get_WE_N();
   
      // Gets the WE_N input value.
      $sformat(message, "%m: called get_WE_N");
      print(VERBOSITY_DEBUG, message);
      return sig_WE_N_in;
      
   endfunction

   assign sig_ADDR_in = sig_ADDR;
   assign sig_CE_N_in = sig_CE_N;
   assign sig_DQ_oe = sig_DQ_oe_temp;
   assign sig_DQ = (sig_DQ_oe == 1)? sig_DQ_temp:'z;
   assign sig_DQ_in = (sig_DQ_oe == 0)? sig_DQ:'z;
   assign sig_LB_N_in = sig_LB_N;
   assign sig_OE_N_in = sig_OE_N;
   assign sig_UB_N_in = sig_UB_N;
   assign sig_WE_N_in = sig_WE_N;


   always @(sig_ADDR_in) begin
      if (sig_ADDR_local != sig_ADDR_in)
         -> signal_input_ADDR_change;
      sig_ADDR_local = sig_ADDR_in;
   end
   
   always @(sig_CE_N_in) begin
      if (sig_CE_N_local != sig_CE_N_in)
         -> signal_input_CE_N_change;
      sig_CE_N_local = sig_CE_N_in;
   end
   
   always @(sig_DQ_in) begin
      if (sig_DQ_oe == 0) begin
         if (sig_DQ_local != sig_DQ_in)
            -> signal_input_DQ_change;
         sig_DQ_local = sig_DQ_in;
      end
   end
   
   always @(sig_LB_N_in) begin
      if (sig_LB_N_local != sig_LB_N_in)
         -> signal_input_LB_N_change;
      sig_LB_N_local = sig_LB_N_in;
   end
   
   always @(sig_OE_N_in) begin
      if (sig_OE_N_local != sig_OE_N_in)
         -> signal_input_OE_N_change;
      sig_OE_N_local = sig_OE_N_in;
   end
   
   always @(sig_UB_N_in) begin
      if (sig_UB_N_local != sig_UB_N_in)
         -> signal_input_UB_N_change;
      sig_UB_N_local = sig_UB_N_in;
   end
   
   always @(sig_WE_N_in) begin
      if (sig_WE_N_local != sig_WE_N_in)
         -> signal_input_WE_N_change;
      sig_WE_N_local = sig_WE_N_in;
   end
   


// synthesis translate_on

endmodule

