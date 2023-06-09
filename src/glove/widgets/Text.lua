local colors = require "glove/colors"
local love = require "love"

local g = love.graphics
local padding = 0

local mt = {
  __index = {
    color = colors.white,
    draw = function(self, parentX, parentY)
      g.setColor(self.color)
      if self.x and self.y then
        g.setFont(self.font)
        parentX = parentX or 0
        parentY = parentY or 0

        local v = ""
        local compute = self.compute
        if compute then
          v = compute()
        else
          local t = self.table
          local key = self.key
          v = t and key and t[key] or self.text
        end

        g.print(v, parentX + self.x + padding, parentY + self.y + padding)

        if self.debug then
          g.setColor(colors.red)
          g.rectangle(
            "line",
            parentX + self.x, parentY + self.y,
            self:getWidth(), self:getHeight()
          )
        end
      end
    end,

    getHeight = function(self)
      return self.font:getHeight() + padding * 2
    end,

    getWidth = function(self)
      if self.width then return self.width end

      local value = ""
      if compute then
        value = compute()
      else
        local t = self.table
        local key = self.key
        value = t and key and t[key] or self.text
      end
      return self.font:getWidth(value) + padding * 2
    end
  }
}

--[[
  This widget displays static or computed text.

  The parameters are:

  - the text to display
  - table of options

  The supported options are:

  - `font`: used for the text
  - `color`: of the text; defaults to white
  - `compute`: optional function called to compute the text to display
  - `width`: used when key and table are specified
--]]
local function Text(text, options)
  local to = type(options)
  assert(to == "table" or to == "nil", "Text options must be a table.")

  if not text then
    error("Text requires text to display")
  end

  local instance = options or {}
  instance.kind = "Text"
  local font = instance.font or g.getFont()
  instance.font = font
  instance.text = text
  setmetatable(instance, mt)
  return instance
end

return Text
