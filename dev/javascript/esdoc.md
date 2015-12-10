ESDoc
=====

Very similar to JSDoc, read that cheatsheet first

Remember, can be documented on one line: `/** @tag */`



Identifiers
===========

- `ClassName`
- `ClassName#methodOrMemberName`
- `ClassName.staticMethodOrMemberName`
- `functionName`
- `variableName`



Tests
=====

**ONLY SUPPORTS MOCHA**

```
/** @test {MyClass} */
describe('MyClass is super useful class.')
```

```
/** @test {MyClass#sayMyName} */
it('say my name')
```



Tags
====

All
---

```
Description at top. Maybe with a link to {@link Identifier}. Support markdown
@access public|protected|private
```

### More

```
@see http://example.com
@desc not usually required, as first section without tag is used by default
@todo with optional description
@experimental optional description
@deprecated optional description
@ignore
@version 0.0.1
@example
const myExample = true;
@example
const multipleExamples = true;
```

Class
-----

Labels it as a class and gets extends automatically

But if using interface / implements pattern, this is nice;

```
/** @interface */
class MyInterface
```

```
/** @implements {MyInterface} */
class MyClass
```

Methods and functions
---------------------

```
@param {type} paramName optional description
@param {type} paramName - can separate with a dash, looks nicer, normalized in doc output
@return {type} optional description
@throws {Identifier} optional description
```

### More

```
@emits {Identifier} optional description
@listens {Identifier} optional description
@abstract
  This method must be overridden when class extends this one
@override
  If you extend a class and override something, mark it with this tag
```

### Param = object

```
/**
 * @param {Object} param - this is object param
 * @param {number} param.foo - this is property param
 * @param {string} param.bar - this is property param
 */
function myFunc(param)
```

Alternative;

```
/**
 * @param {{foo: number, bar: string}} param - this is object param.
 */
function myFunc(param)
```

### Param = destructuring

```
/**
 * @param {Object} param - this is object param
 * @param {number} param.foo - this is property param
 * @param {string} param.bar - this is property param
 */
function myFunc({foo, bar})
```

Alternative;

```
/**
 * this is object destructuring.
 * @param {{foo: number, bar: string}} param - this is object param.
 */
function myFunc({foo, bar})
```

### Param = function

```
/**
 * @param {function(foo: number, bar: string): boolean} param - this is function param.
 */
function myFunc(param)
```

### Return = object

Use `@property`

```
/**
 * @return {Object} this is description.
 * @property {number} foo this is description.
 * @property {number} bar this is description.
 */
function myFunction()
```

Members and variables
---------------------

```
@type {type}
```

### Type = object

Use `@property`

```
/**
 * @type {Object}
 * @property {number} p.foo
 * @property {string} p.bar
 */
this.p = {foo: 123, bar: "abc"};
```
