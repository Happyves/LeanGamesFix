import Lake
open Lake DSL

package «games» {
  -- add any package configuration options here
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.5.0-rc1"

@[default_target]
lean_lib «Games» {
  -- add any library configuration options here
}
