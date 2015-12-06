Environment variables
=====================

Setting
-------

### Linux & OS X

`export {{ENVIRONMENT_VARIABLE_NAME}}={{value}}`

### Windows

`set {{ENVIRONMENT_VARIABLE_NAME}}={{value}}`

### Fish

`set -gx {{ENVIRONMENT_VARIABLE_NAME}} {{value}}`

Setting for one command
-----------------------

### Linux & OS X

`{{ENVIRONMENT_VARIABLE_NAME}}={{value}} {{command}}`

### Fish

`env {{ENVIRONMENT_VARIABLE_NAME}}={{value}} {{command}]`

Remove
------

### Linux & OS X

`unset {{ENVIRONMENT_VARIABLE_NAME}}`

### Fish

`set -e {{ENVIRONMENT_VARIABLE_NAME}}`

View
----

### Linux & OS X

`echo ${{ENVIRONMENT_VARIABLE_NAME}}`
