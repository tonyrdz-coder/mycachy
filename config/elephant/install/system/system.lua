Name = "system"
NamePretty = "System"
Icon = "preferences-system"
Cache = false
HideFromProviderlist = false

function GetEntries()
  return {
    { Text = "Hyprland Settings",      Icon = "preferences-system", Actions = { activate = "hyprmod" } },
    { Text = "Keybindings",            Icon = "input-keyboard",     Actions = { activate = os.getenv("HOME") .. "/.local/bin/mycachy-keybindings" } },
    { Text = "Toggle Idle Lock",       Icon = "security-high",      Actions = { activate = os.getenv("HOME") .. "/.local/bin/mycachy-toggle-idle" } },
    { Text = "Toggle Do Not Disturb",  Icon = "notification",       Actions = { activate = os.getenv("HOME") .. "/.local/bin/mycachy-toggle-notification-silencing" } },
    { Text = "Night Mode On",          Icon = "night-light",        Actions = { activate = "hyprsunset -t 3500" } },
    { Text = "Night Mode Off",         Icon = "display-brightness", Actions = { activate = "pkill hyprsunset" } },
    { Text = "Bluetooth Manager",      Icon = "bluetooth",          Actions = { activate = "rfkill unblock bluetooth && alacritty --class floating -e bluetui" } },
    { Text = "Wifi Manager",           Icon = "network-wireless",   Actions = { activate = "rfkill unblock wifi && alacritty --class floating -e sudo impala" } },
  }
end
