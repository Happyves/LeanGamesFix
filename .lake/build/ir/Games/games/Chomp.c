// Lean compiler output
// Module: Games.games.Chomp
// Imports: Init Games.gameLib.Stealing
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
LEAN_EXPORT uint8_t l_instDecidableRelProdNatNondomi(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_instDecidableRelProdNatDomi___boxed(lean_object*, lean_object*);
static uint8_t l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__2;
LEAN_EXPORT lean_object* l_Chomp(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_instDecidableRelProdNatDomi(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Chomp__state(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Chomp__init(lean_object*, lean_object*);
uint8_t l_instDecidableNot___rarg(uint8_t);
LEAN_EXPORT lean_object* l_Chomp___boxed(lean_object*, lean_object*);
lean_object* l_List_range(lean_object*);
LEAN_EXPORT lean_object* l_List_filterTR_loop___at_Chomp__state___spec__3(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Multiset_filter___at_Chomp__state___spec__2(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Chomp__init___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_preChomp___elambda__1(lean_object*, lean_object*, lean_object*);
uint8_t l_List_decidableBAll___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_preChomp___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_preChomp(lean_object*, lean_object*);
LEAN_EXPORT uint8_t l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi(lean_object*, lean_object*);
static uint8_t l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__1;
lean_object* l_List_reverse___rarg(lean_object*);
LEAN_EXPORT lean_object* l_instDecidableRelProdNatNondomi___boxed(lean_object*, lean_object*);
lean_object* l_Multiset_product___rarg(lean_object*, lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Finset_filter___at_Chomp__state___spec__1(lean_object*, lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
uint8_t l_And_decidable___rarg(uint8_t, uint8_t);
LEAN_EXPORT uint8_t l_instDecidableRelProdNatDomi(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; lean_object* x_6; lean_object* x_7; uint8_t x_8; uint8_t x_9; 
x_3 = lean_ctor_get(x_1, 0);
x_4 = lean_ctor_get(x_2, 0);
x_5 = lean_nat_dec_le(x_3, x_4);
x_6 = lean_ctor_get(x_1, 1);
x_7 = lean_ctor_get(x_2, 1);
x_8 = lean_nat_dec_le(x_6, x_7);
x_9 = l_And_decidable___rarg(x_5, x_8);
return x_9;
}
}
LEAN_EXPORT lean_object* l_instDecidableRelProdNatDomi___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_instDecidableRelProdNatDomi(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT uint8_t l_instDecidableRelProdNatNondomi(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; uint8_t x_4; 
x_3 = l_instDecidableRelProdNatDomi(x_1, x_2);
x_4 = l_instDecidableNot___rarg(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_instDecidableRelProdNatNondomi___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_instDecidableRelProdNatNondomi(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
static uint8_t _init_l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__1() {
_start:
{
uint8_t x_1; uint8_t x_2; 
x_1 = 0;
x_2 = l_instDecidableNot___rarg(x_1);
return x_2;
}
}
static uint8_t _init_l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__2() {
_start:
{
uint8_t x_1; uint8_t x_2; 
x_1 = 1;
x_2 = l_instDecidableNot___rarg(x_1);
return x_2;
}
}
LEAN_EXPORT uint8_t l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; uint8_t x_5; 
x_3 = lean_ctor_get(x_2, 0);
x_4 = lean_ctor_get(x_1, 0);
x_5 = lean_nat_dec_le(x_3, x_4);
if (x_5 == 0)
{
uint8_t x_6; 
x_6 = l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__1;
return x_6;
}
else
{
lean_object* x_7; lean_object* x_8; uint8_t x_9; 
x_7 = lean_ctor_get(x_2, 1);
x_8 = lean_ctor_get(x_1, 1);
x_9 = lean_nat_dec_le(x_7, x_8);
if (x_9 == 0)
{
uint8_t x_10; 
x_10 = l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__1;
return x_10;
}
else
{
uint8_t x_11; 
x_11 = l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__2;
return x_11;
}
}
}
}
LEAN_EXPORT uint8_t l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; uint8_t x_4; 
x_3 = lean_alloc_closure((void*)(l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___boxed), 2, 1);
lean_closure_set(x_3, 0, x_2);
x_4 = l_List_decidableBAll___rarg(x_3, x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; lean_object* x_4; 
x_3 = l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi(x_1, x_2);
x_4 = lean_box(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_List_filterTR_loop___at_Chomp__state___spec__3(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_4; 
lean_dec(x_1);
x_4 = l_List_reverse___rarg(x_3);
return x_4;
}
else
{
uint8_t x_5; 
x_5 = !lean_is_exclusive(x_2);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; uint8_t x_8; 
x_6 = lean_ctor_get(x_2, 0);
x_7 = lean_ctor_get(x_2, 1);
lean_inc(x_6);
lean_inc(x_1);
x_8 = l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi(x_1, x_6);
if (x_8 == 0)
{
lean_free_object(x_2);
lean_dec(x_6);
x_2 = x_7;
goto _start;
}
else
{
lean_ctor_set(x_2, 1, x_3);
{
lean_object* _tmp_1 = x_7;
lean_object* _tmp_2 = x_2;
x_2 = _tmp_1;
x_3 = _tmp_2;
}
goto _start;
}
}
else
{
lean_object* x_11; lean_object* x_12; uint8_t x_13; 
x_11 = lean_ctor_get(x_2, 0);
x_12 = lean_ctor_get(x_2, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_2);
lean_inc(x_11);
lean_inc(x_1);
x_13 = l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi(x_1, x_11);
if (x_13 == 0)
{
lean_dec(x_11);
x_2 = x_12;
goto _start;
}
else
{
lean_object* x_15; 
x_15 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_15, 0, x_11);
lean_ctor_set(x_15, 1, x_3);
x_2 = x_12;
x_3 = x_15;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* l_Multiset_filter___at_Chomp__state___spec__2(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = l_List_filterTR_loop___at_Chomp__state___spec__3(x_1, x_2, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_Finset_filter___at_Chomp__state___spec__1(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_Multiset_filter___at_Chomp__state___spec__2(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Chomp__state(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_Multiset_filter___at_Chomp__state___spec__2(x_2, x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Chomp__init(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_3 = lean_unsigned_to_nat(1u);
x_4 = lean_nat_add(x_2, x_3);
x_5 = l_List_range(x_4);
x_6 = lean_nat_add(x_1, x_3);
x_7 = l_List_range(x_6);
x_8 = l_Multiset_product___rarg(x_5, x_7);
return x_8;
}
}
LEAN_EXPORT lean_object* l_Chomp__init___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_Chomp__init(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_preChomp___elambda__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; 
x_4 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
x_5 = l_Multiset_filter___at_Chomp__state___spec__2(x_4, x_1);
return x_5;
}
}
LEAN_EXPORT lean_object* l_preChomp(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_3 = l_Chomp__init(x_1, x_2);
lean_inc(x_3);
x_4 = lean_alloc_closure((void*)(l_preChomp___elambda__1), 3, 1);
lean_closure_set(x_4, 0, x_3);
x_5 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_5, 0, x_3);
lean_ctor_set(x_5, 1, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* l_preChomp___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_preChomp(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Chomp(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_preChomp(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Chomp___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_Chomp(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_Stealing(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Games_games_Chomp(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_Stealing(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__1 = _init_l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__1();
l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__2 = _init_l_instDecidablePredProdNatForAllMemListInstMembershipListNondomi___lambda__1___closed__2();
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
