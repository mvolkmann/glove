local love = require "love"
require "glove"

local container

local function createUI()
  local available = Glove.getAvailableWidth()
  container = Glove.HStack(
    { id = 1, spacing = 10 },

    Glove.HStack(
      { id = 2, spacing = 10, width = available / 2 },
      Glove.Text("One"),
      Glove.Spacer(),
      Glove.Text("Two")
    ),

    Glove.HStack(
      { id = 3, spacing = 10, width = available / 2 },
      Glove.Text("Three"),
      Glove.Spacer(),
      Glove.Text("Four")
    )
  )

  --[[ local available = Glove.getAvailableHeight()
  container = Glove.VStack(
    { id = 1, spacing = 10 },

    Glove.VStack(
      { id = 2, spacing = 10, height = available / 2 },
      Glove.Text("One"),
      Glove.Spacer(),
      Glove.Text("Two")
    ),

    Glove.VStack(
      { id = 3, spacing = 10, height = available / 2 },
      Glove.Text("Three"),
      Glove.Spacer(),
      Glove.Text("Four")
    )
  ) ]]
end

function love.load()
  createUI()
end

function love.update(dt)
  -- Currently nothing is needed here.
end

function love.draw()
  container:draw()
end

function love.resize()
  createUI()
end
