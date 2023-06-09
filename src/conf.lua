local love = require "love"

function love.conf(t)
  t.modules.joystick = false -- when not supporting joystick use
  t.title = "My GUI"
  t.version = "11.4"         -- version of Love2D
  t.window.resizable = true  -- defaults to false
end
