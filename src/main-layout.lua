local love = require "love"
require "glove"

local container

local function createUI()
  local spacing = 20
  local half = (Glove.getAvailableWidth() - spacing) / 2
  container = Glove.HStack(
    { spacing = spacing },
    Glove.HStack(
      { width = half },
      Glove.Text("One"),
      Glove.Spacer(),
      Glove.Text("Two")
    ),
    Glove.HStack(
      { width = half },
      Glove.Text("Three"),
      Glove.Spacer(),
      Glove.Text("Four")
    )
  )
  --[[ local spacing = 20
  local half = (Glove.getAvailableHeight() - spacing) / 2
  container = Glove.VStack(
    { spacing = spacing },

    Glove.VStack(
      { height = half },
      Glove.Text("One"),
      Glove.Spacer(),
      Glove.Text("Two")
    ),

    Glove.VStack(
      { height = half },
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
