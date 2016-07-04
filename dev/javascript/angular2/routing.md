Angular 2 Routing
=================

```javascript
import { ROUTER_DIRECTIVES } from '@angular/router';
```

In a file named `app.routes.ts`;

```javascript
import { provideRouter, RouterConfig } from '@angular/router';

export const routes: RouterConfig = [
  { path: 'crisis-center', component: CrisisCenterComponent },
  { path: 'heroes', component: HeroListComponent },
  { path: 'hero/:id', component: HeroDetailComponent }
];

export const APP_ROUTER_PROVIDERS = [
  provideRouter(routes)
];
```

And import this into the bootstrap / main file. It cannot be done in AppComponent.

```javascript
import { bootstrap }            from '@angular/platform-browser-dynamic';
import { AppComponent }         from './app.component';
import { APP_ROUTER_PROVIDERS } from './app.routes';

bootstrap(AppComponent, [
  APP_ROUTER_PROVIDERS
])
.catch(err => console.error(err));
```

### Navigate in component

```javascript
constructor(private router: Router) {}

onSelect(hero: Hero) {
  this.router.navigate(['/hero', hero.id]);
}
```

### Getting route params

```javascript
constructor(private route: ActivatedRoute) {}

ngOnInit() {
  const id = +this.route.snapshot.params['id'];
  this.service.getHero(id).then(hero => this.hero = hero);
}
```

### Getting route param changes

Imagine a parent component allows the user to visit details of the hero with up and down arrows. So the route changes quickly; `/hero/1`, `/hero/2`, etc.

Instead of destroying and re-creating the component over and over again, it's best to keep the component alive, and listen for the route parameter to change.

```javascript
ngOnInit() {
  this.sub = this.route.params.subscribe(params => {
    const id = +params['id'];
    this.service.getHero(id).then(hero => this.hero = hero);
  });
}

ngOnDestroy() {
  this.sub.unsubscribe();
}
```

### Query params

```javascript
this.router.navigate(['/heroes'], { queryParams: { id: heroId, foo: 'foo' } });
```

And to access them;

```javascript
constructor(private router: Router) {}

ngOnInit() {
  this.sub = this.router
    .routerState
    .queryParams
    .subscribe(params => {
      this.selectedId = +params['id'];
      this.service.getHeroes()
        .then(heroes => this.heroes = heroes);
    });
}

ngOnDestroy() {
  this.sub.unsubscribe();
}
```

### Access current URL

```javascript

constructor(router: Router) {
  const url = router.url;
  // or get UrlTree;
  const tree: UrlTree = router.parseUrl(url);
}
```

Guards
------

- `CanActivate`
    - Eg: check user permissions for access
- `CanDeactivate`
    - Eg: ask permission to discard unsaved changes




Angular 2 Routing (Deprecated)
==============================

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
