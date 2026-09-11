# Prompt: starship, matching zsh and nushell. Config is the shared
# ~/.config/starship.toml.
if status is-interactive
    starship init fish | source
end
