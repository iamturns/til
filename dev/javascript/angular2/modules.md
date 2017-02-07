Angular 2 Modules
=================

A module consolidates components, directives, and pipes. A cohesive block of functionality & features.

ngModule data:

- declare components, directives, and pipes that _belong_ to the module
- make some of the above public so other component templates can use them
- import components, directives, and pipes from other components needed by components in this module
- provide services at the app level that any app component can use

```
@NgModule({
  imports: [ ModuleName ], // Import modules exported declarations
  declarations: [ Component, Directive, Pipe ], // Must be declared in ONE module of the app. Declare them here if they belong to this module.
  exports: [ ModuleName, Component, Directive, Pipe ], // Mark as public to be imported by other modules
  providers: [ ServiceName ], // Registered with app *root injector*
})
```

Root module / App module
------------------------

Every app requires at least one module, and this is it!

Used as bootstrap to launch the app.

It must import the `BrowserModule` (from '@angular/platform-browser') for a browser app. This registers critical app service providers, and directives like `NgIf`and `NgFor`.

It also adds a `bootstrap` key to `@NgModule`, eg: `bootstrap: [ AppComponent ]`. When angular launches the app, it embeds the component within source HTML file (eg: `index.html`) ,

Its job is to orchestrate the app as a whole.

Feature modules
---------------

As the app grows, the root module breaks into _feature modules_, and these are imported into the root module.

Services in one module are available to all.

Same as root module, but replace `BrowserModule` with `CommonModule`.

Application-scoped providers
----------------------------

@TODO

```
We might expect Angular to offer a module-scoping mechanism to enforce this design. It doesn't. Angular module instances, unlike components, do not have their own injectors so they can't have their own provider scopes.

This omission is intentional. Angular modules are designed primarily to extend an application, to enrich the entire app with the module's capabilities.

Service scoping is rarely a problem in practice. Non-contact components can't inject the ContactService by accident. To inject ContactService, you must first import its type. Only Contact components should import the ContactService type.
```

Lazy Loading
------------

App module imports `AppRoutingModule`. It does not import lazy loaded modules.

`AppRoutingModule` / `app-routing.module`.  

Lazy loaded route syntax: `{ path: 'crisis', loadChildren: 'app/crisis/crisis.module#CrisisModule' }`

```
imports: [RouterModule.forRoot(routes)],
exports: [RouterModule]
```

Lazy loaded feature modules do not need to `export` anything; they are accessed when routed to.

### Providers

Providers of lazy loaded modules are *module-scoped**.

When Angular router lazy-loads a module, it creates a new execution context, which includes its own injector. This injector is a direct child of the application injector. If the lazy loaded module provides its own services, those instances will override any inherited by the application injector.

Shared module
-------------

`SharedModule` holds common components, directives, and pipes to share them with modules that need them.

Feature modules import this shared module.

This will export things within `/app/shared/`, and also re-exports other modules such as `CommonModule`, `FormsModule`, etc.

Do not specify app-wide singleton providers here. Otherwise, a lazy loaded module that imports the shared module will make its own copy of the service.




Core module
-----------

Contains single-use components that only appear in the `AppComponent` template. Eg: layout structure, toaster message, modal dialog

Also contains single services (eg: `UserService`) that must be registered _exactly once_ when the application starts.

Remove clutter from root module.

Core module is imported only once when the app starts, and never imported anywhere else.

CoreModule.forRoot
------------------

Offers ability to configure providers.

Within a service:

```
constructor(@Optional() config: ExampleConfig) {}
```

Modules specify a static function:

```
static forRoot(config: ExampleConfig): ModuleWithProviders {
  return {
    ngModule: CoreModule, // the `CoreModule` class
    providers: [
      {provide: ExampleConfig, useValue: config},
    ],
  };
}
```

Which is called within the root app module:

```
imports: [
  CoreModule.forRoot({ exampleConfig })
]
```

Note: Only call `forRoot` in the root app module.

Entry components
----------------

A component that Angular loads *imperatively*, eg:

- Bootstrapped root `AppComponent`
- Components in route definitions
  - The router ignores the component's selector and loads it into `RouterOutlet`

Most components are loaded *declaratively* via its selector, and are *not* entry components.

Helps with tree shaking. Code and libraries can declare and export components that are never used. Tree shaking will drop these if they are not referenced.

Misc
----

- You can list modules under `exports` without placing them within `imports`
- Angular accumulates all imported providers before appending items listed in `providers`. This sequence ensures whatever is added in `AppModule` takes precedence.
- Don't bother re-exporting modules that do not export anything. Eg: `HttpModule` only adds http service providers to app.
- If two modules provide the same service, the second module provider wins. And `AppModule` always wins.
