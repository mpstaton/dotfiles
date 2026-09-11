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

# Prompt: regenerate starship's nushell init on each launch.
#
# config.nu must `use` this with a LITERAL path -- `use $some_const` parses but
# silently skips the module's export-env block, so the prompt never binds.
# That rules out the const-guard used for cargo above, so instead the file is
# always written (empty when starship is missing) and the path is one we pick
# ourselves: $nu.cache-dir differs per OS (~/Library/Caches on macOS,
# ~/.cache on Linux) and could not be spelled literally.
mkdir ~/.cache/starship
if (which starship | is-not-empty) {
    starship init nu | save -f ~/.cache/starship/init.nu
} else if not ("~/.cache/starship/init.nu" | path exists) {
    "" | save -f ~/.cache/starship/init.nu
}
