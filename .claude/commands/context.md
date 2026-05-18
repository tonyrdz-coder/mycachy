Gather full context about this mycachy installation by running the following commands and analyzing the results. Present a clear summary of what's installed, what's running, what's missing, and any obvious issues.

## System Info
Run: `inxi -Fxz 2>/dev/null || fastfetch 2>/dev/null || uname -a`

## OS & Kernel
Run: `cat /etc/os-release && uname -r`

## Hyprland
Run: `hyprctl version 2>/dev/null && hyprctl monitors 2>/dev/null`

## Installed Packages (check against packages.txt and packages-aur.txt)
Run: `pacman -Q hyprland waybar walker foot mako hyprpaper hyprlock hypridle hyprshot hyprsunset pipewire wireplumber wl-clipboard cliphist fish starship yazi brightnessctl playerctl bluez iwd 2>/dev/null`
Run: `pacman -Q bluetui impala 2>/dev/null`

## Missing Packages
Run: `while read pkg; do pacman -Q "$pkg" &>/dev/null || echo "MISSING: $pkg"; done < packages.txt`
Run: `while read pkg; do pacman -Q "$pkg" &>/dev/null || echo "MISSING (AUR): $pkg"; done < packages-aur.txt`

## Services
Run: `systemctl is-active bluetooth iwd && systemctl --user is-active pipewire wireplumber`

## Config Files
Run: `ls config/hypr/ config/waybar/ config/foot/ config/mako/ config/walker/`

## Symlinks (check if install.sh has been run)
Run: `ls -la ~/.config/hypr ~/.config/waybar ~/.config/foot ~/.config/mako ~/.config/walker 2>/dev/null`

## Repo Status
Run: `git log --oneline -5 && git status`

## Hyprland Log (last 30 lines of errors)
Run: `cat ~/.local/share/hyprland/hyprland.log 2>/dev/null | grep -i "err\|warn\|fail" | tail -30`

## GPU
Run: `lspci | grep -i vga && nvidia-smi --query-gpu=name,driver_version --format=csv,noheader 2>/dev/null`

---

After running all commands, tell me:
1. What is installed and working
2. What is missing or broken
3. What still needs to be configured
4. Any errors or warnings to address
