TypeScript
==========

This assumes ES2015 knowledge.



Basics
======

```javacript
// NUMBER
var count: number;

// BOOLEAN
var isDone: boolean = false;

// ANY
// Bypass type check 
var anyObject: any;

// UNION
// For multiple types
var twoInOne: number | boolean;
```



Array
=====

```javascript
var list: number[] = [1, 2, 3];
// same as above, alternate style;
var list: Array<number> = [1, 2, 3];
```



Tuple
=====

An array with a fixed number of elements;

```javascript
var location: [number, number];
```



Enum
====

Friendly names to numeric values. A simple map.

```javascript
enum Colour {Black, Green, Blue};

var myFavouriteColour: Colour = Colour.Blue;
console.log(myFavouriteColour); // 2

var colourName: string = Colour[myFavouriteColor];
console.log(colourName);
```



Functions
=========

```javascript
function exampleFunctionName(paramName: paramType): returnType {}
```

To declare a variable that holds a specific type of function;

```javascript
let exampleFunctionName: (paramName: paramType) => returnType;
```

The above code ain't great. This is better solved with interfaces (more later);

```javascript
interface ExampleFunctionInterface {
  (paramName: paramType): returnType;
}
let exampleFunctionName: ExampleFunctionInterface;
```

Void
----

Functions that don't return anything should use the `void` type, which represents `undefined` or `null`;
 
```javascript
function example(): void {}
```

Optional parameters
-------------------

```javascript
function example(requiredParam: string, optionalParam?: number) {}
```



Assertions
==========

TypeScript is good at guessing the type of things, but sometimes it doesn't.

Similar to converting / casting to a different type, but without any checking or restructuring data.

Two styles;

Style number 1;

```javascript
const notSure: any = "this could be anything";
const stringLength: number = (<string>notSure).length;
```

Note: This style does not work with JSX.

Style number 2;

```javascript
const notSure: any = "this could be anything";
const stringLength: number = (notSure as string).length;
```

Setting an object type;

```javascript
let square = <Square>{};
```



Destructuring
=============

```javascript
const [x, y] = [10, 50];
console.log(x); // 10
console.log(y); // 50
```

As parameters in a function;

```javascript
function processColour([r, g, b]: [number, number, number]) {
  console.log(r);
  console.log(g);
  console.log(g); 
}
```

```typescript
example(
  param1: string,
  {
    option1 = false,
    option2 = 'default',
  }: {
    option1?: boolean;
    option2?: string;
  } = {}
)
```

Some fancy examples;

```javascript
let [first] = [1, 2, 3, 4];
let [first, ...rest] = [1, 2, 3, 4];
let [, second, , fourth] = [1, 2, 3, 4];
```

With objects and types;

```javascript
let {a, b}: {a: string, b: number} = { a: "baz", b: 100 }
```



Objects
=======

```javascript
var exampleObject = {
  propertyName: propertyType
} = {
  propertyName: propertyValue
};
```

Or with assertions;

```javascript
var exampleObject = {
  propertyName: <propertyType> propertyValue
};

var exampleObject = {
  propertyName: propertyValue as propertyType
};
```



Promises
========

```javascript
return new Promise<type>(resolve => resolve('resolve must match type'));
```

`<type>` is for the resoled value. Rejections are hardcoded to `any`.



Interface
=========

```javascript
interface Person {
  firstName: string;
  lastName: string;
}

function sayHello(somebody: Person) {}
```

Optional properties and functions;

```javascript
interface ExampleConfig {
  foo?: string;
  bar?: number;
  exampleFunc: (paramName: paramType) => void;
  exampleFuncSimple: () => void;
}
```

Indexable types. Key supports either `number` or `string`.

```javascript
interface StringArray {
  [index: number]: string;
}

let myStringArray: StringArray;
myStringArray = [ 'Bob', 'Fred' ];
```

A class can implement an interface;

```javascript
class Example implements ExampleInterface {}
```

An interface describing one function;

```javascript
interface ExampleFunc {
  (param1: string, param2: number): boolean;
}

let myExampleFunc: ExampleFunc;

myExampleFunc = function(paramNameDoesNotHaveToMatch: string, onlyTheTypesMustMatch: number) {
  // return a boolean
}
```

An object / class with a named function;

```javascript
interface ExampleClassInterface {
  exampleFunctionName(param: number);
}

class ExampleClass extends ExampleClassInterface {
  exampleFunctionName(param: number) {
    // ...  
  }
}
```

Interfaces can extend 1 or more interfaces;

```javascript
interface ExampleInterface1 extends ExampleInterface2;
interface ExampleInterface1 extends ExampleInterface2, ExampleInterface3;
```



Class
=====

Property shorthand
------------------

Instead of;

```javascript
class Student {
  name: string;
  constructor(name: string) {
    this.name = name;
  }
}
```

Can do;

```javascript
class Student {
  constructor(public name: string) {}
}
```

Public, private, and protected modifiers
----------------------------------------

Private members can only be accessed by the class.

Protected members can only be accessed by the class, and any class extending the class.

```javascript
class Student {
  constructor(private name: string) {}
}
```

These modifiers can be applied to members, not just parameters. Each member is public by default.

```javascript
class Student {
  fullName: string;
  private secretName: string;
  constructor(public firstName, public lastName) {
    this.fullName = firstName + ' ' + lastName;
    this.secretName = this.fullName + ' shhhh';
  }
}
```

Getters and setters
-------------------

```javascript
class Employee {
  private _fullName: string;

  get fullName(): string {
    return this._fullName;
  }

  set fullName(newName: string) {
    this._fullName = newName;
  }
}
```

Abstract support
----------------

Abstract classes can not be instantiated, but can be extended.

Abstract methods must be implemented.

```javascript
abstract class ExampleAbstractClass {
  abstract exampleAbstractMethod(): void;
}
```



Definition / declaration files
==============================

Provide type information for third party javascript code that is not in TypeScript. These libraries are known as 'ambient modules'.

File extension: `.d.ts`.

Provides benefits of type checking, autocompletion, and documentation for all libraries.

Can be provided via npm modules as an item in `package.json`.

Declare
-------

The `declare` keyword is used to declare ambient module API.

If you need to access an ambient declaration, a reference comment must be added to the top of the file;

    /// <reference path="example" />

Typings
-------

[Typings](https://github.com/typings/typings) is a package manager for finding and downloading type definitions.

Uses a file named `typings.json` which stores ambient modules, and the source of the definition file.

This source can be from a Typings Registry (eg: [DefinitelyTyped]((https://github.com/DefinitelyTyped/DefinitelyTyped)), GitHub, NPM, Bower, HTTP, and local files.

After running `typings install`, an `index.d.ts` file will be created within `/typings` directory. This file stores all the "triple-slash" reference tags.

The file `/typings/index.d.ts` is then pulled into the `files` array inside `tsconfig.json`.



Generics
========

For code that works with multiple types at once.

Imagine a function that returns what is passed in. What type do you set?

```javascript
function returnMe(param: any): any {
  return param;
}
```

This works, but isn't very specific.

We can dynamically capture the type of parameter, and then use it as a placeholder.

It is common to use `<T>` meaning 'Type', but it could be anything.

```javascript
function returnMe<T>(param: T): T {
  return param;
}
```

Now, if passing in a type of 'number', it will be captured into `T`, and the param type and return type will be set to `string`.
 
```javascript
let compilerKnowsThisIsAString = returnMe("this is a string");
```

Can be explicit if needed;

```javascript
let compilerKnowsThisIsAString = returnMe<string>("this is a string"); 
```

Generic interface
-----------------

### On interface function

```javascript
interface ExampleGenericInterface {
  <T>(param: T): T;
}
```

### On interface itself

```javascript
interface ExampleGenericInterface<T> {
  (param: T): T;
}
```

When using the interface, need to specify the type;

```javascript
let example: ExampleGenericInterface<number>;
```

### On class

```javascript
class ExampleClass<T> {
  add: (x: T, y: T) => T;
}

let example = new ExampleClass<number>();
```

Constraints
-----------

Because `<T>` can be anything, the compiler may throw errors when using `.title` or `.length` or whatever it may be. You are limited to properties that must exist on _anything_.

This is solved by extending an interface;

```javascript
class ExampleClass<T extends Interface> {}
```



Decorators
==========

Declaration attached to class, method, accessor, property, or parameter.

To invoke;

    @exampleDecorator thingToDecorate
    
Or on multiple lines;

    @exampleDecorator
    thingToDecorate

And the decorator;

    function exampleDecorator(target) {
      // do something with target
    }

Factories
---------

Allows decorator behaviour to be tweaked;
 
    function exampleDecorator(configParam: boolean) {
      return function(target) {
        // do something with target, and configParam  
      }
    }

Multiple decorators
-------------------

Single line;

    @exampleDecorator1 @exampleDecorator2 thingToDecorate

Multiple lines;

    @exampleDecorator1
    @exampleDecorator2
    thingToDecorate
    
The order is strange;

    function exampleDecorator() {
      // Run top to bottom (1, 2)
      return function(target) {
        // Run bottom to top (2, 1)
      }
    }

Order of decorators
-------------------

1. Parameters
2. Methods
3. Accessors
4. Properties
5. Parameters for constructor
6. Class



Mixins
======

```javascript
class ExampleClass implements ExampleMixin, ExampleMixin2 {}
```

The `implements` treats the classes as interfaces, so only the types (and not the implementation) is used.

Unfortunately, all properties and types must be manually added to the class to satisfy the compiler.

```javascript
class ExampleMixin {
  exampleFunction() {
    return true;
  }
}


class ExampleClass implements ExampleMixin {
  exampleFunction: () => boolean;
}
```

The mixins also need to be manually applied;

```
applyMixins(ExampleClass, [ExampleMixin1, ExampleMixin2]);

function applyMixins(derivedCtor: any, baseCtors: any[]) {
    baseCtors.forEach(baseCtor => {
        Object.getOwnPropertyNames(baseCtor.prototype).forEach(name => {
            derivedCtor.prototype[name] = baseCtor.prototype[name];
        });
    });
}
```
