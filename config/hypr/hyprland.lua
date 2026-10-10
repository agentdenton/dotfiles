local noctalia_ok, noctalia_theme = pcall(function()
    return require("noctalia")
end)

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1.25",
})

-------------------
---- AUTOSTART ----
-------------------

-- Noctalia shell: bar, launcher, notifications, wallpaper, lock screen, idle
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
end)

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout    = "us,ua",
        kb_options   = "grp:win_space_toggle",
        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
            tap_to_click   = true,
        },
    },
    xwayland = {
        force_zero_scaling = true,
    },
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in     = 10,
        gaps_out    = 20,
        border_size = 4,

        col = {
            active_border   = "rgba(cba6f7ff)",
            inactive_border = "rgba(303446ff)",
        },

        layout = "dwindle",
    },

    decoration = {
        rounding = 8,
    },

    dwindle = {
        preserve_split = true,
        force_split = 2,
    },

    misc = {
        disable_hyprland_logo   = true,
        force_default_wallpaper = 0, -- noctalia draws the wallpaper
    },
})

hl.animation({
    leaf    = "workspaces",
    enabled = true,
    speed   = 4,
    bezier  = "default",
    style   = "fade",
})

hl.animation({
    leaf    = "windowsIn",
    enabled = true,
    speed   = 2,
    bezier  = "default",
    style   = "popin 95%",
})

hl.animation({
    leaf    = "windowsOut",
    enabled = true,
    speed   = 2,
    bezier  = "default",
    style   = "popin 95%",
})

hl.animation({
    leaf    = "windowsMove",
    enabled = true,
    speed   = 2,
    bezier  = "default",
    style   = "popin 95%",
})

----------------------
---- WINDOW RULES ----
----------------------

hl.window_rule({
    name = "float-media-and-files",
    match = {
        class = [[^(steam|Steam|com\.system76\.CosmicFiles|mpv|org\.gnome\.Loupe)$]],
    },
    float = true,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mod  = "SUPER"
local term = "wezterm"

-- apps
hl.bind(mod .. " + Return",    hl.dsp.exec_cmd(term))
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd(term .. " start btm"))
hl.bind(mod .. " + S",         hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("noctalia msg settings-toggle"))
hl.bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- session
hl.bind(mod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + X", hl.dsp.exec_cmd("noctalia msg session lock"))

-- window state
hl.bind(mod .. " + F",         hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + Tab",       hl.dsp.focus({ workspace = "previous" }))

-- focus
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))

-- move window
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))

-- workspaces 1-8
for i = 1, 8 do
    hl.bind(mod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- volume / brightness / media via noctalia (gives you the OSD)
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("noctalia msg volume-up"),       { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("noctalia msg volume-down"),     { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("noctalia msg volume-mute"),     { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("noctalia msg mic-mute"),        { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("noctalia msg brightness-up"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("noctalia msg brightness-down"), { locked = true, repeating = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("noctalia msg media playPause"), { locked = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("noctalia msg media next"),      { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("noctalia msg media previous"),  { locked = true })

-- screenshots
hl.bind("Print",         hl.dsp.exec_cmd("noctalia msg screenshot-region"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"))

-- move/resize with mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

if noctalia_ok then
    noctalia_theme.apply_theme()
end
