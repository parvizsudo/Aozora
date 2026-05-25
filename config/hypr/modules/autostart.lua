-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("nm-applet & blueman-applet")
  hl.exec_cmd("waybar & swaync")
  hl.exec_cmd("swayosd-server &")
  hl.exec_cmd("hypridle")
end)
