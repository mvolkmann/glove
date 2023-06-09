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

## Graphical Widgets

Each of the currently supported graphical widgets are described below.
Many of them display a green outline when the mouse cursor hovers over them.

### `Button`

This widget is a clickable button.

The parameters are:

- text to display on the button
- table of options

The supported options are:

- `buttonColor`: background color of the button; defaults to white
- `font`: font used for the button label
- `labelColor`: color of the label; defaults to black
- `onClick`: function called when the button is clicked

For example:

![Glove Button](/images/glove-button.png)

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

### `Checkbox`

This widget ties a checkbox state to a boolean value in a table.

The parameters are:

- text to display after the checkbox
- table that holds its state
- key within the table that holds its state
- table of options

The supported options are:

- `font`: used for the button label
- `color`: of the label and checkbox; defaults to white
- `onChange`: optional function called when the checkbox is clicked

For example:

![Glove Checkbox](/images/glove-checkbox.png)

```lua
local state = { hungry = false }

Glove.Checkbox("Hungry?", state, "hungry", {
  onChange = function(t, key, value)
    print(key .. " is now " .. tostring(value))
  end
})
```

### `FPS`

This widget displays the frames per second currently being achieved

The parameters are:

- table of options

The supported options are:

- `font`: used for the text

For example:

![Glove FPS](/images/glove-fps.png)

```lua
Glove.FPS({ font = Glove.fonts.default12 })
```

- `Image`

This widget displays an image.

The parameters are:

- filePath: path to the image file
- table of options

The supported options are:

- `height`: of the image (aspect ratio is preserved)

For example:

![Glove Image](/images/glove-image.png)

```lua
Glove.Image("images/love2d-heart.png", { height = 100 })
```

### `Input`

This widget allows the user to enter text.
The text automatically scrolls horizontally
when it exceeds the specified width.
The cursor can be positioned using the left and right arrow keys.
The character to the left of the cursor can be deleted
by pressing the delete key.

The text is tied to value of a given key in a given table.

Current the cursor cannot be positioned by clicking
and the entered text cannot be selected.

The parameters are:

- table that holds its state
- key within the table that holds its state
- table of options

The supported options are:

- `color`: of the border and text; defaults to white
- `font`: used for the text
- `width`: of the widget

For example:

![Glove Input](/images/glove-input.png)

```lua
local state = { firstName = "" }

Glove.Input(state, "firstName", { width = 100 })
```

### `RadioButtons`

This widget allows the user to select one radiobutton from a set.

The selected value is tied to value of a given key in a given table.

The parameters are:

- choices described by an array-like table containing
  tables with `label` and `value` keys
- table that holds its state
- key within the table that holds its state
- table of options

The supported options are:

- `color`: of the radiobuttons and their labels; defaults to white
- `font`: used for the labels
- `onChange`: optional function to be called when a choice is selected
- `vertical`: boolean indicating whether the radiobuttons
  should be arranged vertically; defaults to false

For example:

![Glove RadioButtons](/images/glove-radiobuttons.png)

```lua
local state = { color = "r" }

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
)
```

### `Select`

This widget displays a dropdown list of options
and allows the user to select one.

The selected value is tied to value of a given key in a given table.

![Glove Select](/images/glove-select.png)

The parameters are:

- choices described by an array-like table containing
  tables with `label` and `value` keys
- table that holds its state
- key within the table that holds its state
- table of options

The supported options are:

- `color`: of the labels; defaults to white
- `font`: used for the labels
- `onChange`: optional function to be called when a choice is selected

For example:

```lua
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
)
```

### `Tabs`

This widget displays a row of tabs where only one can be selected at a time.
Each tab is associated with a single widget which is
typically an `HStack`, `VStack`, or `ZStack`.
The widget associated with the selected tab is displayed below the tabs.

The parameters are:

- tabs described by an array-like table containing
  tables with `label` and `widget` keys
- table of options

The supported options are:

- `color`: of the labels; defaults to white
- `font`: used for the labels
- `onChange`: optional function to be called when a tab is selected;
   passed the tab index and the table describing the tab

For example:

![Glove Tabs](/images/glove-tabs.png)

```lua
Glove.Tabs(
  {
    {
      label = "Baseball",
      widget = Glove.VStack(
        { spacing = 10 },
        Glove.Text("There's no crying in baseball!", { font = tabFont }),
        Glove.HStack(
          { align = "center", spacing = 10 },
          Glove.Text("Like baseball?"),
          Glove.Toggle(state, "likeBaseball")
        )
      )
    },
    {
      label = "Basketball",
      widget = Glove.VStack(
        { spacing = 10 },
        Glove.Text("Nuggets Rule!"),
        Glove.HStack(
          { align = "center", spacing = 10 },
          Glove.Text("Like basketball?"),
          Glove.Toggle(state, "likeBasketball")
        )
      )
    },
    {
      label = "Football",
      widget = Glove.Text("Football detail goes here!")
    },
    {
      label = "Hockey",
      widget = Glove.Text("Hockey detail goes here!")
    }
  },
  {
    font = Glove.fonts.default18,
    onChange = function(index, tab)
      print("selected tab " .. tab.label .. " at index " .. index)
    end,
  }
)
```

### `Text`

This widget displays static text, computed text,
or the value of a given key in a given table.

The parameters are:

- text to display or a function that returns it
- table of options

The supported options are:

- `color`: of the text; defaults to white
- `font`: used for the text
- `table`: a table that holds the text to display
- `key`: a key within the table that holds the text to display
- `width`: used when key and table are specified

For example:

![Glove Text](/images/glove-text.png)

```lua
Glove.Text("Hello, World!", {
  color  Glove.colors.red,
  font = Glove.fonts.default18
})

local state = { firstName = "Mark", lastName = "Volkmann" }

Glove.Text(
  function()
    return "Hello, " .. state.firstName .. " " .. state.lastName .. "!"
  end
)

Glove.Text("", { table = state, key = "firstName" }),
```

### `Toggle`

This widget ties a toggle state to a boolean value in a table.

The parameters are:

- table that holds its state
- key within the table that holds its state
- table of options

The supported options are:

- `color`: of the toggle; defaults to white
- `onChange`: optional function called when the checkbox is clicked

For example:

![Glove Toggle](/images/glove-toggle.png)

```lua
Glove.Toggle(state, "hungry", {
  onChange = function(t, key, value)
    print(key .. " is now " .. tostring(value))
  end
})
```

## Layout Widgets

Layout is heavily based on ideas from SwiftUI and
borrows the names `HStack`, `VStack`, `ZStack`, and `Spacer`.
The "stack" widgets each hold child widgets.
Complex layouts can be defined by nesting stack widgets
inside other stack widgets.

### `HStack`

This arranges widgets horizontally.

By default there is no space between the widgets.
To add space, specify the `spacing` option.

To vertically align the widgets, specify the `align` option
with a value of `"top"` (default), `"center"`, or `"bottom"`.

The parameters are:

- table of options
- child widgets as individual arguments

The supported options are:

- `align`: "top" (default), "center", or "bottom"
- `spacing`: positive integer to add space between non-spacer children

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

### `VStack`

This arranges widgets vertically.

By default there is no space between the widgets.
To add space, specify the `spacing` option.

To horizontally align the widgets, specify the `align` option
with a value of `"start"` (default), `"center"`, or `"end"`.

The parameters are:

- table of options
- child widgets as individual arguments

The supported options are:

- `align`: "start" (default), "center", or "end"
- `spacing`: positive integer to add space between non-spacer children

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

### `ZStack`

This stacks widgets on top of each other.

To control the position of each widget in the stack,
specify the `align` option with a compass direction or `"center"`.

The parameters are:

- table of options

The supported options are:

- align: "center" or one of the following compass directions:
  "north", "south", "east", "west",
  "northeast", "southeast", "southwest", or "northwest" (default)

For example:

```lua
Glove.ZStack(
  { align = "center" },
  Glove.Image("images/love2d-heart.png", { height = 200 }),
  Glove.Text("LÖVE", {
    color = Glove.colors.black,
    font = Glove.fonts.default30
  })
)
```

### Spacer

This widget adds space inside an `HStack` or `VStack`.

Adding a `Spacer` at the end of a table of child widgets
pushes them to the left.

Adding a `Spacer` at the beginning of a table of child widgets
pushes them to the right.

Adding a `Spacer` between widgets in a table of child widgets
pushes the ones preceding it to the left and
pushes the ones following it to the right.

Any number of `Spacer` widgets can be added to a table of widgets.
The amount of space consumed by each is computed by
dividing the unused space by the number of `Spacer` widgets.

For example, the following code creates a row of `Text` widgets
that are vertically centered.
The space between "One" and "Two" is 20.
The space between "Two" and "Three" is 20.
The space between "Three" and "Four" is all the remaining space in the row.
The text "Four" is pushed to the right.

```lua
Glove.HStack(
  { align = "center", spacing = 20 },
  {
    Glove.Text("One"),
    Glove.Text("Two", { font = Glove.fonts.default18 }),
    Glove.Text("Three")
    Glove.Spacer(),
    Glove.Text("Four")
  }
)
```

## Functional functions

Glove defines the many functional programming functions.
The predefined widgets use them and your code can too.
To use them, add the following near the top of a source file:

```lua
local fun = require "glove/fun"
```

The functions provided are:

- `fun.count(t, predicate)`

  Returns the number of items in a given table that match a predicate.

- `fun.every(t, predicate)`

  Returns a boolean indicating whether
  every item in a given table matches a predicate.

- `fun.filter(t, predicate)`

  Returns a new table containing all items in a given table
  that match a predicate.

- `fun.find(t, predicate)`

  Returns the first item in a given table that matches a predicate.

- `fun.map(t, fn)`

  Returns a new table containing the results of passing
  each item in a given table to a given function.

- `fun.max(t, fn)`

  Returns the maximum value returned by a function
  that is passed each item in a given table.

- `fun.min(t, fn)`

  Returns the minimum value returned by a function
  that is passed each item in a given table.

- `fun.reduce(t, fn, initial)`

  Returns a single value computed by accumulating the results
  of passing each item in a given table to a given function.

- `fun.some(t, predicate)`

  Returns a boolean indicating whether
  some item in a given table matches a predicate.

- `fun.sum(t)`

  Returns the sum of the numbers in a given table.
  While this can be implemented using "reduce",
  this is a bit more efficient.

- `fun.sumFn(t, fn)`

  Returns the sum of the values returned by
  a function that is passed each item in a given table.
  While this can be implemented using "reduce",
  this is a bit more efficient.

