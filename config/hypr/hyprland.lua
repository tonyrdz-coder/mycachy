-- mycachy — hyprland.lua
-- Catppuccin Mocha

----------------
-- MONITORS
----------------
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

----------------
-- ENV VARS
----------------
hl.env("XCURSOR_SIZE",              "24")
hl.env("QT_QPA_PLATFORMTHEME",      "qt6ct")
hl.env("LIBVA_DRIVER_NAME",         "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

----------------
-- AUTOSTART
----------------
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")
    hl.exec_cmd("hyprpolkitagent")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
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
hl.bind(mod .. " + Return",         hl.dsp.exec_cmd("foot"))
hl.bind(mod .. " + SHIFT + Return", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + SHIFT + F",      hl.dsp.exec_cmd("foot -e yazi"))
hl.bind(mod .. " + SHIFT + N",      hl.dsp.exec_cmd("foot -e nvim"))
hl.bind(mod .. " + SHIFT + T",      hl.dsp.exec_cmd("rfkill unblock bluetooth && foot --app-id floating -e bluetui"))
hl.bind(mod .. " + SHIFT + W",      hl.dsp.exec_cmd("rfkill unblock wifi && foot --app-id floating -e sudo impala"))

-- Launcher / utils
hl.bind(mod .. " + Space",          hl.dsp.exec_cmd("walker"))
hl.bind(mod .. " + V",              hl.dsp.exec_cmd("cliphist list | walker --dmenu | cliphist decode | wl-copy"))
hl.bind(mod .. " + SHIFT + S",      hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("Print",                    hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mod .. " + Escape",         hl.dsp.exec_cmd("walker -m power"))
hl.bind(mod .. " + K",              hl.dsp.exec_cmd("mycachy-keybindings"))

-- Window management
hl.bind(mod .. " + Q",              hl.dsp.window.close())
hl.bind(mod .. " + F",              hl.dsp.window.fullscreen())
hl.bind(mod .. " + SHIFT + Space",  hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + P",              hl.dsp.window.pseudo())
hl.bind(mod .. " + ALT + J",        hl.dsp.layout("togglesplit"))

-- Focus
hl.bind(mod .. " + H",     hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L",     hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + J",     hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(mod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + J",     hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Resize windows
hl.bind(mod .. " + ALT + H", hl.dsp.window.resize_by({ x = -50, y = 0  }), { repeating = true })
hl.bind(mod .. " + ALT + L", hl.dsp.window.resize_by({ x =  50, y = 0  }), { repeating = true })
hl.bind(mod .. " + ALT + J", hl.dsp.window.resize_by({ x =   0, y = 50 }), { repeating = true })

-- Workspaces
for i = 1, 5 do
    hl.bind(mod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces with mouse
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize with mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),        { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),       { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),     { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

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
