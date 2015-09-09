Jasmine Cheatsheet
==================

Test suite
----------

A group of related specs

Defined by calling `describe`, which takes two params;
- name for spec suite (usually what is being tested)
- function - one or more specs

Test suites can be nested too

Specs
-----

Defined by calling `it`, which takes two params;
- name of spec
- function - one or more expectations that test the stae of code


Expectations
------------

Build with `expect`, which takes a value, called the 'actual'

Chain with a Matcher function, which takes the expected value

Matchers
--------

Implements a boolean comparison between the actual value and the expected value

This will report to Jasmine if the spec passed or failed

Can evaluate to negative by chaining `expect` with a `not` before the matcher

### Included matchers

- toBe
  - Compares with `===`
- toEqual
  - Compares with `==`
- toMatch
  - Regular expressions
- toBeDefined
  - Compare against `undefined`
- toBeUndefined
- toBeNull
- toBeTruthy
  - Boolean casting
- toBeFalsy
- toContain
  - Find item in array
- toBeLessThan
- toBeGreaterThan
- toBeCloseTo
 - Precision match comparison
- toThrow
  - Exception testing (any exception)
- toThrowError
  - Accepts message, regular expression, or Exception object
  
Manual fail
-----------

Use `fail` method, which accepts an error message

Good for testing callbacks that should not be reached


Setup and teardown
------------------

Use these functions;

- beforeEach
- afterEach
- beforeAll
- afterAll

```
describe("A spec using beforeEach and afterEach", function() {
  this.foo = 0;

  beforeEach(function() {
    this.foo += 1;
  });

  afterEach(function() {
    this.foo = 0;
  });

  it("should call beforeEach", function() {
    expect(this.foo).toEqual(1);
  });
});
```

Disable / skip
--------------

Add an 'x' before `describe` or `it` functions

Spies
-----

Stubs any function and tracks calls and arguments

```
spyOn(object, 'functionName');
```

Only exists within the `describe` or `it` in which its defined

### Match

- toHaveBeenCalled
- toHaveBeenCalledWith(param1, param2)
  - True if argument list matches any of recorded calls


```
expect(object.functionName).toHaveBeenCalled();
```

Test with arguments;

```
expect(object.functionName).toHaveBeenCalledWith(param1, param2);
```

Will return true if *any* calls match

### callThrough

Keep existing implementation

```
spyOn(object, 'functionName').and.callThrough();
```

### returnValue

Force a simple response

```
spyOn(object, 'functionName').and.returnValue(123);
```

Or an implementation;

```
spyOn(object, 'functionName').and.returnValue(function() {
  return 123;
});
```

### throwError

All calls to spy will throw value as error

```
spyOn(object, 'functionName').and.throwError('example');
```


