-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

-- Tokyo Night color palette
local bg     = "0xff1a1b26"
local bg_alt = "0xff222330"
local fg     = "0xffc0caf5"
local blue   = "0xff7aa2f7"
local purple = "0xffbb9af7"
local cyan   = "0xff7dcfff"
local red    = "0xfff7768e"
local green  = "0xff9ece6a"
local yellow = "0xffe0af68"
local gray   = "0xff565f89"

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = blue,
            inactive_border = gray,
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,
    },

    decoration = {
        rounding       = 8,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.9,
        inactive_opacity = 0.8,

        shadow = {
            enabled = true,
            range = 20,
            offset = {0, 2},
            render_power = 10,
            color = "rgba(00000020)"

        },

         blur = {
            enabled = true,
            xray = true,
            special = false,
            new_optimizations = true,
            size = 3,
            passes = 2,
            brightness = 0.9,
            contrast = 0.89,
            vibrancy = 0.1696,
            vibrancy_darkness = 0.5,
            popups = false,
            popups_ignorealpha = 0.6,
            input_methods = true,
            input_methods_ignorealpha = 0.8
        },
        -- Dim
        dim_inactive = true,
        dim_strength = 0.05,
        dim_special = 0.2
    },

    animations = {
        enabled = true
    },
    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = false
        -- precise_mouse_move = true,
    },
})
-- Curves
hl.curve("expressiveFastSpatial", {
    type = "bezier",
    points = {{0.42, 1.67}, {0.21, 0.90}}
})
hl.curve("expressiveSlowSpatial", {
    type = "bezier",
    points = {{0.39, 1.29}, {0.35, 0.98}}
})
hl.curve("expressiveDefaultSpatial", {
    type = "bezier",
    points = {{0.38, 1.21}, {0.22, 1.00}}
})
hl.curve("emphasizedDecel", {
    type = "bezier",
    points = {{0.05, 0.7}, {0.1, 1}}
})
hl.curve("emphasizedAccel", {
    type = "bezier",
    points = {{0.3, 0}, {0.8, 0.15}}
})
hl.curve("standardDecel", {
    type = "bezier",
    points = {{0, 0}, {0, 1}}
})
hl.curve("menu_decel", {
    type = "bezier",
    points = {{0.1, 1}, {0, 1}}
})
hl.curve("menu_accel", {
    type = "bezier",
    points = {{0.52, 0.03}, {0.72, 0.08}}
})
hl.curve("stall", {
    type = "bezier",
    points = {{1, -0.1}, {0.7, 0.85}}
})
-- Configs
-- windows
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3,
    bezier = "emphasizedDecel",
    style = "popin 80%"
})
hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 3,
    bezier = "emphasizedDecel"
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 2,
    bezier = "emphasizedDecel",
    style = "popin 90%"
})
hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 2,
    bezier = "emphasizedDecel"
})
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 3,
    bezier = "emphasizedDecel",
    style = "slide"
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "emphasizedDecel"
})

-- layers
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 2.7,
    bezier = "emphasizedDecel",
    style = "popin 93%"
})
hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 2.4,
    bezier = "menu_accel",
    style = "popin 94%"
})
-- fade
hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 0.5,
    bezier = "menu_decel"
})
hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 2.7,
    bezier = "stall"
})
-- workspaces
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 7,
    bezier = "menu_decel",
    style = "slide"
})
-- specialWorkspace
hl.animation({
    leaf = "specialWorkspaceIn",
    enabled = true,
    speed = 2.8,
    bezier = "emphasizedDecel",
    style = "slidevert"
})
hl.animation({
    leaf = "specialWorkspaceOut",
    enabled = true,
    speed = 1.2,
    bezier = "emphasizedAccel",
    style = "slidevert"
})
-- zoom
hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 3,
    bezier = "standardDecel"
})

hl.config({
    input = {
        kb_layout = "us",
        numlock_by_default = true,
        repeat_delay = 250,
        repeat_rate = 35,

        follow_mouse = 1,
        off_window_axis_events = 2,

        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            clickfinger_behavior = true,
            scroll_factor = 0.7
        }
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        vrr = 0,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
        enable_swallow = false,
        swallow_regex = "(foot|kitty|allacritty|Alacritty)",
        on_focus_under_fullscreen = 2,
        allow_session_lock_restore = true,
        session_lock_xray = true,
        initial_workspace_tracking = false,
        focus_on_activate = true
    },

    binds = {
        scroll_event_delay = 0,
        hide_special_on_workspace_change = true
    },

    cursor = {
        zoom_factor = 1,
        zoom_rigid = false,
        zoom_disable_aa = true,
        hotspot_padding = 1
    },

    xwayland = {
        force_zero_scaling = true
    }
})