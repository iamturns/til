Swagger
=======

This is a cheatsheet summarising some of the [Swagger specification](http://swagger.io/specification/).

Considerations:

- Not *everything* is documented
- Assumes YAML format
- Assumes a RESTful JSON API

Root Document
-------------

### Common

```
swagger: '2.0'
info:
  title: API Name
  version: '1.0.0'
schemes:
  - http
  - https
consumes:
  - application/json
produces:
  - application/json
paths:
  /example-path:
    get | put | post | delete | options | head | patch: `Operation Object`
  /example-path/{exampleQueryParam}:
    get | put | post | delete | options | head | patch: `Operation Object`
```

### Tags

```
tags:
  - name: TagName1
    description: Optional description.
```

### Reuse

```
definitions:
  # Store `Schema Object` for re-use
  # Referenced elsewhere with `$ref: '#/definitions/ExampleObjectName'`
  ExampleObjectName1: `Schema Object`
parameters:
  # Store `Parameter Object` for re-use
  # Referenced elsewhere with `$ref: '#/parameters/example-param-name'`
  example-param-name-1: `Parameter Object`
responses:
  # Store `Response Object` for re-use
  # Referenced elsewhere `$ref: '#/responses/ExampleResponseName'`
  ExampleResponseName1: `Response Object`
```

### Security

```
securityDefinitions: `Security Definitions Object`
security: `Security Requirement Object`
  # Global security
  # Logical OR between security requirements
  # Individual operations can override
```

Operation Object
----------------

```
parameters:
  - `Parameter Object`
  - `Parameter Object`
  - $ref: '#/parameters/example-param-name'
    # Reference to a `Parameter Object` stored in `parameters` in `Root Document`
responses:
  'HTTP Status Code':
    `Response Object`
  '200':
    $ref: '#/responses/ExampleResponseName'
      # Reference to a `Response Object` stored in `responses` in `Root Document`
  default:
    `Response Object`
```

### Additional

```
summary: Short summary. Less than 120 characters.
description: |
  Verbose explanation.
  Can span multiple lines.
tags:
  - TagName1
security: `Security Requirement Object`
  # Logical OR between security requirements
  # Overrides `security` in `Root Document`
```

Parameter Object
----------------

```
name: exampleParameterName
in: query | header | path | formData | body
  # `query`: /example?eg
  # `path`: /example/{eg}
  # `body`: Request payload
    # Can only be *one* parameter per path marked as `body`
    # The `name` has no effect (documentation purposes only)
    # Requires `schema` property
description: Optional description.
required: true
  # Optional, defaults to `false`
  # Unless `in` is `path`, then `required: true` MUST be set
`Items Object`
  # Merged in at this level
  # IMPORTANT: `type` can also be `object`
  #
  # Cheatsheet:
    # type: string | integer | number | boolean | array | object
    # format: date | date-time | email | password | uuid | whatever-you-want
    #
    # If `type` is `array`
      # items: `Items Object`
      # collectionFormat: csv | ssv | tsv | pipes | multi
```

### Body

If `in` is `body`

```
schema: `Schema Object`
```

### Additional

```
allowEmptyValue: true
  # Optional, defaults to `false`
  # Only valid when `in` is `query` or `formData`
```

Response Object
---------------

```
description: Optional description.
schema: `Schema Object`
headers:
  example-header-name-1:
    - description: Optional description.
      `Items Object`
        # Merged in at this level
        #
        # Cheatsheet:
          # type: string | integer | number | boolean | array | object
          # format: date | date-time | email | password | uuid | whatever-you-want
          #
          # If `type` is `array`
            # items: `Items Object`
            # collectionFormat: csv | ssv | tsv | pipes | multi
```

Items Object
------------

```
type: string | integer | number | boolean | array
format: date | date-time | email | password | uuid | whatever-you-want
  # Optional
  # Note: value can be ANTHING!
  # More common formats: int32, int64, float, double, byte, binary, hostname, ipv4, ipv6, uri 
```

### Arrays

If `type` is `array`

```
items: `Items Object`
collectionFormat: csv | ssv | tsv | pipes | multi
  # Optional
  # `csv`: `eg1, eg2` (default)
  # `ssv`: `eg1 eg2`
  # `tsv`: `eg1\teg2`
  # `pipes`: `eg1|eg2`
  # `multi`: `eg=eg1&eg=eg2`
    # Only valid when `in` is `query` or `formData`
```

### Additional

```
default: anything
maximum: number
exclusiveMaximum: boolean
minimum: number
exclusiveMinimum: boolean
maxLength: integer
minLength: integer
enum:
  - eg1
```

Schema Object
-------------

```
`Items Object`
  # Merged in at this level
  #
  # Cheatsheet:
    # type: string | integer | number | boolean | array | object
    # format: date | date-time | email | password | uuid | whatever-you-want
    #
    # If `type` is `array`
      # items: `Items Object`
      # collectionFormat: csv | ssv | tsv | pipes | multi

$ref: '#/definitions/ExampleObjectName1'
  # Optional
  # Reference to a `Schema Object` stored in `definitions` in `Root Document`
properties:
  # Optional, used if `type` is `object`
  - examplePropertyKey1: `Schema Object`
additionalProperties:
  # Optional, used if `type` is `object`
  # Constrains additional / custom properties
  # Set to `{}` to disable
required:
  # Optional, used if `type` is `object`
  # Specify list of required keys
  - examplePropertyKey1
allOf:
  # Allows to validate against multiple `Schema Object`s
  # Note: this is an advanced technique
```

Security Definitions Object
--------------------------

### 1. Basic auth

```
securityDefinitions:
  uniqueName:
    type: basic
    description: Optional description.
```

### 2. API key

```
securityDefinitions:
  uniqueName:
    type: apiKey
    description: Optional description.
    name: param-name
    in: query | header
```

### 3. OAuth2

```
securityDefinitions:
  uniqueName:
    type: oauth2
    description: Optional description.
    flow: implicit | password | application | accessCode
    authorizationUrl: string
      # Reqiured if `flow` is `implicit`, or `accessCode`
    tokenUrl: string
      # Required if `flow` is `password`, `application`, or `accessCode`
    scopes:
      example-scope-name-1: Description of scope.
```

Security Requirement Object
---------------------------

```
security:
  # If security definition `type` is NOT `oauth2`, set to `[]`
  - securityDefinitionUniqueName: []
  # If security definition `type` is `oauth2`, provide list of scope names
  - securityDefinitionUniqueName:
    - example-scope-name-1
```



Examples
========

OAuth2 simple example
---------------------

```
securityDefinitions:
  oauth:
    type: oauth2
    flow: implicit
    authorizationUrl: https://example.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=token
    scopes:
      basic: Grants read access to all user data (granted by default).
security:
  - oauth:
    - basic
```

OAuth2 advanced example
-----------------------

```
securityDefinitions:
  oauth:
    type: oauth2
    flow: implicit
    authorizationUrl: https://example.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=token
    scopes:
      basic: Grants read access to all user data (granted by default).
      comments: Grants read/write access to comments. 
  key:
    type: apiKey
    in: query
    name: access_token
security:
  - oauth:
    - basic
    - comments
  - key: []
```
