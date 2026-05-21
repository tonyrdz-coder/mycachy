Name = "keybindings"
NamePretty = "Keybindings"
Icon = "input-keyboard"
Cache = false
HideFromProviderlist = true
FixedOrder = true

local MODMASK = {
  [0]  = "",
  [1]  = "SHIFT",
  [4]  = "CTRL",
  [5]  = "SHIFT CTRL",
  [8]  = "ALT",
  [9]  = "SHIFT ALT",
  [12] = "CTRL ALT",
  [64] = "SUPER",
  [65] = "SUPER SHIFT",
  [68] = "SUPER CTRL",
  [72] = "SUPER ALT",
  [73] = "SUPER SHIFT ALT",
  [76] = "SUPER CTRL ALT",
}

local MOUSE = {
  ["272"] = "LEFT CLICK",
  ["273"] = "RIGHT CLICK",
  ["274"] = "MIDDLE CLICK",
}

local function modmask_text(mask)
  return MODMASK[tonumber(mask)] or tostring(mask)
end

local function key_text(key, keycode)
  if key and key ~= "" and not key:match("^code:") then
    return key:upper()
  end
  local code = key and key:match("^code:(%d+)") or keycode
  if code and MOUSE[tostring(code)] then
    return MOUSE[tostring(code)]
  end
  return code and ("code:" .. code) or ""
end

function GetEntries()
  local entries = {}

  local handle = io.popen("hyprctl -j binds 2>/dev/null")
  if not handle then return entries end
  local raw = handle:read("*a")
  handle:close()

  -- Parse JSON array with a simple pattern (avoids needing a JSON lib)
  for block in raw:gmatch("{(.-)}\n?%s*[,?%]]") do
    local modmask  = block:match('"modmask"%s*:%s*(%d+)')
    local key      = block:match('"key"%s*:%s*"([^"]*)"')
    local keycode  = block:match('"keycode"%s*:%s*(-?%d+)')
    local desc     = block:match('"description"%s*:%s*"([^"]*)"')
    local dispatch = block:match('"dispatcher"%s*:%s*"([^"]*)"')
    local arg      = block:match('"arg"%s*:%s*"([^"]*)"')

    if dispatch == "__lua" and (not desc or desc == "") then goto continue end

    local mods = modmask_text(modmask or "0")
    local k    = key_text(key, keycode)
    if k == "0" or k == "" then goto continue end

    local combo = mods ~= "" and (mods .. " + " .. k) or k

    local action = desc ~= "" and desc or arg or dispatch or ""
    -- strip launcher prefixes
    action = action:gsub("uwsm%-app %-%- ", ""):gsub("uwsm app %-%- ", "")

    if action ~= "" then
      table.insert(entries, {
        Text    = string.format("%-30s  →  %s", combo, action),
        Actions = {
          activate = dispatch and arg and dispatch ~= "" and arg ~= ""
            and ("hyprctl dispatch " .. dispatch .. " " .. arg)
            or  "true",
        },
      })
    end

    ::continue::
  end

  return entries
end
