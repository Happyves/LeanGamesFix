// Lean compiler output
// Module: Games.games.PickUpBricks
// Imports: Init Games.gameLib.Termination Games.gameLib.HistoryAPI
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
static lean_object* l_PickUpBricks__pubWin__vs__toy___closed__4;
LEAN_EXPORT lean_object* l_toy__strat___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_PickUpBricks__pubWin__vs__toy___elambda__1___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_bricks__from__ini__hist__act___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_bricks__from__ini__hist___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_bricks__from__ini__hist(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_PickUpBricks__pubWin__vs__toy___elambda__1(lean_object*, lean_object*, lean_object*);
lean_object* l_List_foldl___at_Composition_sizeUpTo___spec__2(lean_object*, lean_object*);
static lean_object* l_PickUpBricks__pubWin__vs__toy___closed__2;
LEAN_EXPORT lean_object* l___private_Games_games_PickUpBricks_0__pub__win__strat_match__1_splitter___rarg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Games_games_PickUpBricks_0__pub__win__strat_match__1_splitter(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Games_games_PickUpBricks_0__pub__win__strat_match__1_splitter___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_PickUpBricks___elambda__1___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_toy__strat(lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l_PickUpBricks__pubWin__vs__toy___closed__3;
static lean_object* l_PickUpBricks__pubWin__vs__toy___closed__5;
LEAN_EXPORT lean_object* l_PickUpBricks__pubWin__vs__toy___elambda__2___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_pub__win__strat___boxed(lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
static lean_object* l_PickUpBricks__pubWin__vs__toy___closed__1;
LEAN_EXPORT lean_object* l_pub__win__strat___rarg(lean_object*, lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_pub__win__strat(lean_object*);
LEAN_EXPORT lean_object* l_pub__win__strat___rarg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_PickUpBricks(lean_object*);
LEAN_EXPORT lean_object* l_PickUpBricks___elambda__1(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_bricks__from__ini__hist__act(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_PickUpBricks__pubWin__vs__toy___elambda__2(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_PickUpBricks__pubWin__vs__toy;
LEAN_EXPORT lean_object* l_bricks__from__ini__hist(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_3 = lean_unsigned_to_nat(0u);
x_4 = l_List_foldl___at_Composition_sizeUpTo___spec__2(x_3, x_2);
x_5 = lean_nat_sub(x_1, x_4);
lean_dec(x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* l_bricks__from__ini__hist___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_bricks__from__ini__hist(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_bricks__from__ini__hist__act(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_4 = lean_unsigned_to_nat(0u);
x_5 = l_List_foldl___at_Composition_sizeUpTo___spec__2(x_4, x_2);
x_6 = lean_nat_sub(x_1, x_5);
lean_dec(x_5);
x_7 = lean_nat_sub(x_6, x_3);
lean_dec(x_6);
return x_7;
}
}
LEAN_EXPORT lean_object* l_bricks__from__ini__hist__act___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_bricks__from__ini__hist__act(x_1, x_2, x_3);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* l_PickUpBricks___elambda__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_bricks__from__ini__hist__act(x_1, x_2, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* l_PickUpBricks(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
lean_inc(x_1);
x_2 = lean_alloc_closure((void*)(l_PickUpBricks___elambda__1___boxed), 3, 1);
lean_closure_set(x_2, 0, x_1);
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_PickUpBricks___elambda__1___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_PickUpBricks___elambda__1(x_1, x_2, x_3);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* l_pub__win__strat___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; uint8_t x_6; 
x_4 = lean_ctor_get(x_1, 0);
x_5 = lean_unsigned_to_nat(2u);
x_6 = lean_nat_dec_eq(x_4, x_5);
if (x_6 == 0)
{
lean_object* x_7; 
x_7 = lean_unsigned_to_nat(2u);
return x_7;
}
else
{
lean_object* x_8; 
x_8 = lean_unsigned_to_nat(1u);
return x_8;
}
}
}
LEAN_EXPORT lean_object* l_pub__win__strat(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l_pub__win__strat___rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l_pub__win__strat___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_pub__win__strat___rarg(x_1, x_2, x_3);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* l_pub__win__strat___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_pub__win__strat(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_toy__strat(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lean_unsigned_to_nat(1u);
return x_5;
}
}
LEAN_EXPORT lean_object* l_toy__strat___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = l_toy__strat(x_1, x_2, x_3, x_4);
lean_dec(x_2);
lean_dec(x_1);
return x_5;
}
}
LEAN_EXPORT lean_object* l_PickUpBricks__pubWin__vs__toy___elambda__1(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_pub__win__strat___rarg(x_1, lean_box(0), lean_box(0));
return x_4;
}
}
LEAN_EXPORT lean_object* l_PickUpBricks__pubWin__vs__toy___elambda__2(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lean_unsigned_to_nat(1u);
return x_4;
}
}
static lean_object* _init_l_PickUpBricks__pubWin__vs__toy___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(37u);
x_2 = lean_alloc_closure((void*)(l_PickUpBricks___elambda__1___boxed), 3, 1);
lean_closure_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l_PickUpBricks__pubWin__vs__toy___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_unsigned_to_nat(37u);
x_2 = l_PickUpBricks__pubWin__vs__toy___closed__1;
x_3 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l_PickUpBricks__pubWin__vs__toy___closed__3() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_PickUpBricks__pubWin__vs__toy___elambda__2___boxed), 3, 0);
return x_1;
}
}
static lean_object* _init_l_PickUpBricks__pubWin__vs__toy___closed__4() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_PickUpBricks__pubWin__vs__toy___elambda__1___boxed), 3, 0);
return x_1;
}
}
static lean_object* _init_l_PickUpBricks__pubWin__vs__toy___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = l_PickUpBricks__pubWin__vs__toy___closed__2;
x_2 = l_PickUpBricks__pubWin__vs__toy___closed__3;
x_3 = l_PickUpBricks__pubWin__vs__toy___closed__4;
x_4 = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(x_4, 0, x_1);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_3);
return x_4;
}
}
static lean_object* _init_l_PickUpBricks__pubWin__vs__toy() {
_start:
{
lean_object* x_1; 
x_1 = l_PickUpBricks__pubWin__vs__toy___closed__5;
return x_1;
}
}
LEAN_EXPORT lean_object* l_PickUpBricks__pubWin__vs__toy___elambda__1___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_PickUpBricks__pubWin__vs__toy___elambda__1(x_1, x_2, x_3);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* l_PickUpBricks__pubWin__vs__toy___elambda__2___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_PickUpBricks__pubWin__vs__toy___elambda__2(x_1, x_2, x_3);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* l___private_Games_games_PickUpBricks_0__pub__win__strat_match__1_splitter___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_6; 
lean_dec(x_5);
x_6 = lean_apply_3(x_4, lean_box(0), lean_box(0), lean_box(0));
return x_6;
}
else
{
lean_object* x_7; lean_object* x_8; lean_object* x_9; 
lean_dec(x_4);
x_7 = lean_ctor_get(x_1, 0);
lean_inc(x_7);
x_8 = lean_ctor_get(x_1, 1);
lean_inc(x_8);
lean_dec(x_1);
x_9 = lean_apply_5(x_5, x_7, x_8, lean_box(0), lean_box(0), lean_box(0));
return x_9;
}
}
}
LEAN_EXPORT lean_object* l___private_Games_games_PickUpBricks_0__pub__win__strat_match__1_splitter(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_alloc_closure((void*)(l___private_Games_games_PickUpBricks_0__pub__win__strat_match__1_splitter___rarg), 5, 0);
return x_3;
}
}
LEAN_EXPORT lean_object* l___private_Games_games_PickUpBricks_0__pub__win__strat_match__1_splitter___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l___private_Games_games_PickUpBricks_0__pub__win__strat_match__1_splitter(x_1, x_2);
lean_dec(x_1);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_Termination(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_HistoryAPI(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Games_games_PickUpBricks(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_Termination(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_HistoryAPI(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_PickUpBricks__pubWin__vs__toy___closed__1 = _init_l_PickUpBricks__pubWin__vs__toy___closed__1();
lean_mark_persistent(l_PickUpBricks__pubWin__vs__toy___closed__1);
l_PickUpBricks__pubWin__vs__toy___closed__2 = _init_l_PickUpBricks__pubWin__vs__toy___closed__2();
lean_mark_persistent(l_PickUpBricks__pubWin__vs__toy___closed__2);
l_PickUpBricks__pubWin__vs__toy___closed__3 = _init_l_PickUpBricks__pubWin__vs__toy___closed__3();
lean_mark_persistent(l_PickUpBricks__pubWin__vs__toy___closed__3);
l_PickUpBricks__pubWin__vs__toy___closed__4 = _init_l_PickUpBricks__pubWin__vs__toy___closed__4();
lean_mark_persistent(l_PickUpBricks__pubWin__vs__toy___closed__4);
l_PickUpBricks__pubWin__vs__toy___closed__5 = _init_l_PickUpBricks__pubWin__vs__toy___closed__5();
lean_mark_persistent(l_PickUpBricks__pubWin__vs__toy___closed__5);
l_PickUpBricks__pubWin__vs__toy = _init_l_PickUpBricks__pubWin__vs__toy();
lean_mark_persistent(l_PickUpBricks__pubWin__vs__toy);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
