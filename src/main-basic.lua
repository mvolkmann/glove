local love = require "love"
require "glove"
local colors = Glove.colors
local fonts = Glove.fonts

local state = { firstName = "Mark", hungry = false, lastName = "Volkmann" }
local vstack

local function CustomWidget(color, width, height)
  color = color or colors.white
  width = width or 50
  height = height or 50

  return {
    draw = function(self, parentX, parentY)
      local x = parentX + self.x
      local y = parentY + self.y
      local g = love.graphics
      g.setColor(color)
      g.rectangle(
        "fill",
        x, y,
        self:getWidth(), self:getHeight()
      )
      g.setColor(colors.white)
      g.rectangle(
        "line",
        x, y,
        self:getWidth(), self:getHeight()
      )
    end,

    getHeight = function(self) return height end,

    getWidth = function(self) return width end
  }
end

local function createUI()
  vstack = Glove.VStack(
    { spacing = 10 },
    Glove.Button("Press Me", {
      buttonColor = colors.red,
      font = fonts.default18,
      labelColor = colors.yellow,
      onClick = function()
        print("got click")
      end
    }),
    Glove.Checkbox("Hungry?", state, "hungry", {
      onChange = function(t, key, value)
        print(key .. " is now " .. tostring(value))
      end
    }),
    Glove.FPS({ font = fonts.default12 }),
    Glove.Image("images/love2d-heart.png", { height = 100 }),
    Glove.Input(state, "firstName", { width = 100 }),
    Glove.RadioButtons(
      {
        { label = "Red",   value = "r" },
        { label = "Green", value = "g" },
        { label = "Blue",  value = "b" }
      },
      state,
      "color",
      {
        onChange = function(t, key, value)
          print(key .. " is now " .. value)
        end,
        vertical = true
      }
    ),
    Glove.Select(
      {
        { label = "Red",   value = "r" },
        { label = "Green", value = "g" },
        { label = "Blue",  value = "b" }
      },
      state,
      "color",
      {
        onChange = function(t, key, value)
          print(key .. " is now " .. value)
        end
      }
    ),
    Glove.Text("Hello, World!", {
      color = colors.red,
      font = fonts.default18
    }),
    Glove.Text(
      function()
        return "Hello, " .. state.firstName .. " " .. state.lastName .. "!"
      end
    ),
    Glove.Text("", { table = state, key = "firstName" }),
    Glove.Toggle(state, "hungry", {
      onChange = function(t, key, value)
        print(key .. " is now " .. tostring(value))
      end
    }),
    CustomWidget(colors.yellow, 40, 20)
  )
end

function love.load()
  createUI()
end

function love.update(dt)
  -- Currently nothing is needed here.
end

function love.draw()
  vstack:draw()
end

function love.resize()
  createUI()
end
