local love = require "love"
require "glove"
local fonts = Glove.fonts

-- local g = love.graphics

local state = { firstName = "Mark", lastName = "Volkmann" }
local vstack

local function createUI()
  vstack = Glove.VStack(
    { spacing = 20 },
    Glove.Button("Press Me", {
      buttonColor = Glove.colors.red,
      font = fonts.default18,
      labelColor = Glove.colors.yellow,
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
      color = Glove.colors.red,
      font = Glove.fonts.default18
    }),
    Glove.Text("", {
      compute = function()
        return "Hello, " .. state.firstName .. " " .. state.lastName .. "!"
      end
    }),
    Glove.Toggle(state, "hungry", {
      onChange = function(t, key, value)
        print(key .. " is now " .. tostring(value))
      end
    })
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
