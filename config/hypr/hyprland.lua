-- mycachy — hyprland.lua
-- Catppuccin Mocha

----------------
-- MONITORS
----------------
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1.6,
})

----------------
-- ENV VARS
----------------
hl.env("PATH",                      os.getenv("HOME") .. "/.local/bin:/usr/local/bin:/usr/bin:/bin")
hl.env("XCURSOR_SIZE",              "36")
hl.env("QT_QPA_PLATFORMTHEME",      "qt6ct")
hl.env("LIBVA_DRIVER_NAME",         "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

----------------
-- AUTOSTART
----------------
hl.on("hyprland.start", function()
    hl.exec_cmd("swaybg -i " .. os.getenv("HOME") .. "/.local/share/mycachy/wallpapers/mycachy-wallpaper.png -m fill")
    hl.exec_cmd("swayosd-server --style " .. os.getenv("HOME") .. "/.local/share/mycachy/current-theme/swayosd.css")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("elephant")
    hl.exec_cmd("walker --gapplication-service")
end)

----------------
-- LOOK AND FEEL
----------------
hl.config({
    general = {
        gaps_in          = 4,
        gaps_out         = 8,
        border_size      = 2,
        col = {
            active_border   = { colors = {"rgba(cba6f7ff)", "rgba(89b4faff)"}, angle = 45 },
            inactive_border = "rgba(313244ff)",
        },
        resize_on_border = true,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 8,
        active_opacity   = 1.0,
        inactive_opacity = 0.95,
        dim_inactive     = true,
        dim_strength     = 0.1,
        blur = {
            enabled = true,
            size    = 6,
            passes  = 3,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        font_family              = "JetBrainsMono Nerd Font",
    },

    cursor = {
        no_hardware_cursors = true,
    },
})

hl.curve("ease", { type = "bezier", points = { {0.25, 0.1}, {0.25, 1.0} } })
hl.animation({ leaf = "windows",    enabled = true, speed = 3, bezier = "ease", style = "slide" })
hl.animation({ leaf = "fade",       enabled = true, speed = 3, bezier = "ease" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "ease", style = "slide" })
hl.animation({ leaf = "border",     enabled = true, speed = 5, bezier = "ease" })

----------------
-- INPUT
----------------
hl.config({
    input = {
        kb_layout          = "us",
        repeat_rate        = 40,
        repeat_delay       = 250,
        numlock_by_default = true,
        accel_profile      = "flat",
        touchpad = {
            clickfinger_behavior = true,
            scroll_factor        = 0.4,
            natural_scroll       = false,
        },
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

----------------
-- KEYBINDS
----------------
local mod = "SUPER"

-- Applications
hl.bind(mod .. " + Return",         hl.dsp.exec_cmd("alacritty"),                                                         { description = "Terminal" })
hl.bind(mod .. " + SHIFT + Return", hl.dsp.exec_cmd("firefox"),                                                           { description = "Browser" })
hl.bind(mod .. " + SHIFT + F",      hl.dsp.exec_cmd("alacritty -e /usr/bin/yazi"),                                        { description = "File manager" })
hl.bind(mod .. " + SHIFT + N",      hl.dsp.exec_cmd("alacritty -e /usr/bin/nvim"),                                        { description = "Text editor" })
hl.bind(mod .. " + SHIFT + T",      hl.dsp.exec_cmd("rfkill unblock bluetooth && alacritty --class floating -e bluetui"), { description = "Bluetooth manager" })
hl.bind(mod .. " + SHIFT + W",      hl.dsp.exec_cmd("rfkill unblock wifi && alacritty --class floating -e sudo impala"),  { description = "Wifi manager" })

-- Launcher / utils
hl.bind(mod .. " + Space",          hl.dsp.exec_cmd("walker"),                                                            { description = "Launch apps" })
hl.bind(mod .. " + ALT + Space",    hl.dsp.exec_cmd("walker -m providerlist"),                                            { description = "Quick menu" })
hl.bind(mod .. " + K",              hl.dsp.exec_cmd("mycachy-keybindings"),                                               { description = "Keybindings" })
hl.bind(mod .. " + V",              hl.dsp.exec_cmd("cliphist list | walker --dmenu | cliphist decode | wl-copy"),        { description = "Clipboard" })
hl.bind(mod .. " + SHIFT + S",      hl.dsp.exec_cmd("mycachy-screenshot"),                                                { description = "Screenshot" })
hl.bind(mod .. " + SHIFT + R",      hl.dsp.exec_cmd("mycachy-screenrecord"),                                              { description = "Screen record" })
hl.bind("Print",                    hl.dsp.exec_cmd("mycachy-screenshot"),                                                { description = "Screenshot" })
hl.bind(mod .. " + ALT + C",        hl.dsp.exec_cmd("hyprpicker -a"),                                                    { description = "Color picker" })
hl.bind(mod .. " + Escape",         hl.dsp.exec_cmd("walker -m menus:power"),                                              { description = "Power menu" })

-- Window management
hl.bind(mod .. " + Q",              hl.dsp.window.close(),                    { description = "Close window" })
hl.bind(mod .. " + W",              hl.dsp.window.close(),                    { description = "Close window" })
hl.bind(mod .. " + F",              hl.dsp.window.fullscreen(),               { description = "Full screen" })
hl.bind(mod .. " + SHIFT + Space",  hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(mod .. " + P",              hl.dsp.window.pseudo(),                   { description = "Pseudo tiling" })
hl.bind(mod .. " + CTRL + J",       hl.dsp.layout("togglesplit"),             { description = "Toggle split" })

-- Focus (HJKL + arrows)
hl.bind(mod .. " + H",     hl.dsp.focus({ direction = "left" }),  { description = "Focus left" })
hl.bind(mod .. " + J",     hl.dsp.focus({ direction = "down" }),  { description = "Focus down" })
hl.bind(mod .. " + L",     hl.dsp.focus({ direction = "right" }), { description = "Focus right" })
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }),  { description = "Focus left" })
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Focus right" })
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }),    { description = "Focus up" })
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }),  { description = "Focus down" })

-- Move windows
hl.bind(mod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "left" }),  { description = "Move window left" })
hl.bind(mod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "right" }), { description = "Move window right" })
hl.bind(mod .. " + SHIFT + J",     hl.dsp.window.move({ direction = "down" }),  { description = "Move window down" })
hl.bind(mod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }),  { description = "Move window left" })
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }), { description = "Move window right" })
hl.bind(mod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }),    { description = "Move window up" })
hl.bind(mod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }),  { description = "Move window down" })

-- Resize windows
hl.bind(mod .. " + ALT + H", hl.dsp.window.resize({ x = -50, y =   0 }), { repeating = true, description = "Resize left" })
hl.bind(mod .. " + ALT + L", hl.dsp.window.resize({ x =  50, y =   0 }), { repeating = true, description = "Resize right" })
hl.bind(mod .. " + ALT + K", hl.dsp.window.resize({ x =   0, y = -50 }), { repeating = true, description = "Resize up" })
hl.bind(mod .. " + ALT + J", hl.dsp.window.resize({ x =   0, y =  50 }), { repeating = true, description = "Resize down" })

-- Workspaces
for i = 1, 5 do
    hl.bind(mod .. " + " .. i,         hl.dsp.focus({ workspace = i }),       { description = "Switch to workspace " .. i })
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }), { description = "Move to workspace " .. i })
end

-- Scroll through workspaces with mouse
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize with mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume (with swayosd display)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"),       { locked = true, repeating = true, description = "Volume up" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"),       { locked = true, repeating = true, description = "Volume down" })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true, description = "Mute" })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),  { locked = true, description = "Mic mute" })

-- Brightness (with swayosd display)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("swayosd-client --device intel_backlight --brightness raise"), { locked = true, repeating = true, description = "Brightness up" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --device intel_backlight --brightness lower"), { locked = true, repeating = true, description = "Brightness down" })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play/pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true, description = "Next track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true, description = "Previous track" })

----------------
-- WORKSPACES
----------------
for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), persistent = true })
end

----------------
-- WINDOW RULES
----------------
hl.window_rule({
    name           = "suppress-maximize",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name   = "float-floating",
    match  = { class = "(floating)" },
    float  = true,
    size   = "900 600",
    center = true,
})

-- Webapps launched via mycachy-webapp (chromium --app=URL) open as tiled windows
-- Add keybinds for your own webapps:
-- hl.bind(mod .. " + SHIFT + A", hl.dsp.exec_cmd("mycachy-webapp https://chatgpt.com"))
-- hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd("mycachy-webapp https://gmail.com"))
-- hl.bind(mod .. " + SHIFT + Y", hl.dsp.exec_cmd("mycachy-webapp https://youtube.com"))

----------------
-- THEME
----------------
local theme_file = os.getenv("HOME") .. "/.local/share/mycachy/current-theme/hyprland.lua"
local tf = io.open(theme_file, "r")
if tf then tf:close(); dofile(theme_file) end
