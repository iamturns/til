No Jquery
=========

Select
------

### Single element

```
// IE 5.5+
document.getElementById('myElement');
// More efficient

// IE 8+
document.querySelector('#myElement');
```

### By class

```
// IE 9+
document.getElementsByClassName('myElement');
// Returns HTMLCollection. Most efficient

// IE 8+
document.querySelectorAll('.myElement');
// Returns NodeList
```

### More

```
// IE 5.5+
document.getElementsByTagName('div');

// IE 8+
document.querySelectorAll('div');

// IE 8+
document.querySelectorAll('[data-foo-bar="someval"]');

// IE 10+
document.querySelectorAll('#myForm :invalid');
// Pseudo-class is IE 10+ only
```


