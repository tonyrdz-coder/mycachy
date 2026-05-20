Name = "power"
NamePretty = "Power"
Icon = "system-shutdown"
Cache = false
HideFromProviderlist = false

function GetEntries()
  return {
    { Text = "Shutdown",  Icon = "system-shutdown",    Actions = { activate = "systemctl poweroff" } },
    { Text = "Reboot",    Icon = "system-reboot",      Actions = { activate = "systemctl reboot" } },
    { Text = "Suspend",   Icon = "system-suspend",     Actions = { activate = "systemctl suspend" } },
    { Text = "Lock",      Icon = "system-lock-screen", Actions = { activate = "hyprlock" } },
    { Text = "Log Out",   Icon = "system-log-out",     Actions = { activate = "hyprctl dispatch exit" } },
  }
end
