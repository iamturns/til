JSDoc
=====

JSDoc is based on Java. It's quite slow and clunky and the documentation isn't great.

But - it's VERY popular!

I'm going to try ESDoc, which has very similar JSDoc syntax anyway: https://esdoc.org/tags.html

It reads ES6 (no need to add @class or @extends etc), comes with coverage report, free hosting, gulp plugin 

Example
-------

```
/**
 * Optional description
 * @param paramName
 * @param {type} paramName
 * @param {type} paramName and a description
 * @param {type} [paramName] this parameter is optional
 * @param {type} [paramName=defaultValue]
 * @param {(type1|type2)} paramName
 * @param {type[]} paramName an array of `type`
 * @param {?type} paramName can be null
 * @returns {type}
 */
```

Types
-----

- boolean
- number
- string
- undefined
- null
- ObjectName
- Array
- NodeList
- HTMLElement[]

More
-----

```
/**
 * @type {string}
 */
this.make = make;
```

```
/**
 * @default "Untitled"
 */
 this.title = title || "Untitled";
```
 
```
 /**
  * @class
  * @property {string} name The name of the person.
  */
 function Person(name) {
     this.name = name;
 }
```
 
THIS IS THE SAME AS:
 
```
 /**
  * @class
  */
 function Person(name) {
     /**
      * The name of the person.
      * @type {string}
      */
     this.name = name;
 }
 ```
 
 ```
 @throws {identifier} description of when it is thrown
 ```
 
 ES6
 ---
 
 ```
 /**
  * Actor class.
  * @class Actor
  */
 class Actor {
 
      /**
       * Actor constructor.
       * @constructs Actor
       */
      constructor() {
      
         /**
           * The actor's name.
           * @member Actor#name
           */
          this.name = "leo";

```
