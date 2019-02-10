# once

A small module that allows you to call a method only once without the need of making extra variables for it.

## Installation

The once.lua file should be dropped into an existing project and required by it.

```lua
once = require "once"
```

You can then use `once` to create a new once-object with `once.new(obj)`, where you pass the object you want to use once with.

## Usage

### once(f, ...)

Let's assume your object has the function `foo`, which prints the first argument. We can then use once like this:

```lua
function object:update(dt)
	self.once("foo", "Hello World!")
end
```

Only on the first frame will foo be called. This can also be done with `self.once:foo("Hello World!")`.

### free(f, f2, ...)

If you want your method to be called again, you can free it by passing the name of the method as first argument.
You can add a second method (`f2`) that, in case `f` was trapped, will be called.

```lua
-- When a is pressed, foo will be freed again and bar will be called.
-- Foo will be called again next frame.
function object:update(dt)
	self.once("foo", "Hello World!")

	if keyPressed("a") then
		self.once:free("foo", "bar")
	end
end
```

## License

This library is free software; you can redistribute it and/or modify it under the terms of the MIT license. See [LICENSE](LICENSE) for details.