Airbnb Style Guide
==================

References
----------

### const, let, var

Order of priority; const, let, var

Constant ensures you can't reassign references (mutation)

    // bad
    var a = 1;
    var b = 2;
    
    // good
    const a = 1;
    const b = 2;
    
If you must mutate references, use `let` instead of `var`, as it is correctly block scoped

This is the order it should appear in code, too

    // bad
    let i;
    const items = getItems();
    let dragonball;
    const goSportsTeam = true;
    let len;
  
    // good
    const goSportsTeam = true;
    const items = getItems();
    let dragonball;
    let i;
    let length;

Also, none of this stuff:

    // bad
    const items = getItems(),
        goSportsTeam = true,
        dragonball = 'z';
        


Objects
-------

### Create

    const item = {};
    
### Method shorthand

    const atom = {
      value: 1,
      
      addValue(value) {
        return atom.value + value;
      }
    }

### Property value shorthand
    
    const lukeSkywalker = 'Luke Skywalker';
  
    // bad
    const obj = {
      lukeSkywalker: lukeSkywalker,
    };
  
    // good
    const obj = {
      lukeSkywalker,
    };
    
### Shorthand properties at beginning
    
It's easier to tell which properties are using the shorthand

    const anakinSkywalker = 'Anakin Skywalker';
    const lukeSkywalker = 'Luke Skywalker';
  
    // bad
    const obj = {
      episodeOne: 1,
      twoJediWalkIntoACantina: 2,
      lukeSkywalker,
      episodeThree: 3,
      mayTheFourth: 4,
      anakinSkywalker,
    };
  
    // good
    const obj = {
      lukeSkywalker,
      anakinSkywalker,
      episodeOne: 1,
      twoJediWalkIntoACantina: 2,
      episodeThree: 3,
      mayTheFourth: 4,
    };

Arrays
------

### Create

    const items = [];
    
### Pushing to arrays

Use push

    const someStack = [];
    
    // bad
    someStack[someStack.length] = 'abracadabra';
    
    // good
    someStack.push('abracadabra');

### Copy arrays

    const itemsCopy = [...items];
    
### Convert to array

    const newArray = Array.from(arrayLikeObject);
    
Destructuring
-------------

### Accessing and using multiple properties

No temporary references created

For objects;

     // bad
    function getFullName(user) {
      const firstName = user.firstName;
      const lastName = user.lastName;
    
      return `${firstName} ${lastName}`;
    }
    
    // good
    function getFullName(obj) {
      const { firstName, lastName } = obj;
      return `${firstName} ${lastName}`;
    }
    
    // best
    function getFullName({ firstName, lastName }) {
      return `${firstName} ${lastName}`;
    }

For arrays;

    const [first, second] = arr;
    
### Return object destructuring for multiple return values

Not array destructuring

This allows properties and order to change without breaking calling code

    // bad
    function processInput(input) {
      // then a miracle occurs
      return [left, right, top, bottom];
    }
  
    // the caller needs to think about the order of return data
    const [left, __, top] = processInput(input);
  
    // good
    function processInput(input) {
      // then a miracle occurs
      return { left, right, top, bottom };
    }
  
    // the caller selects only the data they need
    const { left, right } = processInput(input);

Strings
-------

Use single quotes

### Long strings

Use concatenation

    const errorMessage = 'This is a super long error that was thrown because ' +
      'of Batman. When you stop to think about how Batman had anything to do ' +
      'with this, you would get nowhere fast.';
      
Functions
---------

Never declare a function within a non function block (if, while, etc)

### Use function declarations


    // bad
    const foo = function() {}
    
    // good
    function foo() {}
    
- Easier to debug (functions are named in call stacks)
- Function body is hoisted (moved to top of current scope)
  - Instead of just the reference to a function being hoisted
  - Makes it possible to always use Arrow Functions

### Default params last

    function handleThings(name, opts = {}) {
      // ...
    }
  
### Arrow functions

Use them! It executes in the context of `this`, and is more concise syntax

Properties
----------

Use dot notation, eg: `something.isSomething` instaed of `something['isSomething']`

UNLESS it's a variable, eg: `something[isSomething]`

Type casting & coercion
-----------------------

### Strings

    const totalScore = String(this.reviewScore);
    
### Numbers

    const val = Number(inputValue);

### Booleans

Two ways;

    const hasAge = Boolean(age);
    
    const hasAge = !!age;
    

Accessors
---------

Don't bother for properties

Otherwise, use `getVal()` and `setVal(new)`, not `val()` and `val(new)`

Booleans should be `isVal()` or `hasVal()`

