Mustache cheatsheet
===================

Example view data used in cheatsheet:

```
{
  "name": {
    "first": "Michael",
    "last": "Jackson'
  },
  "nothing": false,
  "stooges": [
    { "name": "Moe" },
    { "name": "Larry" },
    { "name": "Curly" }
  ],
  "musketeers": ["Athos", "Aramis", "Porthos", "D'Artagnan"],
  "beatles": [
    { "firstName": "John", "lastName": "Lennon" },
    { "firstName": "Paul", "lastName": "McCartney" },
    { "firstName": "George", "lastName": "Harrison" },
    { "firstName": "Ringo", "lastName": "Starr" }
  ],
  "name": function () {
    return this.firstName + " " + this.lastName;
  },
  "bold": function () {
    return function (text, render) {
      return "<b>" + render(text) + "</b>";
    }
  }
}
```

Print variable
--------------
```
{{name.first}}
```

If key does not exist, nothing is rendered

Escaping
--------

HTML escaped by default.

To render unescaped use triple mustache, or ampersand

```
{{{name}}}
{{&name}}
```

Sections
--------

Starts with hash, ends with slash. Text between this is a 'block'.

If variable is false, empty array, or does not exist; the block is skipped

```
{{#nothing}}
Not displayed
{{/nothing}}
```

If variable is an object, it is dereferenced

Instead of `name.first` and `name.last`:

```
{{#name}}The name is: {{first}} {{last}}{{/name}}
```

If variable is an array, the block is looped

The `.` contains the value

```
{{#musketeers}}
* {{.}}
{{/musketeers}}
```

If the variable is an array of objects, they are dereferenced within the loop

```
{{#stooges}}
<b>{{name}}</b>
{{/stooges}}
```

Functions can be used within sections

```
{{#beatles}}
* {{name}}
{{/beatles}}
```

Functions
---------

If a section is a function, the block text is passed as first argument, and rendering function as second

```
{{#bold}}Hi {{name}}.{{/bold}}
```

Inverted section
----------------

```
{{^beatles}}No beatles{{/beatles}}
```

Partials
--------

```
{#names}}
  {{>user}}
{{/names}}
```

It's more of an 'include' - as if the contents of the 'partial' were copy and pasted straight in

All variables inherited from calling context, nothing passed into it

### mustache.js

Third parameter accepts an array

- key = partial name
- value = template

```
partials = {
  user: '<strong>{{name}}</strong>'
}

Mustache.render(template, view, partials);
```


