Angular 2 Routing
=================

The Angular router is a combination of multiple services (ROUTER_PROVIDERS), multiple directives (ROUTER_DIRECTIVES), and a configuration decorator (RouteConfig). We'll import them all together:

```
import { RouteConfig, ROUTER_DIRECTIVES, ROUTER_PROVIDERS } from '@angular/router-deprecated';


directives: [ ROUTER_DIRECTIVES ],
providers: [ ROUTER_PROVIDERS ],


@RouteConfig([
  {
    path: '/example-path',
    name: 'ExamplePath',
    component: ExampleComponent
  }
])
```

And place a `<router-outlet>` tag within the template.

Now, when visiting `/example-path` in the browser, the `ExampleComponent` will be loaded into `<router-outlet>`.

To link to this route;

    <a [routerLink]="['ExamplePath']">Example</a>

It uses an array. @TODO - come back to expand this.

###  Default routes

The `@RouteConfig` also takes `useAsDefault: true` - the route will be displayed when browser URL doesn't match any routes.

### Dynamic routes

```
path: 'detail/:id'
```

To get params;

```javascript
import { RouteParams } from '@angular/router-deprecated';

constructor(private routeParams: RouteParams) {
  this.routeParams.get('id');
}
```

Route parameters are _always_ strings.

### Navigate

```javascript
import { Router } from '@angular/router-deprecated';

constructor(private router: Router) {
  let link = ['Detail', { id: valueGoesHere }];
  this.router.navigate(link);
}
```
