Bourbon
=======

**`button ($style: simple, base-colour: #4294f0)`**

Create a button. Automatically calculated text colour, gradient, borders, etc based on colour

Styles: simple, pill, shiny

**`clearfix`**

**Font family**

- font-family: $helvetica;
- font-family: $georgia;
- font-family: $lucida-grande;
- font-family: $monospace;
- font-family: $verdana;

**`hide-text`**

**Text input styling**

Includes all inputs rendered as text based (excluding textarea)

```
#{$all-text-inputs} {}
#{$all-text-inputs-hover} {}
#{$all-text-inputs-focus} {}
```

**`position ($position: relative, $coordinates: 0 0 0 0)`**

**`retina-image($filename, $background-size, $extension = 'png')`**

Eg: `@include retina-image(home-icon, 32px 20px);`

Will pull in url(home-icon.png) regular, and url(home-icon_2x.png) for retina displays

**`size ($width, $height)`**

Unitless values default to px

```
@include size(25);        // width: 25px; height: 25px;
@include size(30px 70px); // width: 30px; height: 70px;
@include size(auto 80px); // width: auto; height: 80px;
```

**`triangle ($size, $colour, $direction)`**

Directions: up, down, left, right, up-right, up-left, down-right, down-left
