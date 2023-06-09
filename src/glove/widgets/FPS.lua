local colors = require "glove/colors"
local love = require "love"

local g = love.graphics

local mt = {
  __index = {
    draw = function(self, parentX, parentY)
      g.setColor(colors.white)
      g.setFont(self.font)
      local text = "FPS: " .. love.timer.getFPS()
      g.print(text, parentX + self.x, parentY + self.y)
    end,

    getHeight = function(self)
      return self.font:getHeight()
    end,

    getWidth = function(self)
      return self.font:getWidth(self.text)
    end
  },
}

-- This displays the current frames per second.
local function FPS(options)
  local font = options.font or g.getFont()
  local text = "FPS:" .. love.timer.getFPS()
  local instance = {
    font = font,
    kind = "FPS",
    text = text,
  }
  setmetatable(instance, mt)
  return instance
end

return FPS
