local love = require "love"
require "glove/index"
local fonts = Glove.fonts
local pprint = require "glove/pprint"

local g = love.graphics

local windowWidth, windowHeight = g.getDimensions()

local tabs, vstack

local state = { firstName = "Mark", lastName = "Volkmann" }

pprint.setup { show_all = true, wrap_array = true }

function createUI()
  local debug = true
  local logo1 = Glove.Image("images/love2d-heart.png", { height = 200 })
  local logo2 = Glove.Image("images/love2d-whale.png", { height = 100 })
  local text1 = Glove.Text("First Text Widget", { debug = debug, font = fonts.default18 })
  local text2 = Glove.Text("Second Text Widget (long)", { debug = debug, font = fonts.default30 })
  local text3 = Glove.Text("Third Text Widget", { debug = debug, font = fonts.default18 })

  g.setFont(fonts.default18)

  local button = Glove.Button("Seven", {
    buttonColor = Glove.colors.red,
    font = fonts.default18,
    labelColor = Glove.colors.yellow,
    onClick = function()
      print("got click")
    end
  })

  local checkbox = Glove.Checkbox("Hungry?", state, "hungry", {
    onChange = function(t, key, value)
      print("got change to " .. key, value, t[key])
    end
  })

  local firstNameInput = Glove.Input(state, "firstName", {
    onChange = function(t, key, value)
      print("got change to " .. key, value, t[key])
    end,
    width = 100
  })
  local lastNameInput = Glove.Input(state, "lastName", {
    onChange = function(t, key, value)
      print("got change to " .. key, value, t[key])
    end,
    width = 100
  })

  local greetingText = Glove.Text("", {
    compute = function()
      return "Hello, " .. state.firstName .. " " .. state.lastName .. "!"
    end
  })

  local radioButtons = Glove.RadioButtons(
    {
      { label = "Red",   value = "r" },
      { label = "Green", value = "g" },
      { label = "Blue",  value = "b" }
    },
    state,
    "color",
    {
      -- font = fonts.default30,
      onChange = function(t, key, value)
        print("got change to " .. key, value, t[key])
      end,
      vertical = true
    }
  )

  local select = Glove.Select(
    {
      { label = "Red",   value = "r" },
      { label = "Green", value = "g" },
      { label = "Blue",  value = "b" }
    },
    state,
    "color",
    {
      -- font = fonts.default30,
      onChange = function(t, key, value)
        print("got change to " .. key, value, t[key])
      end,
      vertical = true
    }
  )

  local toggle = Glove.Toggle(state, "hungry", {
    onChange = function(t, key, value)
      print("got change to " .. key, value, t[key])
    end
  })

  g.setFont(fonts.default30)

  vstack = Glove.VStack(
    { spacing = 20 },
    Glove.HStack(
      { align = "center", spacing = 20 },
      Glove.Spacer(),
      Glove.Text("One"),
      Glove.Text("Two", { debug = debug, font = fonts.default18 }),
      Glove.Text("Three")
    ),
    Glove.HStack(
      { spacing = 20 },
      Glove.Spacer(),
      Glove.Text("Four"),
      Glove.Text("Five"),
      Glove.Spacer()
    ),
    Glove.HStack(
      { align = "center", spacing = 20 },
      Glove.Text("Six"),
      button,
      Glove.Text("Eight"),
      Glove.Text("Nine")
    ),
    Glove.HStack(
      { spacing = 20 },
      Glove.ZStack(
        { align = "center" },
        logo1,
        Glove.Text("LÖVE", { color = Glove.colors.black, font = fonts.default30 })
      ),
      Glove.VStack(
        { id = 1 },
        firstNameInput,
        lastNameInput,
        greetingText
      )
    ),
    Glove.HStack(
      { spacing = 20 },
      checkbox,
      toggle
    ),
    Glove.HStack(
      {},
      radioButtons,
      select
    ),
    Glove.Spacer(),
    Glove.FPS({ font = fonts.default12 })
  )

  local tabFont = fonts.default12
  tabs = Glove.Tabs(
    {
      {
        label = "Baseball",
        widget = Glove.VStack(
          { spacing = 10 },
          Glove.Text("There's no crying in baseball!", { font = tabFont }),
          Glove.HStack(
            { align = "center", spacing = 10 },
            Glove.Text("Like baseball?", { font = tabFont }),
            Glove.Toggle(state, "likeBaseball")
          )
        )
      },
      {
        label = "Basketball",
        widget = Glove.VStack(
          { spacing = 10 },
          Glove.Text("Nuggets Rule!", { font = tabFont }),
          Glove.HStack(
            { align = "center", spacing = 10 },
            Glove.Text("Like basketball?", { font = tabFont }),
            Glove.Toggle(state, "likeBasketball")
          )
        )
      },
      {
        label = "Football",
        widget = Glove.Text("Football detail goes here!", { font = tabFont })
      },
      {
        label = "Hockey",
        widget = Glove.Text("Hockey detail goes here!", { font = tabFont })
      }
    },
    {
      font = fonts.default18,
      onChange = function(index, tab)
        print("selected tab " .. tab.label .. " at index " .. index)
      end,
    }
  )
end

function love.load()
  createUI()
end

function love.update(dt)
  -- Currently nothing is needed here.
end

function love.draw()
  --[[ g.setColor(Glove.colors.red)
  g.setFont(fonts.default30)
  g.print("Hello, World!", 0, 0) ]]
  g.setColor(Glove.colors.white)

  vstack:draw()
  -- tabs:draw()
end

-- TODO: Can this be done in Input.lua?
function love.keypressed(key)
  inputProcessKey(key)
end

function love.mousepressed(x, y, button)
  Glove.mousePressed(x, y, button)
end

function love.resize()
  vstack.computed = false
  createUI()
end
