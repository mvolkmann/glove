# Glove

Glove is a widget library for LÖVE (love2d)
which is a framework for building 2D games in Lua.

To run the demo, enter `love src`.

To include in your project,
copy the glove directory in it.

See src/main.lua for example code.

## Graphical Widgets

The following widgets are currently supported:

- `Button`

  This is a clickable button.

  For example:

  ```lua
  local button = Glove.Button("Seven", {
    buttonColor = Glove.colors.red,
    font = Glove.fonts.default18,
    labelColor = Glove.colors.yellow,
    onClick = function()
      print("got click")
    end
  })
  ```

- `Checkbox`

  For example:

  ```lua
  local state = { hungry = false }

  Glove.Checkbox("Hungry?", state, "hungry", {
    onChange = function(t, key, value)
      print("got change to " .. key, value, t[key])
    end
  })
  ```

- `FPS`

  For example:

  ```lua
  ```

- `Image`

  This displays an image.

  For example:

  ```lua
  Glove.Image("images/love2d-heart.png", { height = 200 })
  ```

- `Input`

  For example:

  ```lua
  ```

- `RadioButtons`

  For example:

  ```lua
  ```

- `Select`

  For example:

  ```lua
  ```

- `Tabs`

  For example:

  ```lua
  ```

- `Text`

  For example:

  ```lua
  ```

- `Toggle`

  For example:

  ```lua
  ```

## Layout Widgets

Layout is heavily based on ideas from SwiftUI.
The following widgets are used to layout the graphical widgets.

- `HStack`

  This arranges widgets horizontally.

  By default there is no space between the widgets.
  To add space, specify the `spacing` option.

  To vertically align the widgets, specify the `align` option
  with a value of `"top"` (default), `"center"`, or `"bottom"`.

  For example:

  ```lua
  Glove.HStack(
    { align = "center", spacing = 20 },
    {
      Glove.Text("Left"),
      Glove.Text("Center"),
      Glove.Text("Right")
    }
  )
  ```

- `VStack`

  This arranges widgets vertically.

  By default there is no space between the widgets.
  To add space, specify the `spacing` option.

  To horizontally align the widgets, specify the `align` option
  with a value of `"start"` (default), `"center"`, or `"end"`.

  For example:

  ```lua
  Glove.VStack(
    { align = "center", spacing = 20 },
    {
      Glove.Text("Top"),
      Glove.Text("Center"),
      Glove.Text("Bottom")
    }
  )
  ```

- `ZStack`

  This stacks widgets on top of each other.

  To control the position of each widget in the stack,
  specify the `align` option with a compass direction or `"center"`.
  The supported compass directions are
  `"north"`, `"south"`, `"east"`, `"west"`, 
  `"northeast"`, `"southeast"`, `"southwest"`, and "northwest" (default).

  For example:

  ```lua
      Glove.ZStack(
        { align = "center" },
        Glove.Image("images/love2d-heart.png", { height = 200 }),
        Glove.Text("LÖVE", {
          color = Glove.colors.black,
          font = Glove.fonts.default30
        })
      ),
  ```

- Spacer

  This adds space inside an `HStack` or `VStack`.

  For example, the following code creates a row of `Text` widgets
  that are vertically centered.
  The space between "One" and "Two" is 20.
  The space between "Two" and "Three" is 20.
  The space between "Three" and "Four" is all the remaining space in the row.

  ```lua
  Glove.HStack(
    { align = "center", spacing = 20 },
    {
      Glove.Text("One"),
      Glove.Text("Two", { font = fonts.default18 }),
      Glove.Text("Three")
      Glove.Spacer(),
      Glove.Text("Four")
    }
  )
  ```

