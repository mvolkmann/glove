# Glove

Glove is a widget library for [LÖVE](https://love2d.org/) (love2d)
which is a framework for building 2D games in Lua.
It defines many commonly used widgets and a layout system.

To run the demo, enter `love src`.

To include Glove in your project,
copy the `glove` directory found in the `src` directory into it.

For example code, see `src/main.lua`.

## Colors

Glove defines the following colors that can be accessed with
`Glove.color.{color-name}`:

- `black`
- `blue`
- `brown`
- `gray`
- `green`
- `orange`
- `purple`
- `red`
- `white`
- `yellow`

## Fonts

Glove defines the following fonts that can be accessed with
`Glove.font.{font-name}`:

- `default12`
- `default18`
- `default30`

## Functional functions

Glove defines the following functional programming functions:

- `Glove.count(t, predicate)`

  Returns the number of items in a given table that match a predicate.

- `Glove.every(t, predicate)`

  Returns a boolean indicating whether
  every item in a given table matches a predicate.

- `Glove.filter(t, predicate)`

  Returns a new table containing all items in a given table
  that match a predicate.

- `Glove.find(t, predicate)`

  Returns the first item in a given table that matches a predicate.

- `Glove.map(t, fn)`

  Returns a new table containing the results of passing
  each item in a given table to a given function.

- `Glove.max(t, fn)`

  Returns the maximum value returned by a function
  that is passed each item in a given table.

- `Glove.min(t, fn)`

  Returns the minimum value returned by a function
  that is passed each item in a given table.

- `Glove.reduce(t, fn, initial)`

  Returns a single value computed by accumulating the results
  of passing each item in a given table to a given function.

- `Glove.some(t, predicate)`

  Returns a boolean indicating whether
  some item in a given table matches a predicate.

- `Glove.sum(t)`

  Returns the sum of the numbers in a given table.
  While this can be implemented using "reduce",
  this is a bit more efficient.

- `Glove.sumFn(t, fn)`

  Returns the sum of the values returned by
  a function that is passed each item in a given table.
  While this can be implemented using "reduce",
  this is a bit more efficient.

## Graphical Widgets

The following widgets are currently supported:

- `Button`

  This widget is a clickable button.

  The parameters are:

  - the text to display on the button
  - a table of options.

  The supported options are:

  - `buttonColor`: background color of the button; defaults to white
  - `font`: font used for the button label
  - `labelColor`: color of the label; defaults to black
  - `onClick`: function called when the button is clicked

  For example:

  ```lua
  local button = Glove.Button("Press Me", {
    buttonColor = Glove.colors.red,
    font = Glove.fonts.default18,
    labelColor = Glove.colors.yellow,
    onClick = function()
      print("got click")
    end
  })
  ```

- `Checkbox`

  This widget ties a checkbox state to a boolean value in a table.

  The parameters are:

  - text to display after the checkbox
  - table that holds its state
  - key within the table that holds its state

  The supported options are:

  - `font`: used for the button label
  - `color`: of the label and checkbox; defaults to white
  - `onChange`: function called when the checkbox is clicked

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

