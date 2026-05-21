# mycachy Changes Checklist

Track every feature/fix added so far. Check off each item after verifying it works.

---

## 1. Elephant Menus

- [ ] **Power menu** — `SUPER+Escape` opens Walker with shutdown/reboot/lock/logout options
- [ ] **System menu** — opens Walker with system tools
- [ ] **Keybindings viewer** — `SUPER+K` shows live keybinds in Walker dmenu
- [ ] Elephant scripts use full paths (no PATH dependency issues)

---

## 2. Screenshot

- [ ] `SUPER+SHIFT+S` triggers region screenshot (slurp → grim)
- [ ] `Print` key also triggers screenshot
- [ ] Screenshot saves to `~/Pictures/Screenshots/`
- [ ] Screenshot is copied to clipboard automatically
- [ ] Notification appears after capture with "annotate" action
- [ ] Annotate action opens satty

---

## 3. Screen Record

- [ ] `SUPER+SHIFT+R` starts screen recording (select region with slurp)
- [ ] Notification confirms recording started
- [ ] `SUPER+SHIFT+R` again stops recording
- [ ] Notification confirms recording stopped
- [ ] Video saved to `~/Videos/`
- [ ] Waybar updates on start/stop (RTMIN+8 signal)

---

## 4. Theme System

- [ ] `mycachy-theme-list` lists all available themes
- [ ] `mycachy-theme-set <name>` applies a theme without error
- [ ] Theme updates **Foot** terminal colors
- [ ] Theme updates **Waybar** colors
- [ ] Theme updates **Mako** notification colors
- [ ] Theme updates **Walker** menu colors
- [ ] Theme updates **swayosd** colors
- [ ] Theme updates **Hyprland** border/active colors (via `~/.local/share/mycachy/current-theme/hyprland.lua`)
- [ ] `catppuccin` (default) theme applies correctly on first install
- [ ] At least one other theme (e.g. `gruvbox`) switches cleanly

---

## 5. swayosd

- [ ] `swayosd-server` starts on Hyprland launch (exec-once)
- [ ] Volume up/down keys show OSD overlay
- [ ] Mute toggle shows OSD overlay
- [ ] Brightness up/down keys show OSD overlay
- [ ] OSD styled with Catppuccin Mocha colors (not default grey)

---

## 6. Color Picker

- [ ] `SUPER+ALT+C` opens hyprpicker
- [ ] Picked color is copied to clipboard

---

## 7. Webapps (`mycachy-webapp`)

- [ ] `mycachy-webapp <URL>` launches Chromium in app mode
- [ ] Window opens as a tiled Hyprland window (not floating)

---

## 8. HJKL + Arrow Focus

- [ ] `SUPER+H` focuses left
- [ ] `SUPER+J` focuses down
- [ ] `SUPER+K` focuses up  *(confirm no conflict with keybindings viewer)*
- [ ] `SUPER+L` focuses right
- [ ] Arrow keys still work for focus too

---

## 9. Wallpaper

- [ ] `mycachy-wallpaper.png` bundled in repo under `wallpapers/`
- [ ] `install.sh` copies wallpaper to correct location
- [ ] hyprpaper loads it on startup (no blank/black desktop)

---

## 10. Alacritty Terminal

- [ ] `SUPER+Return` opens Alacritty
- [ ] `SUPER+SHIFT+F` opens Yazi in Alacritty
- [ ] `SUPER+SHIFT+N` opens Neovim in Alacritty
- [ ] Catppuccin Mocha colors applied via `~/.local/share/mycachy/current-theme/alacritty.toml`
- [ ] `mycachy-theme-set` regenerates alacritty theme correctly

---

## 11. Monitor Scale

- [ ] Monitor scale is `1.6` (not 1.5)
- [ ] UI elements render at correct size

---

## 12. `~/.local/bin` in PATH

- [ ] Hyprland session has `~/.local/bin` in PATH
- [ ] Custom scripts in `~/mycachy/bin/` (symlinked to `~/.local/bin`) are callable without full path

---

## 13. Neovim

- [ ] `neovim` in `packages.txt`
- [ ] `nvim` is installed after running `install.sh`
- [ ] Keybind `SUPER+SHIFT+N` launches nvim correctly

---

## 14. Uncommitted Changes (to review before commit)

- [ ] `config/mako/config` — review changes, confirm correct, commit
- [ ] `config/walker/themes/mycachy-default/style.css` — review changes, confirm correct, commit
- [ ] `config/fish/fish_variables` — decide: add to `.gitignore` or commit

---

## 15. Git / Repo

- [ ] All 14 commits pushed to `origin/main`
- [ ] README up to date with new features
