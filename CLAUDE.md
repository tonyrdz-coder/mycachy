# mycachy

Tony's custom minimal Hyprland desktop for CachyOS. Built to be independent of Omarchy — installable on any fresh CachyOS system with one command.

## What this is

A self-contained dotfiles repo. `install.sh` installs all packages, enables services, symlinks all configs, and applies the default Catppuccin Mocha theme. After a reboot you have a fully working Hyprland desktop.

## Design goals

- Keyboard-driven, menu-based (Walker launcher)
- Catppuccin Mocha colorscheme throughout
- Mirrors Omarchy keybind layout so Tony doesn't have to relearn
- No Omarchy dependencies — runs standalone
- Minimal apps, no bloat

## Stack

Hyprland (Lua config), Waybar, Walker + Elephant (launcher/menu system), Alacritty (terminal), Mako (notifications), swaybg (wallpaper), hyprlock, hypridle, hyprpolkitagent, swayosd (volume/brightness OSD), hyprmod (Hyprland settings GUI), PipeWire, wl-clipboard + cliphist, hyprshot, hyprsunset, Fish + Starship, Yazi, Tmux, bluetui (Bluetooth TUI), impala (wifi TUI), gum (terminal dialogs). Uses **iwd** (not NetworkManager) for wifi.

## Repo structure

```
install.sh              — full install script (installs, symlinks, sets catppuccin as default theme)
packages.txt            — pacman packages
packages-aur.txt        — AUR packages (bluetui, impala, elephant-*, hyprmod, yaru-icon-theme)
themes/                 — color themes (colors.toml per theme; catppuccin is default)
wallpapers/             — mycachy-wallpaper.png
config/
  hypr/
    hyprland.lua        — main Hyprland Lua config (monitors, keybinds, rules, theme loader)
    hyprlock.conf       — lock screen
    hypridle.conf       — idle daemon
    hyprpaper.conf      — wallpaper (unused at runtime; swaybg used instead via autostart)
  waybar/               — config.jsonc, style.css (colors injected by mycachy-theme-set)
  alacritty/
    alacritty.toml      — imports theme from ~/.local/share/mycachy/current-theme/alacritty.toml
  walker/
    config.toml         — launcher config (providers, emergencies: Restart Walker)
    themes/             — walker UI themes
  elephant/
    install/
      system/           — System provider (Hyprland Settings, Keybindings, Bluetooth, Wifi)
      triggers/         — Triggers provider (Passwordless Sudo, Toggle Waybar/Idle/DND, Night Mode)
      keybindings/      — Keybindings provider (hidden from providerlist; opened directly by SUPER+K)
  mako/                 — notification daemon config (colors injected by mycachy-theme-set)
  gtk-4.0/
    gtk.css             — libadwaita Catppuccin Mocha color overrides (themes hyprmod + GTK4 apps)
    settings.ini        — dark mode, Yaru-blue icons, JetBrainsMono font
  fish/                 — config.fish, functions/
  tmux/
    tmux.conf           — mouse on, 256-color
  swayosd/              — fallback swayosd style (active style lives in current-theme)
  starship.toml         — shell prompt
bin/
  mycachy-theme-set     — applies a theme to all apps (alacritty, waybar, mako, hyprland, swayosd, walker)
  mycachy-theme-list    — lists available themes
  mycachy-keybindings   — shows live keybinds in Walker dmenu (SUPER+K)
  mycachy-screenshot    — region/window screenshot via hyprshot + satty
  mycachy-screenrecord  — screen recording via wf-recorder
  mycachy-sudo-passwordless — timed passwordless sudo (via systemd-run, gum confirm)
  mycachy-toggle-waybar — toggle waybar on/off
  mycachy-toggle-idle   — toggle hypridle on/off
  mycachy-toggle-notification-silencing — toggle mako DND
  mycachy-restart-walker — kills and restarts elephant + walker
  mycachy-webapp        — launch URL as chromium app window
  waybar-idle-indicator / waybar-notification-indicator / waybar-weather — waybar modules
.gitignore              — excludes hyprland-gui.lua, fish_variables
```

## Walker / Elephant menus

Walker is the launcher. Elephant is the provider daemon that feeds Walker's menus.

| Menu | How to open | Contents |
|---|---|---|
| App launcher | SUPER+Space | Desktop apps |
| Quick menu (providerlist) | SUPER+ALT+Space | System, Triggers, Themes, etc. |
| System | via Quick menu | Hyprland Settings (hyprmod), Keybindings, Bluetooth, Wifi |
| Triggers | via Quick menu | Passwordless Sudo, Toggle Waybar, Toggle Idle, Toggle DND, Night Mode |
| Keybindings | SUPER+K | Live keybind list (hidden from Quick menu) |
| Power menu | SUPER+Escape | Shutdown, reboot, logout, lock |
| Clipboard | SUPER+V | cliphist picker |

## Theme system

Themes live in `themes/<name>/colors.toml`. Run `mycachy-theme-set <name>` to apply.

`mycachy-theme-set` regenerates configs for: Alacritty, Waybar, Mako, Hyprland borders, swayosd, Walker. The active theme name is stored in `~/.local/share/mycachy/current-theme/name`. Default theme applied by `install.sh` is **catppuccin**.

Brightness OSD uses `swayosd-client --device intel_backlight` explicitly (hybrid GPU — `nvidia_0` is the default backlight device but does nothing useful).

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
| SUPER+Return | Alacritty terminal |
| SUPER+SHIFT+Return | Firefox |
| SUPER+Space | Walker launcher |
| SUPER+ALT+Space | Quick menu (providerlist) |
| SUPER+K | Keybindings viewer |
| SUPER+Escape | Power menu |
| SUPER+V | Clipboard picker |
| SUPER+SHIFT+S / Print | Screenshot |
| SUPER+SHIFT+R | Screen record |
| SUPER+SHIFT+F | Yazi file manager |
| SUPER+SHIFT+N | Neovim |
| SUPER+SHIFT+T | bluetui (Bluetooth) |
| SUPER+SHIFT+W | impala (wifi) |
| SUPER+ALT+C | Color picker (hyprpicker) |

## Hardware context

Tony's machine: Acer Predator PHN16S-71, Intel + NVIDIA hybrid GPU, CachyOS. Scale 1.6 for HiDPI. Main daily driver runs Omarchy. mycachy is on a second partition.
