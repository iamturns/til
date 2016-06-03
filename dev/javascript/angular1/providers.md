AngularJS Providers
===================

Phases
------

Angular has two main phases; the 'config' and the 'run phase.

Can be injected in config phase;
- Providers
- Constants
- Services in the `AUTO` module (`$provide` and `$injector`)

$provide service
----------------

The `$provide` service tells Angular how to create new services. Services are always defined by providers.

This is done using the `provider` method on `$provide`;

```
$provide.provider('example', function() {
  this.$get = function() {
    return service;
  };
});
```

And this is placed within a config block;

```
module.config(function($provide) {});
```

Now we can inject a variable named 'example' into any injectable function (eg: controllers), then Angular will call the provider `$get` function to return a new instance of the service.

Factory, service, value, etc are shortcuts to the above provider. They are syntactic sugar around providers.

### Value
 
Very simple
 
```
app.value('key', value);
```

Values cannot have things injected inside them.

### Constant

Same as above, but can be accessed during the 'config' phase

### Factory

- A factory can use other services / has dependencies
- Initialization code
- Delayed / lazy initialization

### Service

The same as a factory, but is instantiated with the 'new' operated when created

$injector service
-----------------

Its job is to create instances of services using code provided in `$provide`

It does this within a single `$injector` service
 
Use the `get` method to get a service;

```
const exampleService = $injector.get('example');
```

It will create the instance once, and then cache it.



Creating a provider
===================

This examples assumes you already have a service named `ExampleNameService` within `exampleName.service.js`, and you wish to create a provider for it.

Step 1 - Create the provider file
---------------------------------

Create this file within the same directory: `exampleName.service.provider.js`

The name of the provider should match the service, with the suffix of 'Provider', eg: `ExampleNameServiceProvider`

### Example

```
import { ExampleNameService } from 'exampleName.service.js';

export class ExampleNameServiceProvider {

  constructor(injectAnotherProvider) {
    'ngInject';
    this.exampleSetting = 'default value'; 
  }

  setExampleSetting(exampleSetting) {
    this.exampleSetting = exampleSetting;
  }

  $get(injectAnotherService) {
    'ngInject';
    return new ExampleNameService(injectAnotherService, this.exampleSetting);
  }

}
```

Step 2 - Adjust the service
---------------------------

Adjust the constructor of the service to accept additional settings provided by the provider.

Also remove the `ngInject` string from the service constructor, as they have already been injected within the provider.

### Example

```
class ExampleNameService {
  constructor(injectAnotherService, exampleSetting) {
    this.exampleSetting = exampleSetting;
  }
}
```

Step 3 - Add the provider to Angular
------------------------------------

The Angular name should not contain the 'Provider' suffix.

Do not add the service to Angular. The service is now provided by the provider.

### Example

```
import { ExampleNameServiceProvider } from 'exampleName.service.provider.js';

.provider('ExampleNameService', ExampleNameServiceProvider)
```



Example usage
=============

Provider
--------

```
function exampleConfig(ExampleNameServiceProvider) {
  'ngInject';
  ExampleNameServiceProvider.setExampleSetting('new value');
}
```

Service
-------

```
class ExampleController {
  controller(ExampleNameService) {
    'ngInject';
    console.log(ExampleNameService.exampleSetting); // 'new value'
  }
}
```
