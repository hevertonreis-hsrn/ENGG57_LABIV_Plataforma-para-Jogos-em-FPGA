// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "Vtop.h"
#include "Vtop__Syms.h"

//==========

void Vtop::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtop::eval\n"); );
    Vtop__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vtop* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("top.v", 1, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vtop::_eval_initial_loop(Vtop__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("top.v", 1, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Vtop::_sequent__TOP__1(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_sequent__TOP__1\n"); );
    Vtop* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->top__DOT__clk25Mhz = (1U & (~ (IData)(vlTOPp->top__DOT__clk25Mhz)));
}

VL_INLINE_OPT void Vtop::_sequent__TOP__4(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_sequent__TOP__4\n"); );
    Vtop* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->top__DOT__de) {
        vlTOPp->sdl_g = (0xffU & (IData)(vlTOPp->top__DOT__vCount));
        vlTOPp->sdl_r = (0xffU & (IData)(vlTOPp->top__DOT__hCount));
        vlTOPp->sdl_b = (0xffU & ((IData)(vlTOPp->top__DOT__hCount) 
                                  ^ (IData)(vlTOPp->top__DOT__vCount)));
    } else {
        vlTOPp->sdl_g = 0U;
        vlTOPp->sdl_r = 0U;
        vlTOPp->sdl_b = 0U;
    }
}

VL_INLINE_OPT void Vtop::_sequent__TOP__5(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_sequent__TOP__5\n"); );
    Vtop* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    SData/*9:0*/ __Vdly__top__DOT__hCount;
    SData/*9:0*/ __Vdly__top__DOT__vCount;
    // Body
    __Vdly__top__DOT__vCount = vlTOPp->top__DOT__vCount;
    __Vdly__top__DOT__hCount = vlTOPp->top__DOT__hCount;
    if (vlTOPp->sim_rst) {
        __Vdly__top__DOT__hCount = 0U;
        __Vdly__top__DOT__vCount = 0U;
    } else {
        if ((0x31fU == (IData)(vlTOPp->top__DOT__hCount))) {
            __Vdly__top__DOT__vCount = ((0x20cU == (IData)(vlTOPp->top__DOT__vCount))
                                         ? 0U : (0x3ffU 
                                                 & ((IData)(1U) 
                                                    + (IData)(vlTOPp->top__DOT__vCount))));
            __Vdly__top__DOT__hCount = 0U;
        } else {
            __Vdly__top__DOT__hCount = (0x3ffU & ((IData)(1U) 
                                                  + (IData)(vlTOPp->top__DOT__hCount)));
        }
    }
    vlTOPp->top__DOT__hCount = __Vdly__top__DOT__hCount;
    vlTOPp->top__DOT__vCount = __Vdly__top__DOT__vCount;
    vlTOPp->sdl_sx = vlTOPp->top__DOT__hCount;
    vlTOPp->sdl_sy = vlTOPp->top__DOT__vCount;
    vlTOPp->top__DOT__de = ((0x27fU >= (IData)(vlTOPp->top__DOT__hCount)) 
                            & (0x1dfU >= (IData)(vlTOPp->top__DOT__vCount)));
    vlTOPp->sdl_de = vlTOPp->top__DOT__de;
}

void Vtop::_eval(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_eval\n"); );
    Vtop* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__top__DOT__clk25Mhz) 
         & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__top__DOT__clk25Mhz)))) {
        vlTOPp->_sequent__TOP__4(vlSymsp);
    }
    if ((((IData)(vlTOPp->sim_rst) & (~ (IData)(vlTOPp->__Vclklast__TOP__sim_rst))) 
         | ((IData)(vlTOPp->__VinpClk__TOP__top__DOT__clk25Mhz) 
            & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__top__DOT__clk25Mhz))))) {
        vlTOPp->_sequent__TOP__5(vlSymsp);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__top__DOT__clk25Mhz 
        = vlTOPp->__VinpClk__TOP__top__DOT__clk25Mhz;
    vlTOPp->__Vclklast__TOP__sim_rst = vlTOPp->sim_rst;
    vlTOPp->__VinpClk__TOP__top__DOT__clk25Mhz = vlTOPp->top__DOT__clk25Mhz;
}

VL_INLINE_OPT QData Vtop::_change_request(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_change_request\n"); );
    Vtop* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData Vtop::_change_request_1(Vtop__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_change_request_1\n"); );
    Vtop* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    __req |= ((vlTOPp->top__DOT__clk25Mhz ^ vlTOPp->__Vchglast__TOP__top__DOT__clk25Mhz));
    VL_DEBUG_IF( if(__req && ((vlTOPp->top__DOT__clk25Mhz ^ vlTOPp->__Vchglast__TOP__top__DOT__clk25Mhz))) VL_DBG_MSGF("        CHANGE: top.v:13: top.clk25Mhz\n"); );
    // Final
    vlTOPp->__Vchglast__TOP__top__DOT__clk25Mhz = vlTOPp->top__DOT__clk25Mhz;
    return __req;
}

#ifdef VL_DEBUG
void Vtop::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((sim_rst & 0xfeU))) {
        Verilated::overWidthError("sim_rst");}
}
#endif  // VL_DEBUG
