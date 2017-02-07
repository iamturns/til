Angular 2 Routing
=================

The application has one `router`. This is bootstrapped with `RouterModule.forRoot()` within app module.

Router uses a *first-match wins* strategy, so define routes from most specific to least specific.
 
- `ActivatedRoute` - service containing route params, data, etc.
  - This changes depending on which component it's injected to
  - If the component is not routed to, then it will only receive that part of the activated route
  - Instead, try the `routerState` property on the router service
- `ActivatedRouteSnapshot`
- `RouterState` - service current state of router, including tree of currently activated routes, and methods to traverse tree
- `RouterStateSnapshot` 
- `Link Parameters Array`
  - Provided to `routerLink` directive, or to `Router.navigate()`
  - 
- `router.navigate(link params, NavigationExtras)`
  - `NavigationExtras`
    - `queryParams`
    - `fragment`
    - `preserveQueryParams: boolean`
    - `preserveFragment: boolean`
- `router.navigateByUrl` - always absolute

Data
----

```
{
  path: 'example',
  component: ExampleComponent,
  data: {
    title: 'This is an example',
  }
}
```

The `data` property is accessible within each activated route.

Links
-----

```
<a routerLink="/crisis-center" routerLinkActive="active">Crisis Center</a>
```

```
[ '/hero', hero.id ] // /hero/1
```

`./` or `no leading slash` = relative to current level
`../` = go up one level in route path

`router.navigate(link params, { relativeTo: this.route })` (where `this.route` is `ActivatedRoute`)




Query params
------------

Not separated by `?` and `&`. Instead, separated by semicolons (Matrix URL notation), eg:

`[ '/heroes', { id: heroId, foo: 'foo' } ]` = `/heroes;id=15;foo=foo`

```
this.route.params.forEach((params: Params) => {
  // ...
});
```
