# Load cargo's environment when rustup is installed. Guarded so a fresh
# machine without rustup starts fish without a sourcing error on every shell.
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end
