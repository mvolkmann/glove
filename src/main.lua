local love = require "love"
require "glove"

local hstack

local function createUI()
  hstack = Glove.HStack(
    { id = 1, spacing = 10 },

    --[[ Glove.Text("One"),
    Glove.Text("Two") ]]

    Glove.HStack(
      { id = 2, spacing = 10 },
      Glove.Text("One"),
      Glove.Text("Two")
    )

  --[[ Glove.HStack(
      options,
      Glove.Text("Three"),
      Glove.Text("Four")
    ) ]]
  )
end

function love.load()
  createUI()
end

function love.update(dt)
  -- Currently nothing is needed here.
end

function love.draw()
  hstack:draw()
end

function love.resize()
  createUI()
end
