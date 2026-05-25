---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ir",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:win_space_toggle",
        kb_rules   = "",

        -- infamous xset r rate 200 35;
        repeat_rate = 35,
        repeat_delay = 200,

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})