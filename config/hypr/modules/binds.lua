---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "wofi --show=drun"
local cliphist    = ""

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local mainMod_shift = mainMod .. " + SHIFT"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Screenshots with hyprshot
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output -z"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window -z"))
hl.bind(mainMod_shift .. " + Print", hl.dsp.exec_cmd("hyprshot -m region -z"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    end

    -- Example special workspace (scratchpad)
    hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

    -- Scroll through existing workspaces with mainMod + scroll
    hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + SHIFT + TAB",   hl.dsp.focus({ workspace = "e-1" }))

    -- Move/resize windows with mainMod + LMB/RMB and dragging
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Laptop multimedia keys for volume and LCD brightness
    hl.bind("F12", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { repeating = true })
    hl.bind("F11", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), { repeating = true })
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))
    hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
    hl.bind("F5", hl.dsp.exec_cmd("swayosd-client --brightness raise"), { repeating = true })
    hl.bind("F4", hl.dsp.exec_cmd("swayosd-client --brightness lower"), { repeating = true })

    -- Requires playerctl
    hl.bind("F10",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("F8",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

    -- hyprlock
    hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"), { locked = true })

    -- wlogout
    hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("wlogout"))

    --cliphist
    hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("~/.config/wofi/cliphist.sh"))    

    --microphone
    hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.exec_cmd("swayosd-client --input-volume raise"))
    hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.exec_cmd("swayosd-client --input-volume lower"))
    hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"))
