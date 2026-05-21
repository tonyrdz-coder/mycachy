Name = "triggers"
NamePretty = "Triggers"
Icon = "system-run"
Cache = false
HideFromProviderlist = false
FixedOrder = true

function GetEntries()
  local home = os.getenv("HOME")
  return {
    { Text = "Passwordless Sudo",      Icon = "dialog-password",    Actions = { activate = "alacritty --class floating -e " .. home .. "/.local/bin/mycachy-sudo-passwordless" } },
    { Text = "Toggle Waybar",          Icon = "preferences-desktop", Actions = { activate = home .. "/.local/bin/mycachy-toggle-waybar" } },
    { Text = "Toggle Idle Lock",       Icon = "security-high",      Actions = { activate = home .. "/.local/bin/mycachy-toggle-idle" } },
    { Text = "Toggle Do Not Disturb",  Icon = "notification",       Actions = { activate = home .. "/.local/bin/mycachy-toggle-notification-silencing" } },
    { Text = "Night Mode On",          Icon = "night-light",        Actions = { activate = "hyprsunset -t 3500" } },
    { Text = "Night Mode Off",         Icon = "display-brightness", Actions = { activate = "pkill hyprsunset" } },
  }
end
