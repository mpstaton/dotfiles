# oh-my-posh

## Which file is actually live

**Active theme: `themes/my-tokyo.omp.json`**

It is selected explicitly in `zsh/zshrc`:

```sh
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/themes/my-tokyo.omp.json)"
```

`config.json` in this directory is the **legacy** March-2025 powerline/diamond
design (the one with the cream `` mps `` capsules). Nothing loads it — the init
line above always passes `--config` explicitly. It is kept only for reference.
**Do not port `config.json` to a new machine.** If a prompt on another machine
looks like beige powerline segments rather than the box-drawing tree below, that
file is the reason.

## What the active theme renders

Five newline-separated blocks drawn as a box-drawing tree, no backgrounds —
foreground colors only, over a transparent terminal:

```
┏[ :  hostname :  username][ 20260820@15:53:25]
┣[ project][ main ≡  ~1]                    ┣[ 0.149s][ RAM: 35/48GB][ 75%]
┣[ ~/code/path/to/cwd]
└─>
```

| Block | Leading glyph | Segments | Color |
|---|---|---|---|
| 1 | `┏` `U+250F` | session, time (`20060102@15:04:05`) | `#7eb8da` |
| 2 | `┣` `U+2523` | az, azd, aws, gcp, kubectl, project, git | `#7eb8da` / `#ffa5d8` |
| 3 | `┣` `U+2523` | path (style `full`, path text `#98bfad`) | `#7eb8da` |
| 4 | `┣` `U+2523` | executiontime (`dallas`, threshold 0), sysinfo RAM, battery | `#be9ddf` / `#f36943` |
| 5 | `└─` `U+2514 U+2500` | root, status, `>` | — |

Block 4 is `"alignment": "right"`, which is why the timing/RAM/battery cluster
sits on the right edge in the screenshot.

Palette: `#7eb8da` structure blue · `#ffa5d8` pink (git, project, kubectl) ·
`#98bfad` sage (path) · `#be9ddf` lavender (perf) · `#ffffff` icons ·
`#ffff00` yellow (cloud values, root marker).

## Porting to Linux / NixOS

Three things in this theme are macOS-specific and will render as tofu (□) or
misbehave on the NixOS box:

1. **Font.** `ghostty/config` sets `font-family = "Menlo"`, which does not exist
   on Linux — and *none of these glyphs are in Menlo anyway*. It works on this
   Mac only because Meslo and Hack Nerd Fonts are installed in `~/Library/Fonts`
   and Ghostty silently falls back to them for every icon. That fallback is not
   reproducible: on NixOS, install a Nerd Font and **name it explicitly** rather
   than relying on fallback, e.g. add `pkgs.nerd-fonts.meslo-lg` to
   `fonts.packages` and set `font-family = "MesloLGS Nerd Font"`. Without a Nerd
   Font present the prompt renders as boxes.

2. **Apple logo.** The session segment hardcodes `` (), an Apple-only
   codepoint. Swap it for the NixOS snowflake `` in the Nerd Font linux set.

3. **Battery.** The battery segment errors on a desktop with no battery. Either
   drop that segment on the Linux copy or accept the `{{ .Error }}` branch.

`theme = carbonfox` in `ghostty/config` is a built-in Ghostty theme and is
portable as-is.
