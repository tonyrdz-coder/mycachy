# mycachy

Tony's custom minimal Hyprland desktop for CachyOS. Built to be independent of Omarchy — installable on any fresh CachyOS system with one command.

## What this is

A self-contained dotfiles repo. `install.sh` installs all packages, enables services, and symlinks all configs. After a reboot you have a fully working Hyprland desktop.

## Design goals

- Keyboard-driven, menu-based (Walker launcher)
- Catppuccin Mocha colorscheme throughout
- Mirrors Omarchy keybind layout so Tony doesn't have to relearn
- No Omarchy dependencies — runs standalone
- Minimal apps, no bloat

## Stack

Hyprland, Waybar, Walker, Foot (terminal), Mako (notifications), hyprpaper, hyprlock, hypridle, hyprpolkitagent, PipeWire, wl-clipboard + cliphist, hyprshot, hyprsunset, Fish + Starship, Yazi, bluetui (Bluetooth TUI), impala (wifi TUI). Uses **iwd** (not NetworkManager) for wifi.

## Repo structure

```
install.sh              — full install script
packages.txt            — pacman packages
packages-aur.txt        — AUR packages (bluetui, impala)
config/
  hypr/                 — hyprland.conf, hyprpaper.conf, hyprlock.conf, hypridle.conf
  waybar/               — config.jsonc, style.css
  foot/                 — foot.ini
  mako/                 — config
  walker/               — config.toml
  fish/                 — config.fish, functions/fish_greeting.fish
  starship.toml         — prompt config
bin/
  mycachy-keybindings   — shows live keybinds in Walker dmenu (SUPER+K)
.claude/commands/
  context.md            — /context skill: audits the current install state
```

## Installing on a fresh CachyOS system

Fresh CachyOS uses NetworkManager by default. Disable it first or iwd won't work:

```bash
sudo systemctl disable --now NetworkManager
```

Then install:

```bash
git clone https://github.com/tonyrdz-coder/mycachy.git
cd mycachy
./install.sh
```

Log out and back in — Hyprland will start automatically.

## Testing without installing (nested Hyprland)

Run this from inside any Hyprland session (e.g. Omarchy) to open mycachy as a window:

```bash
PATH="$HOME/mycachy/bin:$PATH" XDG_CONFIG_HOME="$HOME/mycachy/config" Hyprland
```

Exit the nested session with:

```bash
hyprctl dispatch exit
```

Note: keybinds may be captured by the outer session. This is expected — click inside the nested window to focus it.

## Key keybinds

| Keybind | Action |
|---|---|
| SUPER+Return | Foot terminal |
| SUPER+SHIFT+Return | Firefox |
| SUPER+Space | Walker launcher |
| SUPER+K | Keybindings viewer |
| SUPER+Escape | Power menu |
| SUPER+V | Clipboard picker |
| SUPER+SHIFT+S | Screenshot region |
| SUPER+SHIFT+T | bluetui (Bluetooth) |
| SUPER+SHIFT+W | impala (wifi) |

## Current status

All configs complete. Being tested on a fresh CachyOS partition (dual-boot alongside Omarchy on Tony's Acer Predator PHN16S-71).

## Hardware context

Tony's machine: Acer Predator PHN16S-71, Intel + NVIDIA hybrid GPU, CachyOS. Main daily driver runs Omarchy. mycachy is on a second partition.
