Code documentation
==================

Powered by [ESDoc](https://esdoc.org).

Refer to [commands](../../development/commands.md) to generate code documentation.

Overview
--------

To document code, place a comment block immediately before it, eg:

```
/** This is example documentation for the example function */
function exampleFunction() {}
```

Documentation usually spans over multiple lines and contains several 'documentation tags' with more information, eg:

```
/**
 * This is example documentation for the example function
 * @param {string} exampleParameter
 */
function exampleFunction(exampleParameter) {}
```



Cheatsheet
==========

```
/**
 * Description at top. Can link to other parts of code using {@link Identifier}.
 * Text can span multiple lines. Supports markdown syntax and HTML.
 *
 * @example <caption>Optional example heading</caption>
 * const exampleCodeLine1 = true;
 * const exampleCodeLine2 = true;
 *
 * @example
 * const canYouUseMultipleExampleTags = true;
 */
class Example {

  /**
   * Optional description.
   * @param {type} paramName
   * @param {type} paramName - with an optional description
   * @param {type} [paramName] - this parameter is optional
   * @param {type} [paramName=defaultValue]
   * @param {(type1|type2)} paramName
   * @param {type[]} paramName - an array containing `type`s
   * @param paramName - no type provided, accepts all (*) types
   * @param {...type} paramName - spread param
   * @return {type} - with an optional description
   */
  methodName(paramName) {

    /**
     * Optional description.
     * @type {type}
     */
    this.propertyName = 'example';

  }

  /**
   * Optional description.
   * @type {type}
   */
  get example() {}

  /**
   * Optional description.
   * @type {type}
   */
  set example(value) {}

}
```



Types
=====

- Array
- boolean
- function
- number
- Object
- string
- undefined
- null
- function(funcParam1: type, funcParam2: type): funcReturnType
- {objectPropertyName1: type, objectPropertyName2: type}
- AnyObjectNameYouLike
- NodeList
- HTMLElement



Identifiers
===========

- ClassName
- ClassName#memberName
- ClassName.staticMemberName
- globalFunctionName
- globalVariableName



More tags
=========

These are less common, but sometimes useful;
 
```
/**
 * @throws {identifier} - with an optional description when this is thrown
 *
 * @interface
 * @implements {identifer to class marked with @interface}
 *
 * @abstract
 *     - This method *must* be overriden when sub classing
 * @override
 *     - If you override a method within a sub class, mark it with this tag
 *
 * @emits {identifer} - optional description
 * @listens {identifer} - optional description
 *
 * @protected
 * @private
 *     - Identifiers beginning with an underscore are automatically marked with this
 *
 * @see http://example.com/
 * @version version number
 * @ignore
 * @experimental optional description
 * @deprecated optional description
 */
```

A complete list is available on the [ESDoc website](https://esdoc.org/tags.html).



Documenting object properties
=============================

These can be documented with destructuring syntax as the `{type}`, eg:

```
{{objectPropertyName1: type, objectPropertyName2: type}}
```

This quickly becomes difficult to read and maintain, so prefer to use the longer technique described below.

Parameter
---------

```
@param {Object} objectParamName
@param {type} objectParamName.objectPropertyName1
@param {type} objectParamName.objectPropertyName2
```

Return
------

```
@return {Object}
@property {type} objectPropertyName1
@property {type} objectPropertyName2
```

Member or variable
------------------
  
```
@type {Object}
@property {type} objectPropertyName1
@property {type} objectPropertyName2
```
