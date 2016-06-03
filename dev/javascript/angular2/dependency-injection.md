Angular 2 Dependency injection
==============================

Angular stores all services in the Injector. This is automatically created application-wide during the bootstrap process.

    let exampleService: ExampleService = injector.get(ExampleService);

To tell Angular about a service it must be registered, like in the bootstrap;

    bootstrap(AppComponent, [ ExampleService ]);

This will register the service across the entire application, which is usually _not_ a good idea. Generally, they should be registered in components;

    @Component({
      providers: [ ExampleService ]
    })
    export class ExampleComponent() {}

Services are injected via constructors by the parameter type, eg;

    constructor(exampleServoce: ExampleService);

Services should be marked with the `@Injectable()` decorator.

Optional dependencies
---------------------
 
```javascript
import { Optional } from '@angular/core';

constructor(@Optional() optionalService: ServiceName) {}
```

Providers
---------

If a service does not exist within the Injector, it asks the registered provider for it.

A provider is a recipe for creating the service.

Usually the provider is just the service class itself, but it could be a factory function, or return substitute classes.

When adding a service to the `providers` array, eg;

    providers: [ ExampleService ]
    
It is short-hand for;

    providers: [ new Provider(ExampleService, { useClass: ExampleService }) ]

Other methods include the `provide` function;

    providers: [ provide(ExampleService, { useClass: ExampleService }) ]
    
Or declare in an object literal (to avoid using `provide` function);

    providers: [ { provide: ExampleService, useClass: ExampleService } ]

The first param is a 'token'. It's used as a key for registering and locating the provider.

The second param is the 'provider definition object'. It is the provider itself.

The provider could be a new class;

    providers: [ provide(ExampleService, { useClass: ImprovedExampleService }) ]

### Mock service

    let mockExampleService = {};

    providers: [ provide(ExampleService, { useValue: mockExampleService }) ]

### Aliases

The following will make two instances of `Logger`;

    providers: [
      Logger,
      provide(NewLogger, { useClass: Logger }) ]
    ]

And this will make just one instance of `Logger`;

    providers: [
      Logger,
      provide(NewLogger, { useExisting: Logger })
    ]

### Factory

Useful for configuring services;

    let exampleServiceFactory = (anotherService: AnotherService) => {
      return new ExampleService(anotherService.getSomething());
    }

    providers: [
      provide(ExampleService, {
        useFactory: exampleServiceFactory,
        deps: [ AnotherService ]
      })
    ]

### Strings, functions, objects
 
How do we add the following object to the injector?

```javascript
export interface Config {
  apiEndpoint: string,
  title: string
}

export const CONFIG:Config = {
  apiEndpoint: 'api.example.com',
  title: 'Dependency Injection'
};
```

But we have no class to use for the token;

    provide(WhatGoesHereWeHaveNoClassAvailable, { useValue: CONFIG })

Unfortunately we can't use the interface, as during runtime within the generated JavaScript the interface is not available.

The solution is **OpaqueToken**;

    import { OpaqueToken } from '@angular/core';
    export let APP_CONFIG = new OpaqueToken('app.config');
    provide(APP_CONFIG, { useValue: CONFIG })

    constructor(@Inject(APP_CONFIG) config: Config) {}

Notice we can use the interface as a type within the constructor when injecting.
