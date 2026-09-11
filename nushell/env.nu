# rustup / cargo environment.
#
# Nushell does not expand $HOME inside a string, so the plain
# `source "$HOME/.cargo/env.nu"` this file used to carry never resolved --
# it looked for a relative path literally named '$HOME/.cargo/env.nu'.
#
# `source` runs at parse time and cannot be wrapped in an `if`, so the
# conditional has to happen in the const that feeds it: fall back to
# /dev/null on a machine where rustup isn't installed yet.
const cargo_env = ($nu.home-dir | path join ".cargo" "env.nu")
const cargo_src = (if ($cargo_env | path exists) { $cargo_env } else { "/dev/null" })
source $cargo_src
