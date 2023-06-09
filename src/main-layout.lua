local love = require "love"
require "glove"
local colors = Glove.colors

local hstack

local function createUI()
  local options = { spacing = 10 }
  hstack = Glove.HStack(
    options,
    --[[ Glove.HStack(
      options,
      Glove.Text("One"),
      Glove.Text("Two")
    ), ]]
    Glove.HStack(
      options,
      Glove.Text("Three"),
      Glove.Text("Four")
    )
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
