Name = "system"
NamePretty = "System"
Icon = "preferences-system"
Cache = false
HideFromProviderlist = false

function GetEntries()
  return {
    { Text = "Hyprland Settings",  Icon = "preferences-system", Actions = { activate = "hyprmod" } },
    { Text = "Keybindings",        Icon = "input-keyboard",     Actions = { activate = os.getenv("HOME") .. "/.local/bin/mycachy-keybindings" } },
    { Text = "Bluetooth Manager",  Icon = "bluetooth",          Actions = { activate = "rfkill unblock bluetooth && alacritty --class floating -e bluetui" } },
    { Text = "Wifi Manager",       Icon = "network-wireless",   Actions = { activate = "rfkill unblock wifi && alacritty --class floating -e sudo impala" } },
  }
end
