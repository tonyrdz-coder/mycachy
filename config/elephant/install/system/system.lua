Name = "system"
NamePretty = "System"
Icon = "preferences-system"
Cache = false
HideFromProviderlist = false

function GetEntries()
  return {
    { Text = "Toggle Idle Lock",       Icon = "security-high",      Actions = { activate = "mycachy-toggle-idle" } },
    { Text = "Toggle Do Not Disturb",  Icon = "notification",       Actions = { activate = "mycachy-toggle-notification-silencing" } },
    { Text = "Night Mode On",          Icon = "night-light",        Actions = { activate = "hyprsunset -t 3500" } },
    { Text = "Night Mode Off",         Icon = "display-brightness", Actions = { activate = "pkill hyprsunset" } },
    { Text = "Bluetooth Manager",      Icon = "bluetooth",          Actions = { activate = "foot --app-id floating -e bluetui" } },
    { Text = "Wifi Manager",           Icon = "network-wireless",   Actions = { activate = "foot --app-id floating -e sudo impala" } },
  }
end
