Coffeescript cheatsheet
=======================

### Intro

* No semicolons, use new line
* No curly braces, use indentation
* No parentheses required to invoke function

    ```
    function1 function2 param1, param2
    =
    function1(function2(param1, param2));
    ```

    * HOWEVER - use them usually, better readability, and `@someFunction` very is different to `@someFunction()`

* Functions return the final line

### Operators and aliases

* `==` becomes `===`
* `!=` becomes `!==`
* `is` becomes `===`
* `isnt` becomes `!==`

* `not` alias to `!`
* `and` alias to `&&`
* `or` alias to `||`

* `on` and `yes` alias for `true`
* `off` and `no` alias for `false`

* `unless` is inverse of `if`

* `@` alias to `this`
* `@property` alias to `this.property`

### Strings

* Single quotes = Literal
* Double quotes = Allow for interpolated values, eg:

`"The variable is #{variable} - awesome"`

#### Multiline strings

```
mobyDick = "Call me Ishmael. Some years ago --
  never mind how long precisely -- having little
  or no money in my purse, and nothing particular
  to interest me on shore, I thought I would sail
  about a little and see the watery part of the
  world..."
```

Line breaks are converted into a single space. Indentation is ignored.

#### Block strings

Use block strings to hold formatted or indentation-sensitive text:

```
html = """
       <strong>
         cup of coffeescript
       </strong>
       """
```

The indentation level that begins the first block is maintained through-out

#### Block comments

```
###
Line 1
Line 2
###

//becomes...

/*
Line 1
Line 2
*/
```

### Functions

Parameters in parentheses, an arrow, then the function body

```
square = (x) -> x * x

weatherReport = (location) ->
  [location, 72, "Mostly Sunny"]

//JS:

square = function(x) {
  return x * x;
};
```

*Note: There is no need to write â€˜return'*

#### Default values

```
fill=(container, liquid ="coffee")
```

### Arrays and objects

Many styles:

```
ong = ["do", "re", "mi", "fa", "so"]

address: [
  "Via Roma 42R"
  "Bellagio, Italy 22021"
]

singers = {Jagger: "Rockâ€, Elvis: "Roll"}

kids =
  brother:
    name: "Max"
    age:  11
  sister:
    name: "Ida"
    age:  9

yearsOld = max: 10, ida: 9, tim: 11
```

### If, else, unless, and conditional assignment

```
if happy and knowsIt
  clapsHands()
else
  showIt()

mood = greatlyImproved if singing
date = if friday then sue else jill
```

### Loops and comprehensions

* Use `in` to loop over values
* Use `of` to loop over keys

```

for element in array
  # code here


# Loops through food array, assigning â€˜foodâ€™ to each, and calling eat(food);
eat food for food in [â€˜toastâ€™, â€˜cheeseâ€™, â€˜chocolateâ€™, â€˜wineâ€™] when food isnt â€˜chocolate'

shortNames = (name for name in list when name.length < 5)

events = (x for x in [0..10] by 2)

buy() while supply > demand
sell() until supply > demand
```

### Chained comparisons

```
healthy = 200 > cholesterol > 60
```

### Exceptions

```
try
   nonexistent / undefined
catch error
   â€œThe error is: #{error}"
finally
    cleanUp()
```

# Exisential operator

`variable?` returns true unless it is null or undefined

```
solipsism = true if mind? and not world?

footprints = yeti ? â€œbearâ€ //If â€˜yetiâ€™ exists, footprints = yeti, otherwise footprints = â€œbear"

speed ?= 15 //if â€˜speedâ€™ exists, speed = speed, otherwise speed = 15

zip = lottery.drawWinner?().address?.zipcode

```

### Class

```
class Animal
  constructor: (name) ->
    @name = name

  move: (meters) ->
    alert @name + " moved #{meters}m."

class Snake extends Animal
  move: ->
    alert "Slithering..."
    super 5

class Horse extends Animal
  move: ->
    alert "Galloping..."
    super 45

sam = new Snake "Sammy the Python"
tom = new Horse "Tommy the Palomino"

sam.move()
tom.move()
```

This:

```
constructor: (name) ->
  @name = name
```

Can be shortened to:

```
constructor: (@name) ->
```

### Destructuring Assignment

Returns multiple values:

```
weatherReport = (location) ->
  [location, 72, "Mostly Sunny"]

[city, temp, forecast] = weatherReport "Berkeley, CA"
```

Go deeper:

```
futurists =
  sculptor: "Umberto Boccioni"
  painter:  "Vladimir Burliuk"
  poet:
    name:   "F.T. Marinetti"
    address: [
      "Via Roma 42R"
      "Bellagio, Italy 22021"
    ]

{poet: {name, address: [street, city]}} = futurists
```

Useful for parameters:

```
class Person
  constructor: (options) ->
    {@name, @age, @height} = options

tim = new Person age: 4
```

My fave:

```
create: (type, weight, {title, subtitle} = {}) ->
    title ?= 'Default title'
    subtitle ?= 'Default subtitle'
```

### Switch statements

```
switch day
  when "Mon" then go work
  when "Tue" then go relax
  when "Thu" then go iceFishing
  when "Fri", "Sat"
    if day is bingoDay
      go bingo
      go dancing
  when "Sun" then go church
  else go work
```

Can be cleaner than if statements:

```
score = 76
grade = switch
  when score < 60 then 'F'
  when score < 70 then 'D'
  when score < 80 then 'C'
  when score < 90 then 'B'
  else 'A'
```
