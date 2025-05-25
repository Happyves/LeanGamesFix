// Lean compiler output
// Module: Games
// Imports: Init Games.exLib.Nat Games.exLib.List Games.exLib.General Games.exLib.Versioning Games.gameLib.Basic Games.gameLib.CoherentEnd Games.gameLib.ConwayInduction Games.gameLib.HistoryAPI Games.gameLib.HistoryMoves Games.gameLib.Pairing Games.gameLib.Playability Games.gameLib.Positional Games.gameLib.StateAPI Games.gameLib.Stealing Games.gameLib.StrategyAPI Games.gameLib.Termination Games.gameLib.TurnAPI Games.gameLib.Zermelo Games.games.Chomp Games.games.PickUpBricks Games.games.TicTacToe Games.games.TTT_CombinatorialLines
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
LEAN_EXPORT lean_object* _lean_main(lean_object*);
lean_object* l_String_toNat_x3f(lean_object*);
LEAN_EXPORT lean_object* l_main___boxed__const__1;
static lean_object* l_main___closed__3;
static lean_object* l_WelcomeAndRules___closed__1;
LEAN_EXPORT lean_object* l_WelcomeAndRules;
lean_object* lean_get_stdout(lean_object*);
static lean_object* l_mainLoop___closed__6;
lean_object* l_bricks__from__ini__hist(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_mainLoop___boxed__const__1;
static lean_object* l_mainLoop___closed__5;
static lean_object* l_main___closed__1;
LEAN_EXPORT lean_object* l_mainLoop(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static lean_object* l_main___closed__5;
static lean_object* l_main___closed__4;
lean_object* lean_get_stdin(lean_object*);
static lean_object* l_mainLoop___closed__4;
static lean_object* l_mainLoop___closed__3;
static lean_object* l_mainLoop___closed__7;
static lean_object* l_mainLoop___closed__1;
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
lean_object* l_pub__win__strat___rarg(lean_object*, lean_object*, lean_object*);
static lean_object* l_mainLoop___closed__2;
static lean_object* l_mainLoop___closed__8;
lean_object* l_IO_FS_Stream_putStrLn(lean_object*, lean_object*, lean_object*);
static uint8_t l_main___closed__2;
lean_object* lean_string_append(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_mainLoop___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_Nat_repr(lean_object*);
static lean_object* _init_l_WelcomeAndRules___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("Welcome to the game of Pick Up Bricks (PUB).\nThe game starts with 9 bricks placed on a stack.\nYou'll start, writing either \"1\" or \"2\" into stdin, corresponding to the number of bricks you'd like to take from the stack.\nThe last player to take a brick from the stack wins the game.\nWe'll have you play against PUB's winning strategy.\nEnjoy loosing !\n", 349);
return x_1;
}
}
static lean_object* _init_l_WelcomeAndRules() {
_start:
{
lean_object* x_1; 
x_1 = l_WelcomeAndRules___closed__1;
return x_1;
}
}
static lean_object* _init_l_mainLoop___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("[Info] Please enter the number of bricks you'd like to take from the stack :", 76);
return x_1;
}
}
static lean_object* _init_l_mainLoop___closed__2() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("[Info] Please enter a number", 28);
return x_1;
}
}
static lean_object* _init_l_mainLoop___closed__3() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("[Info] The opponent took ", 25);
return x_1;
}
}
static lean_object* _init_l_mainLoop___closed__4() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes(" brick(s)", 9);
return x_1;
}
}
static lean_object* _init_l_mainLoop___closed__5() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("[Info] The current number of bricks on the stack is ", 52);
return x_1;
}
}
static lean_object* _init_l_mainLoop___closed__6() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("", 0);
return x_1;
}
}
static lean_object* _init_l_mainLoop___closed__7() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("[Info] The game has ended. You lost :)", 38);
return x_1;
}
}
static lean_object* _init_l_mainLoop___closed__8() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("[Info] You may only take 1 or 2 bricks", 38);
return x_1;
}
}
static lean_object* _init_l_mainLoop___boxed__const__1() {
_start:
{
uint32_t x_1; lean_object* x_2; 
x_1 = 0;
x_2 = lean_box_uint32(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_mainLoop(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6, lean_object* x_7) {
_start:
{
lean_object* x_8; lean_object* x_9; 
x_8 = l_mainLoop___closed__1;
lean_inc(x_2);
x_9 = l_IO_FS_Stream_putStrLn(x_2, x_8, x_7);
if (lean_obj_tag(x_9) == 0)
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; 
x_10 = lean_ctor_get(x_9, 1);
lean_inc(x_10);
lean_dec(x_9);
x_11 = lean_ctor_get(x_1, 3);
lean_inc(x_11);
x_12 = lean_apply_1(x_11, x_10);
if (lean_obj_tag(x_12) == 0)
{
lean_object* x_13; lean_object* x_14; lean_object* x_15; 
x_13 = lean_ctor_get(x_12, 0);
lean_inc(x_13);
x_14 = lean_ctor_get(x_12, 1);
lean_inc(x_14);
lean_dec(x_12);
x_15 = l_String_toNat_x3f(x_13);
lean_dec(x_13);
if (lean_obj_tag(x_15) == 0)
{
lean_object* x_16; lean_object* x_17; 
x_16 = l_mainLoop___closed__2;
lean_inc(x_2);
x_17 = l_IO_FS_Stream_putStrLn(x_2, x_16, x_14);
if (lean_obj_tag(x_17) == 0)
{
lean_object* x_18; 
x_18 = lean_ctor_get(x_17, 1);
lean_inc(x_18);
lean_dec(x_17);
x_5 = lean_box(0);
x_6 = lean_box(0);
x_7 = x_18;
goto _start;
}
else
{
uint8_t x_20; 
lean_dec(x_4);
lean_dec(x_2);
lean_dec(x_1);
x_20 = !lean_is_exclusive(x_17);
if (x_20 == 0)
{
return x_17;
}
else
{
lean_object* x_21; lean_object* x_22; lean_object* x_23; 
x_21 = lean_ctor_get(x_17, 0);
x_22 = lean_ctor_get(x_17, 1);
lean_inc(x_22);
lean_inc(x_21);
lean_dec(x_17);
x_23 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_23, 0, x_21);
lean_ctor_set(x_23, 1, x_22);
return x_23;
}
}
}
else
{
lean_object* x_24; lean_object* x_25; lean_object* x_68; uint8_t x_69; 
x_24 = lean_ctor_get(x_15, 0);
lean_inc(x_24);
lean_dec(x_15);
x_68 = lean_unsigned_to_nat(1u);
x_69 = lean_nat_dec_eq(x_24, x_68);
if (x_69 == 0)
{
lean_object* x_70; uint8_t x_71; 
x_70 = lean_unsigned_to_nat(2u);
x_71 = lean_nat_dec_eq(x_24, x_70);
if (x_71 == 0)
{
lean_object* x_72; lean_object* x_73; 
lean_dec(x_24);
x_72 = l_mainLoop___closed__8;
lean_inc(x_2);
x_73 = l_IO_FS_Stream_putStrLn(x_2, x_72, x_14);
if (lean_obj_tag(x_73) == 0)
{
lean_object* x_74; 
x_74 = lean_ctor_get(x_73, 1);
lean_inc(x_74);
lean_dec(x_73);
x_5 = lean_box(0);
x_6 = lean_box(0);
x_7 = x_74;
goto _start;
}
else
{
uint8_t x_76; 
lean_dec(x_4);
lean_dec(x_2);
lean_dec(x_1);
x_76 = !lean_is_exclusive(x_73);
if (x_76 == 0)
{
return x_73;
}
else
{
lean_object* x_77; lean_object* x_78; lean_object* x_79; 
x_77 = lean_ctor_get(x_73, 0);
x_78 = lean_ctor_get(x_73, 1);
lean_inc(x_78);
lean_inc(x_77);
lean_dec(x_73);
x_79 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_79, 0, x_77);
lean_ctor_set(x_79, 1, x_78);
return x_79;
}
}
}
else
{
lean_object* x_80; 
x_80 = lean_box(0);
x_25 = x_80;
goto block_67;
}
}
else
{
lean_object* x_81; 
x_81 = lean_box(0);
x_25 = x_81;
goto block_67;
}
block_67:
{
lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; lean_object* x_32; lean_object* x_33; lean_object* x_34; 
lean_dec(x_25);
x_26 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_26, 0, x_24);
lean_ctor_set(x_26, 1, x_4);
x_27 = l_pub__win__strat___rarg(x_26, lean_box(0), lean_box(0));
lean_inc(x_27);
x_28 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_28, 0, x_27);
lean_ctor_set(x_28, 1, x_26);
x_29 = l_Nat_repr(x_27);
x_30 = l_mainLoop___closed__3;
x_31 = lean_string_append(x_30, x_29);
lean_dec(x_29);
x_32 = l_mainLoop___closed__4;
x_33 = lean_string_append(x_31, x_32);
lean_inc(x_2);
x_34 = l_IO_FS_Stream_putStrLn(x_2, x_33, x_14);
if (lean_obj_tag(x_34) == 0)
{
lean_object* x_35; lean_object* x_36; lean_object* x_37; uint8_t x_38; 
x_35 = lean_ctor_get(x_34, 1);
lean_inc(x_35);
lean_dec(x_34);
x_36 = l_bricks__from__ini__hist(x_3, x_28);
x_37 = lean_unsigned_to_nat(0u);
x_38 = lean_nat_dec_eq(x_36, x_37);
if (x_38 == 0)
{
lean_object* x_39; lean_object* x_40; lean_object* x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; 
x_39 = l_Nat_repr(x_36);
x_40 = l_mainLoop___closed__5;
x_41 = lean_string_append(x_40, x_39);
lean_dec(x_39);
x_42 = l_mainLoop___closed__6;
x_43 = lean_string_append(x_41, x_42);
lean_inc(x_2);
x_44 = l_IO_FS_Stream_putStrLn(x_2, x_43, x_35);
if (lean_obj_tag(x_44) == 0)
{
lean_object* x_45; 
x_45 = lean_ctor_get(x_44, 1);
lean_inc(x_45);
lean_dec(x_44);
x_4 = x_28;
x_5 = lean_box(0);
x_6 = lean_box(0);
x_7 = x_45;
goto _start;
}
else
{
uint8_t x_47; 
lean_dec(x_28);
lean_dec(x_2);
lean_dec(x_1);
x_47 = !lean_is_exclusive(x_44);
if (x_47 == 0)
{
return x_44;
}
else
{
lean_object* x_48; lean_object* x_49; lean_object* x_50; 
x_48 = lean_ctor_get(x_44, 0);
x_49 = lean_ctor_get(x_44, 1);
lean_inc(x_49);
lean_inc(x_48);
lean_dec(x_44);
x_50 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_50, 0, x_48);
lean_ctor_set(x_50, 1, x_49);
return x_50;
}
}
}
else
{
lean_object* x_51; lean_object* x_52; 
lean_dec(x_36);
lean_dec(x_28);
lean_dec(x_1);
x_51 = l_mainLoop___closed__7;
x_52 = l_IO_FS_Stream_putStrLn(x_2, x_51, x_35);
if (lean_obj_tag(x_52) == 0)
{
uint8_t x_53; 
x_53 = !lean_is_exclusive(x_52);
if (x_53 == 0)
{
lean_object* x_54; lean_object* x_55; 
x_54 = lean_ctor_get(x_52, 0);
lean_dec(x_54);
x_55 = l_mainLoop___boxed__const__1;
lean_ctor_set(x_52, 0, x_55);
return x_52;
}
else
{
lean_object* x_56; lean_object* x_57; lean_object* x_58; 
x_56 = lean_ctor_get(x_52, 1);
lean_inc(x_56);
lean_dec(x_52);
x_57 = l_mainLoop___boxed__const__1;
x_58 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_58, 0, x_57);
lean_ctor_set(x_58, 1, x_56);
return x_58;
}
}
else
{
uint8_t x_59; 
x_59 = !lean_is_exclusive(x_52);
if (x_59 == 0)
{
return x_52;
}
else
{
lean_object* x_60; lean_object* x_61; lean_object* x_62; 
x_60 = lean_ctor_get(x_52, 0);
x_61 = lean_ctor_get(x_52, 1);
lean_inc(x_61);
lean_inc(x_60);
lean_dec(x_52);
x_62 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_62, 0, x_60);
lean_ctor_set(x_62, 1, x_61);
return x_62;
}
}
}
}
else
{
uint8_t x_63; 
lean_dec(x_28);
lean_dec(x_2);
lean_dec(x_1);
x_63 = !lean_is_exclusive(x_34);
if (x_63 == 0)
{
return x_34;
}
else
{
lean_object* x_64; lean_object* x_65; lean_object* x_66; 
x_64 = lean_ctor_get(x_34, 0);
x_65 = lean_ctor_get(x_34, 1);
lean_inc(x_65);
lean_inc(x_64);
lean_dec(x_34);
x_66 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_66, 0, x_64);
lean_ctor_set(x_66, 1, x_65);
return x_66;
}
}
}
}
}
else
{
uint8_t x_82; 
lean_dec(x_4);
lean_dec(x_2);
lean_dec(x_1);
x_82 = !lean_is_exclusive(x_12);
if (x_82 == 0)
{
return x_12;
}
else
{
lean_object* x_83; lean_object* x_84; lean_object* x_85; 
x_83 = lean_ctor_get(x_12, 0);
x_84 = lean_ctor_get(x_12, 1);
lean_inc(x_84);
lean_inc(x_83);
lean_dec(x_12);
x_85 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_85, 0, x_83);
lean_ctor_set(x_85, 1, x_84);
return x_85;
}
}
}
else
{
uint8_t x_86; 
lean_dec(x_4);
lean_dec(x_2);
lean_dec(x_1);
x_86 = !lean_is_exclusive(x_9);
if (x_86 == 0)
{
return x_9;
}
else
{
lean_object* x_87; lean_object* x_88; lean_object* x_89; 
x_87 = lean_ctor_get(x_9, 0);
x_88 = lean_ctor_get(x_9, 1);
lean_inc(x_88);
lean_inc(x_87);
lean_dec(x_9);
x_89 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_89, 0, x_87);
lean_ctor_set(x_89, 1, x_88);
return x_89;
}
}
}
}
LEAN_EXPORT lean_object* l_mainLoop___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6, lean_object* x_7) {
_start:
{
lean_object* x_8; 
x_8 = l_mainLoop(x_1, x_2, x_3, x_4, x_5, x_6, x_7);
lean_dec(x_3);
return x_8;
}
}
static lean_object* _init_l_main___closed__1() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_box(0);
x_2 = lean_unsigned_to_nat(9u);
x_3 = l_bricks__from__ini__hist(x_2, x_1);
return x_3;
}
}
static uint8_t _init_l_main___closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; uint8_t x_3; 
x_1 = l_main___closed__1;
x_2 = lean_unsigned_to_nat(0u);
x_3 = lean_nat_dec_eq(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_main___closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l_main___closed__1;
x_2 = l_Nat_repr(x_1);
return x_2;
}
}
static lean_object* _init_l_main___closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_mainLoop___closed__5;
x_2 = l_main___closed__3;
x_3 = lean_string_append(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_main___closed__5() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l_main___closed__4;
x_2 = l_mainLoop___closed__6;
x_3 = lean_string_append(x_1, x_2);
return x_3;
}
}
static lean_object* _init_l_main___boxed__const__1() {
_start:
{
uint32_t x_1; lean_object* x_2; 
x_1 = 0;
x_2 = lean_box_uint32(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* _lean_main(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_2 = lean_get_stdin(x_1);
x_3 = lean_ctor_get(x_2, 0);
lean_inc(x_3);
x_4 = lean_ctor_get(x_2, 1);
lean_inc(x_4);
lean_dec(x_2);
x_5 = lean_get_stdout(x_4);
x_6 = lean_ctor_get(x_5, 0);
lean_inc(x_6);
x_7 = lean_ctor_get(x_5, 1);
lean_inc(x_7);
lean_dec(x_5);
x_8 = l_WelcomeAndRules;
lean_inc(x_6);
x_9 = l_IO_FS_Stream_putStrLn(x_6, x_8, x_7);
if (lean_obj_tag(x_9) == 0)
{
lean_object* x_10; uint8_t x_11; 
x_10 = lean_ctor_get(x_9, 1);
lean_inc(x_10);
lean_dec(x_9);
x_11 = l_main___closed__2;
if (x_11 == 0)
{
lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_12 = lean_box(0);
x_13 = l_main___closed__5;
lean_inc(x_6);
x_14 = l_IO_FS_Stream_putStrLn(x_6, x_13, x_10);
if (lean_obj_tag(x_14) == 0)
{
lean_object* x_15; lean_object* x_16; lean_object* x_17; 
x_15 = lean_ctor_get(x_14, 1);
lean_inc(x_15);
lean_dec(x_14);
x_16 = lean_unsigned_to_nat(9u);
x_17 = l_mainLoop(x_3, x_6, x_16, x_12, lean_box(0), lean_box(0), x_15);
return x_17;
}
else
{
uint8_t x_18; 
lean_dec(x_6);
lean_dec(x_3);
x_18 = !lean_is_exclusive(x_14);
if (x_18 == 0)
{
return x_14;
}
else
{
lean_object* x_19; lean_object* x_20; lean_object* x_21; 
x_19 = lean_ctor_get(x_14, 0);
x_20 = lean_ctor_get(x_14, 1);
lean_inc(x_20);
lean_inc(x_19);
lean_dec(x_14);
x_21 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_21, 0, x_19);
lean_ctor_set(x_21, 1, x_20);
return x_21;
}
}
}
else
{
lean_object* x_22; lean_object* x_23; 
lean_dec(x_3);
x_22 = l_mainLoop___closed__7;
x_23 = l_IO_FS_Stream_putStrLn(x_6, x_22, x_10);
if (lean_obj_tag(x_23) == 0)
{
uint8_t x_24; 
x_24 = !lean_is_exclusive(x_23);
if (x_24 == 0)
{
lean_object* x_25; lean_object* x_26; 
x_25 = lean_ctor_get(x_23, 0);
lean_dec(x_25);
x_26 = l_main___boxed__const__1;
lean_ctor_set(x_23, 0, x_26);
return x_23;
}
else
{
lean_object* x_27; lean_object* x_28; lean_object* x_29; 
x_27 = lean_ctor_get(x_23, 1);
lean_inc(x_27);
lean_dec(x_23);
x_28 = l_main___boxed__const__1;
x_29 = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(x_29, 0, x_28);
lean_ctor_set(x_29, 1, x_27);
return x_29;
}
}
else
{
uint8_t x_30; 
x_30 = !lean_is_exclusive(x_23);
if (x_30 == 0)
{
return x_23;
}
else
{
lean_object* x_31; lean_object* x_32; lean_object* x_33; 
x_31 = lean_ctor_get(x_23, 0);
x_32 = lean_ctor_get(x_23, 1);
lean_inc(x_32);
lean_inc(x_31);
lean_dec(x_23);
x_33 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_33, 0, x_31);
lean_ctor_set(x_33, 1, x_32);
return x_33;
}
}
}
}
else
{
uint8_t x_34; 
lean_dec(x_6);
lean_dec(x_3);
x_34 = !lean_is_exclusive(x_9);
if (x_34 == 0)
{
return x_9;
}
else
{
lean_object* x_35; lean_object* x_36; lean_object* x_37; 
x_35 = lean_ctor_get(x_9, 0);
x_36 = lean_ctor_get(x_9, 1);
lean_inc(x_36);
lean_inc(x_35);
lean_dec(x_9);
x_37 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_37, 0, x_35);
lean_ctor_set(x_37, 1, x_36);
return x_37;
}
}
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Games_exLib_Nat(uint8_t builtin, lean_object*);
lean_object* initialize_Games_exLib_List(uint8_t builtin, lean_object*);
lean_object* initialize_Games_exLib_General(uint8_t builtin, lean_object*);
lean_object* initialize_Games_exLib_Versioning(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_CoherentEnd(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_ConwayInduction(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_HistoryAPI(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_HistoryMoves(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_Pairing(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_Playability(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_Positional(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_StateAPI(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_Stealing(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_StrategyAPI(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_Termination(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_TurnAPI(uint8_t builtin, lean_object*);
lean_object* initialize_Games_gameLib_Zermelo(uint8_t builtin, lean_object*);
lean_object* initialize_Games_games_Chomp(uint8_t builtin, lean_object*);
lean_object* initialize_Games_games_PickUpBricks(uint8_t builtin, lean_object*);
lean_object* initialize_Games_games_TicTacToe(uint8_t builtin, lean_object*);
lean_object* initialize_Games_games_TTT__CombinatorialLines(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Games(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_exLib_Nat(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_exLib_List(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_exLib_General(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_exLib_Versioning(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_CoherentEnd(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_ConwayInduction(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_HistoryAPI(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_HistoryMoves(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_Pairing(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_Playability(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_Positional(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_StateAPI(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_Stealing(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_StrategyAPI(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_Termination(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_TurnAPI(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_gameLib_Zermelo(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_games_Chomp(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_games_PickUpBricks(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_games_TicTacToe(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Games_games_TTT__CombinatorialLines(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_WelcomeAndRules___closed__1 = _init_l_WelcomeAndRules___closed__1();
lean_mark_persistent(l_WelcomeAndRules___closed__1);
l_WelcomeAndRules = _init_l_WelcomeAndRules();
lean_mark_persistent(l_WelcomeAndRules);
l_mainLoop___closed__1 = _init_l_mainLoop___closed__1();
lean_mark_persistent(l_mainLoop___closed__1);
l_mainLoop___closed__2 = _init_l_mainLoop___closed__2();
lean_mark_persistent(l_mainLoop___closed__2);
l_mainLoop___closed__3 = _init_l_mainLoop___closed__3();
lean_mark_persistent(l_mainLoop___closed__3);
l_mainLoop___closed__4 = _init_l_mainLoop___closed__4();
lean_mark_persistent(l_mainLoop___closed__4);
l_mainLoop___closed__5 = _init_l_mainLoop___closed__5();
lean_mark_persistent(l_mainLoop___closed__5);
l_mainLoop___closed__6 = _init_l_mainLoop___closed__6();
lean_mark_persistent(l_mainLoop___closed__6);
l_mainLoop___closed__7 = _init_l_mainLoop___closed__7();
lean_mark_persistent(l_mainLoop___closed__7);
l_mainLoop___closed__8 = _init_l_mainLoop___closed__8();
lean_mark_persistent(l_mainLoop___closed__8);
l_mainLoop___boxed__const__1 = _init_l_mainLoop___boxed__const__1();
lean_mark_persistent(l_mainLoop___boxed__const__1);
l_main___closed__1 = _init_l_main___closed__1();
lean_mark_persistent(l_main___closed__1);
l_main___closed__2 = _init_l_main___closed__2();
l_main___closed__3 = _init_l_main___closed__3();
lean_mark_persistent(l_main___closed__3);
l_main___closed__4 = _init_l_main___closed__4();
lean_mark_persistent(l_main___closed__4);
l_main___closed__5 = _init_l_main___closed__5();
lean_mark_persistent(l_main___closed__5);
l_main___boxed__const__1 = _init_l_main___boxed__const__1();
lean_mark_persistent(l_main___boxed__const__1);
return lean_io_result_mk_ok(lean_box(0));
}
void lean_initialize();

  #if defined(WIN32) || defined(_WIN32)
  #include <windows.h>
  #endif

  int main(int argc, char ** argv) {
  #if defined(WIN32) || defined(_WIN32)
  SetErrorMode(SEM_FAILCRITICALERRORS);
  #endif
  lean_object* in; lean_object* res;
lean_initialize();
lean_set_panic_messages(false);
res = initialize_Games(1 /* builtin */, lean_io_mk_world());
lean_set_panic_messages(true);
lean_io_mark_end_initialization();
if (lean_io_result_is_ok(res)) {
lean_dec_ref(res);
lean_init_task_manager();
res = _lean_main(lean_io_mk_world());
}
lean_finalize_task_manager();
if (lean_io_result_is_ok(res)) {
  int ret = lean_unbox_uint32(lean_io_result_get_value(res));
  lean_dec_ref(res);
  return ret;
} else {
  lean_io_result_show_error(res);
  lean_dec_ref(res);
  return 1;
}
}
#ifdef __cplusplus
}
#endif
