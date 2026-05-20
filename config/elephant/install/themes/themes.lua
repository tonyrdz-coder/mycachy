Name = "themes"
NamePretty = "Themes"
Icon = "preferences-desktop-theme"
Cache = false
HideFromProviderlist = false

function GetEntries()
  local entries = {}
  local themes_dir = os.getenv("HOME") .. "/.local/share/mycachy/themes"

  local current_theme = ""
  local f = io.open(os.getenv("HOME") .. "/.local/share/mycachy/current-theme/name", "r")
  if f then
    current_theme = (f:read("*l") or ""):gsub("%s+$", "")
    f:close()
  end

  local handle = io.popen("ls " .. themes_dir .. " 2>/dev/null")
  if not handle then return entries end

  for name in handle:lines() do
    local label = name:gsub("-", " "):gsub("(%a)([%w_']*)", function(a, b)
      return a:upper() .. b
    end)
    local marker = name == current_theme and "  ✓" or ""
    table.insert(entries, {
      Text    = label .. marker,
      Actions = { activate = os.getenv("HOME") .. "/.local/bin/mycachy-theme-set " .. name },
    })
  end
  handle:close()

  return entries
end
