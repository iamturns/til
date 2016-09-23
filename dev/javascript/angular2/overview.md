Angular 2 Overview
=================

Modules
-------

A project should be grouped into features. Meaning, a directory contains related components, styles, templates, services, and tests.

These are usually exported as modules within an `index.ts` file, allowing for easy import. This file is known as a [barrel](https://angular.io/docs/ts/latest/glossary.html#barrel).

Components
----------

Every Angular app has at least one root component. This is named `AppComponent` / `app.component.ts` by convention.

A component is the basic building block of Angular apps. It controls a view through its template.

Set using a `@Component` decorator;

```javascript
import { Component } from '@angular/core';

@Component({
  selector: 'app',
  template: '<h1>My First Angular 2 App</h1>'
})
```

The selector here will look for `<app>`, which would generally live in `index.html`.

The object passed into the `@Component` decorator is known as **metadata**.

Some more component configuration options;
* `templateUrl`
    * Not typically used in Webpack setups
* `directives`
    * Array of components this template requires
* `providers`
    * Array of dependency injection providers

Main / Bootstrap
----------------

By convention, `index.html` will load `main.js`, which will bootstrap the application. This file will load in the `AppComponent`.

```javascript
import { bootstrap }    from '@angular/platform-browser-dynamic';
import { AppComponent } from './app.component';
bootstrap(AppComponent);
```

Notice that `bootstrap` does not live in `@angular/core` package. This is because there are multiple ways to bootstrap the app.

Most apps run in a browser and use `platform-browser-dynamic`. Alternatives include Cordova, NativeScript, or rendering `index.html` on the server (to improve launch performance or for SEO).  

Lifecycle hooks
---------------

Hooks: create, change, destroy.

```
import { OnInit } from '@angular/core';

export class AppComponent implements OnInit {
  ngOnInit() {}
}
```

Change detection
----------------

"By default, Angular 2 does *not* do deep object comparison to detect changes, it only takes into account properties used by the template"

"When using OnPush detectors, then the framework will check an OnPush component when any of its input properties changes, when it fires an event, or when an observable fires an event"
