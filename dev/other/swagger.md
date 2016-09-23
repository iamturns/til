Swagger
=======

Starting point;

```
swagger: '2.0'
info:
  title: Example name here
  version: '1.0.0'
basePath: /v1
consumes:
  - application/json
produces:
  - application/json
paths:
  /example-path:
    get | put | post | delete | options | head | patch:
      `Operation Object`
  /example-path/{exampleQueryParam}:
    get | put | post | delete | options | head | patch:
          `Operation Object`
parameters:
  # Global parameters
  # @TODO
securityDefinitions:
  # Global security scheme definitions
  # @TODO
security:
  # Global security
  # @TODO
```

Operation Object
----------------

```
tags:
  - One
  - Two
summary: Short summary. Less than 120 characters.
description: |
  Verbose explanation.
  Can span multiple lines.
parameters:
  - Param 1 (`Parameter Object`)
  - Param 2 (`Parameter Object`)
  - Param 3 (`Parameter Object`)
responses:
  'HTTP Status Code':
    `Response Object`
  '200':
    `Response Object`
  default:
    `Response Object`
```

Parameter Object
----------------

```
name: exampleParameterName
in: query | header | path | formData | body
  # `query`: /example?eg=###
  # `path`: /example/{eg}
  # `body`: Request payload
    # Can only be *one* parameter with this
    # The `name` has no effect (documentation purposes only)
    # Requires `schema` property
description: Optional description
required: true
  # Optional, defaults to `false`
  # Unless `in` is `path`, then `required: true` MUST be set
allowEmptyValue: true
  # Optional, defaults to `false`
  # Only valid when `in` is `query` or `formData`
schema:
  # Required if `in` is `body`
  # See 'Schema Object'
# Note: The remaining properties are listed for quick reference
  # ALL of 'Items Object' below is available (and contains more documentation)
type: string | integer | number | boolean | array | object
format: date | date-time | email | password | uuid | whatever-you-want
schema: See 'Schema Object'. Required if `in` is `body`.
items: Nested 'Items Object'. Required if `type` is `array`.
collectionFormat: csv | ssv | tsv | pipes | multi
default: anything
```

Response Object
---------------

@TODO

description
schema
headers
examples



Items Object
------------

```
type: string | integer | number | boolean | array
format: date | date-time | email | password | uuid | whatever-you-want
  # Optional
  # Note: value can be ANTHING!
  # More common formats: int32, int64, float, double, byte, binary, hostname, ipv4, ipv6, uri 
items:
  # Required if `type` is `array`
  # Value is another 'Items Object'
collectionFormat: csv | ssv | tsv | pipes | multi
  # Optional, only valid when `type` is `array`
  # `csv`: `eg1, eg2` (default)
  # `ssv`: `eg1 eg2`
  # `tsv`: `eg1\teg2`
  # `pipes`: `eg1|eg2`
  # `multi`: `eg=eg1&eg=eg2`
    # Only valid when `in` is `query` or `formData`
default: anything
maximum: number
exclusiveMaximum: boolean
minimum: number
exclusiveMinimum: boolean
maxLength: integer
minLength: integer
enum:
  - one
  - two
```

Schema Object
-------------

Uses all of 'Items Object' above.

Importantly, `type` can also be `object`.

```
$ref: '#/definitions/DefinitionName'
  # Optional
  # Reference to a 'Schema object' defined in `definitions`
properties:
  # Optional
  # Used only if `type` is `object`
  - examplePropertyKey:
    # Value is another 'Schema Object'
additionalProperties:
  # Optional
  # Used only if `type` is `object`
  # Constrains additional / custom properties
  # Set to `{}` to disable
required:
  # Optional
  # Used only if `type` is `object`
  # Specify list of required keys
  - propertyKey1
  - propertyKey2
allOf:
  # Allows to validate against multiple Schema Objects
  # This is an advanced technique
```

-------------

http://swagger.io/specification/

