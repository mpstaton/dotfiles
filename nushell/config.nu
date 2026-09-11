# Cargo's environment is loaded from env.nu, which nushell parses before this
# file -- sourcing it again here is redundant.

# Prompt: starship, matching zsh and fish. env.nu writes this file on startup.
# The path must be a literal here; see the note in env.nu.
use ~/.cache/starship/init.nu
