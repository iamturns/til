# Environment variables

## View

* Bash

		echo ${{ENVIRONMENT_VARIABLE_NAME}}

## Set globally

* Bash

		export {{ENVIRONMENT_VARIABLE_NAME}}={{value}}

* Fish

		set -gx {{ENVIRONMENT_VARIABLE_NAME}} {{value}}

* Windows

		set {{ENVIRONMENT_VARIABLE_NAME}}={{value}}

## Set for one command

* Bash

		{{ENVIRONMENT_VARIABLE_NAME}}={{value}} {{command}}

* Fish

		env {{ENVIRONMENT_VARIABLE_NAME}}={{value}} {{command}]

## Remove

* Bash

		unset {{ENVIRONMENT_VARIABLE_NAME}}

* Fish

		set -e {{ENVIRONMENT_VARIABLE_NAME}}
