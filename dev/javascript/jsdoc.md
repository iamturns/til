# JSDoc

```javascript
/**
 * Description at top.
 * Can span multiple lines.
 * Supports <srong>HTML</strong> and **markdown (with plugin)**

 * @example
 * const exampleCodeLine1 = true;
 * const exampleCodeLine2 = true;
 *
 * @example <caption>Optional example heading</caption>
 * const canYouUseMultipleExampleTags = true;
 *
 * @param {type} paramName
 * @param {type} paramName - With an optional description.
 * Parameter description can support multiple lines.
 * Supports <strong>HTML</strong>, _markdown (with plugin)_, and {@link Identifier}.
 * @param {type} [paramName] - this parameter is optional
 * @param {type} [paramName=Default Value]
 * @param {(type1|type2)} paramName
 * @param {type[]} paramName - an array containing `type`s
 * @param {Array.<type>} paramName - same as above
 * @param {...type} paramName - Repeatable
 * @param {?type} paramName - can be null
 *
 * @param {Object} paramName - An object with params
 * @param {type} paramName.prop1 - Optional description
 * @param {type} paramName.prop2 - Optional description
 *
 * @param {Object[]} paramName - An array of objects with params
 * @param {type} paramName[].prop1 - Optional description
 * @param {type} paramName[].prop2 - Optional description
 */
function example(paramName) {}

/**
 * @type {type}
 */
const TYPE_EXAMPLE = 1;

// # CUSTOM TYPES

/**
 * Use {ExampleTypeDef} as {type}
 * @typedef {Object} ExampleTypeDef
 * @property {string} title - The title
 * @property {string} artist - The artist
 * @property {number} year - The year
 */

/**
 * Use {ParentName~exampleCallback} as {type}
 * @callback ParentName~exampleCallback
 * @param {number} responseCode
 * @param {string} responseMessage
 */

// # MORE (UNCOMMON)

/**
 * You can place a {@link Identifier} anywhere
 * @throws {Identifier} optional description
 * @see {@link Identifier} optional additional text
 * @private
 * @protected
 * @deprecated
 * @readonly
 * @todo text
 */
function more() {}

/**
 * @enum {number}
 * @readonly
 */
const EXAMPLE_ENUM = {
  TRUE: 1,
  FALSE: -1,
  /** @type {boolean} */
  MAYBE: true
};
```

## Types

- \*
- string
- boolean
- number
- Object
- CustomName - Defined with @typedef, @callback, or @name

## Identifiers

- ClassName
- ClassName#memberName
- ClassName.staticMemberName
- functionName
- variableName
- Free form text (eg: a link)
