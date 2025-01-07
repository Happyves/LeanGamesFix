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
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
