// Lean compiler output
// Module: Games.gameLibExpExp.Basic
// Imports: Init Games.gameLib.Basic
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
LEAN_EXPORT lean_object* l_cGame_c__hist__on__turn___rarg___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Game__World_c__state__on__turn(lean_object*, lean_object*);
uint8_t l_instDecidablePredNatTurn__fst(lean_object*);
LEAN_EXPORT lean_object* l_Game__World_c__hist__on__turn___rarg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Game__World_c__state__on__turn___rarg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
uint8_t l_instDecidablePredListHist__neutral___rarg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_cGame_c__hist__on__turn___rarg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Game__World_c__state__on__turn___rarg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_cGame_c__hist__on__turn(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Game__World_c__hist__on__turn(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Game__World_c__hist__on__turn___rarg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Game__World_c__hist__on__turn___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6) {
_start:
{
lean_object* x_7; uint8_t x_8; 
x_7 = lean_unsigned_to_nat(0u);
x_8 = lean_nat_dec_eq(x_6, x_7);
if (x_8 == 0)
{
lean_object* x_9; lean_object* x_10; lean_object* x_11; 
x_9 = lean_unsigned_to_nat(1u);
x_10 = lean_nat_sub(x_6, x_9);
lean_inc(x_5);
lean_inc(x_4);
lean_inc(x_3);
lean_inc(x_2);
x_11 = l_Game__World_c__hist__on__turn___rarg(x_1, x_2, x_3, x_4, x_5, x_10);
if (lean_obj_tag(x_11) == 2)
{
uint8_t x_12; 
x_12 = !lean_is_exclusive(x_11);
if (x_12 == 0)
{
lean_object* x_13; lean_object* x_14; uint8_t x_15; 
x_13 = lean_ctor_get(x_11, 0);
x_14 = lean_nat_add(x_10, x_9);
lean_dec(x_10);
x_15 = l_instDecidablePredNatTurn__fst(x_14);
lean_dec(x_14);
if (x_15 == 0)
{
lean_object* x_16; lean_object* x_17; uint8_t x_18; 
lean_dec(x_4);
lean_inc(x_13);
x_16 = lean_apply_4(x_5, x_13, lean_box(0), lean_box(0), lean_box(0));
x_17 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_17, 0, x_16);
lean_ctor_set(x_17, 1, x_13);
lean_inc(x_17);
x_18 = l_instDecidablePredListHist__neutral___rarg(x_2, x_3, x_17);
if (x_18 == 0)
{
lean_ctor_set_tag(x_11, 1);
lean_ctor_set(x_11, 0, x_17);
return x_11;
}
else
{
lean_ctor_set(x_11, 0, x_17);
return x_11;
}
}
else
{
lean_object* x_19; lean_object* x_20; uint8_t x_21; 
lean_dec(x_5);
lean_inc(x_13);
x_19 = lean_apply_4(x_4, x_13, lean_box(0), lean_box(0), lean_box(0));
x_20 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_20, 0, x_19);
lean_ctor_set(x_20, 1, x_13);
lean_inc(x_20);
x_21 = l_instDecidablePredListHist__neutral___rarg(x_2, x_3, x_20);
if (x_21 == 0)
{
lean_ctor_set_tag(x_11, 1);
lean_ctor_set(x_11, 0, x_20);
return x_11;
}
else
{
lean_ctor_set(x_11, 0, x_20);
return x_11;
}
}
}
else
{
lean_object* x_22; lean_object* x_23; uint8_t x_24; 
x_22 = lean_ctor_get(x_11, 0);
lean_inc(x_22);
lean_dec(x_11);
x_23 = lean_nat_add(x_10, x_9);
lean_dec(x_10);
x_24 = l_instDecidablePredNatTurn__fst(x_23);
lean_dec(x_23);
if (x_24 == 0)
{
lean_object* x_25; lean_object* x_26; uint8_t x_27; 
lean_dec(x_4);
lean_inc(x_22);
x_25 = lean_apply_4(x_5, x_22, lean_box(0), lean_box(0), lean_box(0));
x_26 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_26, 0, x_25);
lean_ctor_set(x_26, 1, x_22);
lean_inc(x_26);
x_27 = l_instDecidablePredListHist__neutral___rarg(x_2, x_3, x_26);
if (x_27 == 0)
{
lean_object* x_28; 
x_28 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_28, 0, x_26);
return x_28;
}
else
{
lean_object* x_29; 
x_29 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_29, 0, x_26);
return x_29;
}
}
else
{
lean_object* x_30; lean_object* x_31; uint8_t x_32; 
lean_dec(x_5);
lean_inc(x_22);
x_30 = lean_apply_4(x_4, x_22, lean_box(0), lean_box(0), lean_box(0));
x_31 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_31, 0, x_30);
lean_ctor_set(x_31, 1, x_22);
lean_inc(x_31);
x_32 = l_instDecidablePredListHist__neutral___rarg(x_2, x_3, x_31);
if (x_32 == 0)
{
lean_object* x_33; 
x_33 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_33, 0, x_31);
return x_33;
}
else
{
lean_object* x_34; 
x_34 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_34, 0, x_31);
return x_34;
}
}
}
}
else
{
lean_object* x_35; 
lean_dec(x_11);
lean_dec(x_10);
lean_dec(x_5);
lean_dec(x_4);
lean_dec(x_3);
lean_dec(x_2);
x_35 = lean_box(0);
return x_35;
}
}
else
{
lean_object* x_36; uint8_t x_37; 
lean_dec(x_5);
lean_dec(x_4);
x_36 = lean_box(0);
x_37 = l_instDecidablePredListHist__neutral___rarg(x_2, x_3, x_36);
if (x_37 == 0)
{
lean_object* x_38; 
x_38 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_38, 0, x_36);
return x_38;
}
else
{
lean_object* x_39; 
x_39 = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(x_39, 0, x_36);
return x_39;
}
}
}
}
LEAN_EXPORT lean_object* l_Game__World_c__hist__on__turn(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_alloc_closure((void*)(l_Game__World_c__hist__on__turn___rarg___boxed), 6, 0);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Game__World_c__hist__on__turn___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6) {
_start:
{
lean_object* x_7; 
x_7 = l_Game__World_c__hist__on__turn___rarg(x_1, x_2, x_3, x_4, x_5, x_6);
lean_dec(x_6);
lean_dec(x_1);
return x_7;
}
}
LEAN_EXPORT lean_object* l_cGame_c__hist__on__turn___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_5 = lean_ctor_get(x_1, 0);
lean_inc(x_5);
x_6 = lean_ctor_get(x_1, 1);
lean_inc(x_6);
x_7 = lean_ctor_get(x_1, 2);
lean_inc(x_7);
lean_dec(x_1);
x_8 = l_Game__World_c__hist__on__turn___rarg(x_5, x_2, x_3, x_6, x_7, x_4);
lean_dec(x_5);
return x_8;
}
}
LEAN_EXPORT lean_object* l_cGame_c__hist__on__turn(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_alloc_closure((void*)(l_cGame_c__hist__on__turn___rarg___boxed), 4, 0);
return x_3;
}
}
LEAN_EXPORT lean_object* l_cGame_c__hist__on__turn___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = l_cGame_c__hist__on__turn___rarg(x_1, x_2, x_3, x_4);
lean_dec(x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* l_Game__World_c__state__on__turn___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6) {
_start:
{
lean_object* x_7; uint8_t x_8; 
x_7 = lean_unsigned_to_nat(0u);
x_8 = lean_nat_dec_eq(x_6, x_7);
if (x_8 == 0)
{
lean_object* x_9; lean_object* x_10; lean_object* x_11; 
x_9 = lean_unsigned_to_nat(1u);
x_10 = lean_nat_sub(x_6, x_9);
lean_inc(x_5);
lean_inc(x_4);
x_11 = l_Game__World_c__hist__on__turn___rarg(x_1, x_2, x_3, x_4, x_5, x_10);
if (lean_obj_tag(x_11) == 2)
{
lean_object* x_12; lean_object* x_13; uint8_t x_14; 
x_12 = lean_ctor_get(x_11, 0);
lean_inc(x_12);
lean_dec(x_11);
x_13 = lean_nat_add(x_10, x_9);
lean_dec(x_10);
x_14 = l_instDecidablePredNatTurn__fst(x_13);
lean_dec(x_13);
if (x_14 == 0)
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; 
lean_dec(x_4);
x_15 = lean_ctor_get(x_1, 2);
lean_inc(x_15);
lean_dec(x_1);
lean_inc(x_12);
x_16 = lean_apply_4(x_5, x_12, lean_box(0), lean_box(0), lean_box(0));
x_17 = lean_apply_2(x_15, x_12, x_16);
x_18 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_18, 0, x_17);
return x_18;
}
else
{
lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; 
lean_dec(x_5);
x_19 = lean_ctor_get(x_1, 1);
lean_inc(x_19);
lean_dec(x_1);
lean_inc(x_12);
x_20 = lean_apply_4(x_4, x_12, lean_box(0), lean_box(0), lean_box(0));
x_21 = lean_apply_2(x_19, x_12, x_20);
x_22 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_22, 0, x_21);
return x_22;
}
}
else
{
lean_object* x_23; 
lean_dec(x_11);
lean_dec(x_10);
lean_dec(x_5);
lean_dec(x_4);
lean_dec(x_1);
x_23 = lean_box(0);
return x_23;
}
}
else
{
lean_object* x_24; lean_object* x_25; 
lean_dec(x_5);
lean_dec(x_4);
lean_dec(x_3);
lean_dec(x_2);
x_24 = lean_ctor_get(x_1, 0);
lean_inc(x_24);
lean_dec(x_1);
x_25 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_25, 0, x_24);
return x_25;
}
}
}
LEAN_EXPORT lean_object* l_Game__World_c__state__on__turn(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_alloc_closure((void*)(l_Game__World_c__state__on__turn___rarg___boxed), 6, 0);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Game__World_c__state__on__turn___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6) {
_start:
{
lean_object* x_7; 
x_7 = l_Game__World_c__state__on__turn___rarg(x_1, x_2, x_3, x_4, x_5, x_6);
lean_dec(x_6);
return x_7;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_Basic(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Games_gameLibExpExp_Basic(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
