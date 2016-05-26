Swagger
=======

Starting point;

```
swagger: '2.0'
info:
  title: Example name here
  version: '1.0.0'
basePath: /v1
produces:
  - application/json
```

Path with params
----------------

```
path: /pet/{petId}
```

Common keys
-----------

- `type` values;
    - string
    - number
    - integer
    - boolean
    - array
    - file
- `format`;
    - Values;
        - int32
        - int64
        - float
        - double
        - byte
        - binary
        - date
        - date-time
        - password
    - Can be any custom string value, eg;
        - email
        - uuid
        - whatever-you-want
- If `type` is 'array'
    - Use `items` key to specify schema
    - Can set `collectionFormat`;
        - csv (default)
            - Comma separated
            - Eg: `foo1, foo2`
        - ssv
            - Space separated
            - Eg: `foo1 foo2`
        - tsv
            - Tab separated
            - Eg: `foo1\tfoo2`
        - pipes
            - Pipe separated
            - Eg: `foo1|foo2`
        - multi
            - For 'query' or 'formData'
            - `foo1=val1&foo2=val2`
- If `type` is 'object'
    - Use `properties` for schema
- Parameters must specify `in`, one of;
    - query
    - header
    - path
    - formData
    - body
- Parameters can specify `required`
    - Default is `false`
    - If `in` is 'path', then this must be `true`
- $ref
    - Eg: `$ref: '#/definitions/DefinitionName'`

Common types + format pairs
---------------------------

- integer
    - type: integer
    - format: int32
- long
    - type: integer
    - format: int64
- float
    - type: number
    - format: float
- double
    - type: number
    - format: double
- string
    - type: string
- boolean
    - type: boolean
- date
    - type: string
    - format: date
- dateTime
    - type: string
    - format: date-time
- password
    - type: string
    - format: password

See list here: http://swagger.io/specification/#dataTypeFormat
