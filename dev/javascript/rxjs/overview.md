RxJS
====

Lodash for events.

"Allows you to specify the dynamic behaviour of a value completely at the time of the declaration"

Terminology
-----------

### Observable

Observables emit items (as a sequence) and notifications (error, complete)

### Observer

Collection of callbacks that knows how to listen to items delivered by the Observable

### Subscription

Represents the execution of an Observable, primarily used for cancelling the execution

### Operators

Pure functions that enable functional progrmaming style of dealing with collections (eg: map, filter, concat, flatMap)

### Subject

An observable and an observer. Equivalent to EventEmitter. Maintains list of observers delivers multicase items to multiple observers.  

### Scheduler

Dispatchers to coordinate when computation happens (eg: setTimeout, requestAnimationFrame)

### Higher-order Observable

An Observable that emits Observables

Creating observables
--------------------

```javascript
const observable = Rx.Observable.create();
```

Usually created with 'creation operators', eg: `of`, `from`, `interval`

Observable are cheap and simple to clone. It does not contain any data.

Subscribing to observables
--------------------------

Provides a callback where data will be delivered to.

It is *not* a pub/sub pattern. The observer is not registered as a listener in the observable. The observable does not know about its observers.

A `subscribe` call is simply a way to start an "Observable execution" and deliver items to the observer.

Executing observables
---------------------

Three types of values can be delivered;

- 'Next' notification: send data to an observer
- 'Error' notification: send a JavaScript Error or exception
- 'Complete' notification: does not send a value

If either an Error or Complete notification is delivered, then nothing else can be delivered afterwards.

```javascript
observer.next(1);
observer.complete();
observer.error(err);
observer.next(2); // not delivered!
```

Disposing observable executions
-------------------------------

```javascript
const subscription = observable.subscribe(x => console.log(x));
subscription.unsubscribe();
```

Once called, observables without other observers can stop generating new items to emit.

Observer
--------

```javascript
observable.subscribe({
  next: x => console.log('Observer got a next value: ' + x),
  error: err => console.error('Observer got an error: ' + err),
  complete: () => console.log('Observer got a complete notification'),
});
```

All three callbacks above are optional.

Multicased observables
----------------------

Uses Subject under the hood to make multiple Observers see the same Observable execution.
  
More info: http://reactivex.io/rxjs/manual/overview.html#multicasted-observables

BehaviourSubject
----------------

Stores its current value, and emits it immediately when an Observer subscribes.

ReplaySubject
-------------

Similar to BehaviourSubject, but can also *record* a part of the Observable execution.

```javascript
const subject = new Rx.ReplaySubject(3); // buffer 3 values for new subscribers
```

Or, with two params: `bufferSize` and `windowTime` in milliseconds.

```javascript
const subject = new Rx.ReplaySubject(100, 500); // 100 item buffer, items only sent  in last 500 ms
```

AsyncSubject
------------

Last value of Observable is sent to Observers when execution completes.

Hot and Cold
------------

Observables are either hot or cold. A plain observable with no subscribers, it will not be triggered. It does not generate new values if no subscriptions exist.

A "cold" observable waits until an observer subscribes to it before emitting items. The observer is guaranteed to see the beginning of the sequence. They replicate themselves for each new observer.

A "hot" observable may begin emitting items as soon as it's created. Any observer who later subscribes may start observing items from the middle. This is typically done with `share()` or `publish()`

Shared observables
------------------

Observables are not shared by default.

```javascript
var obs = Rx.Observable.interval(500).take(5)
            .do(i => console.log("obs value "+ i) )
            .share();

obs.subscribe(value => console.log("observer 1 received " + value));

obs.subscribe(value => console.log("observer 2 received " + value));
```

Using share, the stream is run once, and then the two subscriptions receive a value.

Without a share, the stream is run for each subscription.



Operators
=========

A pure function that creates a new Observable based on the current Observable.

Choose an operator wizard: http://reactivex.io/rxjs/manual/overview.html#choose-an-operator

Decision tree: http://reactivex.io/documentation/operators.html#tree

Here are *most* operators (yes, there are more!)

### Creation

* `from`: Convert almost anything into an Observable
* `fromEvent`: Create observable from DOM events, or Node EventEmitter events
        `const clicks = Rx.Observable.fromEvent(document, 'click');`
* `fromPromise`
* `interval`: Create an observable that emits integers spaced by time interval
        `const numbers = Rx.Observable.interval(1000);`
* `of`: Emit set of values sequentially, and then a complete notification
* `defer`: Create a fresh observable for each observer

### Utility

* `delay(delay: number | Date)`: Delay emission of items by given timeout or until given Date
* `delayWhen(delayDurationSelector: function(value: T): Observable)`: Like delay, but delay duration determined by second Observable
    * Pass in a function with source value as argument, and returns an Observable (the 'duration' Observable)

### Conditional && Boolean

* `defaultIfEmpty(defaultValue: any)`: If the source Observable is empty, then emit a default value
* `every(predicate: function(): boolean): Observable<boolean>`: Returns Observable that emits whether each item satisfies condition 
* `find(predicate: function(value: T, index: number, source: Observable<T>): boolean)`: Find first vlaue that passes a test and emit it
* `findIndex()`: Same as `find`, but emits the index of the found value, not the value itself
* `isEmpty()`: If source is empty it returns an Observabl ethat emits true, ootherwise it emits false

### Mathematical & Aggregate

* `count(predicate: function(value: T, index: number, source: Observable<T>): boolean)`: Count number of emissions and emits that number when source completes
* `max()`: When source completes, emit item with largest number
* `min()`
* `reduce(accumulator: function(acc: R, value: T): R, seed: R)`: JOins new source value into accumulation from the past

### Combination

* `merge(...other: Observable)`
* `mergeAll()`: Flattens an Observable-of-Observables
* `startsWith(values)`: Emits items before it begins to emit items from the source Observable
* `withLatestFrom(...other: Observable, project?: function)`: Whenever source Observable emits a value, it outputs using that value plus the latest from other input variables, then emits result
* `combineLatest(...other: Observable, project?: function)`: Whenever any Observable emits a value, run optional 'project' function, and emit output  
    * Subscribes to each input observable, and collects an array of each most recent values when they emit.
    * This array is run through optional project function, and then returned

        ```javascript
        const weight = Rx.Observable.of(70, 72, 76, 79, 75);
        const height = Rx.Observable.of(1.76, 1.77, 1.78);
        const bmi = weight.combineLatest(height, (w, h) => w / (h * h));
        ```

* `combineAll(project?: function)`: Flattens an Observable-of-Observables
    * Takes Observable of Observables, collects all Observables from it
    * Once the outer Observable completes, all collected Observables are combined using `combineLatest`
* `concat(...other: Observable)`: Concatenate multiple Observables together by sequentially emitting their values, one Observable after the other
* `concatAll()`: Flatten Observable-of-Observables by putting one inner Observable after the other
* `exhaust()`: Same as `mergeAll()`, but ignores every new inner Observable if the previous Observable has not yet completed

### Filtering

* `debounceTime(dueTime: number)`: Like delay, but passes only most recent value from each burst of emissions
* `debounce(durationSelector: function(value: T): Observable | Promise)`: Like debounceTime, but time span of emission silence is determined by a second Observable
* `distinct()`: Emits items emitted by source Observable that are distinct by comparison to previous items
    * Compares with equality check by default, but can pass in a custom comparison function to use
* `distinctKey(key: string)`: Same as `distinct` but uses a key to check if two items are distinct 
* `distinctUntilChanged()`:  Same as `distinct`, but does not keep a registry of the past, just compares to previous
* `distinctUntilKeyChanged(key: string)`: Same as `distinctUntilChanged`, but uses a key to check if two items are distinct
* `elementAt(indexNumber: number, defaultValue?: T)`: Emits only the n-th value, then completes
* `filter(predicate: function(value: T: index: number): boolean)`: Like `Array.prototype.filter()`
* `first(predicate?: function)`: Emits first value, or first value that passes some test
* `ignoreElements()`: Only passes complete or error notifications, does not emit anything
* `throttleTime(duration: number)`: Lets a value pass, then ignores source values for next `duration` milliseconds
* `throttle(durationSelector: function(value: T): Observable)`: Like `throttleTime`, but silencing duration determined by second Observable
* `auditTime(duration: number)`: When it sees a source values, it ignores that plus the next ones for `duration` milliseconds, and then it emits the most recent value from the source 
    * Similar to `throttleTime`, but emits the last value from the silenced window instead of the first
* `audit(durationSelector: function(value: T): Observable)`: Like `auditTime`, but silencing duration determined by second Observable
* `last()`: Emit only last item, optionally by predicate function
* `sampleTime(period: number)`: Samples source at periodic intervals, and emits what it samples
* `sample(notifier: Observable)`: Like `sampleTime`, but samples when `notifier` Observable emits something
* `single(a: function)`: Emits single item that matches predicate function. If source emits more than one, or none, then throws errors.
* `skip(n: number)`: Skip `n` items emitted
* `skipUntil(n: Observable)`: Skip items emitted by source Observable until a second Observable emits an item
* `skipWhile(predicate: function)`: Skips items as long as condition holds true, then emits all further as soon as condition becomes false
* `take(count: number)`: Takes the first `count` values from the source, then compeltes
* `takeLast(count: number)`: Remembers the latest `count` values, then emits those when source completes
* `takeUntil(notifier: Observable)`: Emits values until a second Observable emits something, then completes 
* `takeWhile(predicate: function(value: T, index: number): boolean)`: Takes values from source while condition passes. When first value does not satisfy, completes.

### Transform

* `buffer(notifier: Observable)`: Collect values as array and emit them when another Observable emits

        ```javascript
        const clicks = Rx.Observable.fromEvent(document, 'click');
        const interval = Rx.Observable.interval(1000);
        const buffered = interval.buffer(clicks);
        ```

* `bufferCount(size: number)`: Collect values as array and emit them when its size reaches size 
* `bufferTime(timeSpan: number)`: Collect values as array, and emit them periodically in time in milliseconds
* `concatMap(project: function(value: T): Observable)`: Maps each value to an Observable, then flattens inner Observables using `concatAll` 
* `concatMapTo(innerObservable: Observable)`: Like `concatMap`, but maps each value to the same inner Observable
* `exhaustMap`: Maps each value to an Observable, then flattens inner Observables with `exhaust`
* `map`: Like `Array.prototype.map()`
* `mapTo(value: any)`: Like `map`, but maps every source value to same output every time
* `mergeMap(function(value: T): Observable)`: Maps each value to an Observable, then flattens inner Observables using `mergeAll`
* `mergeMapTo(innerObservable: Observable)`: Like `mergeMap`, but maps each value always to the same inner Observable
* `pairwise()`: Puts the current vlaue and previous value together as an array, and emits that
* `partition(function(v: T, i: number): boolean)`: Outputs an array with two Observables determined by predicate function
* `pluck(...properties: string)`: Like `map`, but picks up one of nested properties from each emitted object
* `scan(acc: function(acc: R, v: T, i: number): R)`: Like `reduce`, but emits accumulation whenever source em its a value
* `switchMap(project: function(v: T, i: number): Observable)`: Maps each value to an Observable, then flattens using `switch`
* `switchMapTo(innerObservable: Observable)`: Like `switchMap`, but maps each value always to same inner Observable
* `window(boundaries: Observable)`: Like `buffer`, but emits a nested Observable instead of an array
* `windowCount(size: number)`: Like `bufferCount`, but emits nested Observable instead of an array
* `windowTime(span: number)`: Like `bufferTime`, but emits nested Observable instead of an array
