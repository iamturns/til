RxJS Upgrade
============

From RxJS 4 to 5

A cheatsheet summary of https://github.com/ReactiveX/RxJS/blob/master/MIGRATION.md

* `Observer` is now an interface, and is implemented by `Subscriber`
*  `observer.onNext('value')` => `observer.next('value')`
* `subscription.dispose()` => `subscription.unsubscribe()`
* All subscriptions are composite with `add` and `remove`
* `flatMap` => `mergeMap` (but `flatMap` still works as alias)
* `flatMapFirst` => `exhaustMap`
* `flatMapLatest` => `switchMap`
* `just` => `of`
* `select` => `map`
* `selectConcat` => `concatMap`
* `map(function)` => the same, but
* `map(value)` => `mapTo(value)`
