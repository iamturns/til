RxJS tricks
===========

The below will fire the inner code when a subscription is made

```javascript
import { Observable } from 'rxjs/Observable';
import { Subscriber } from 'rxjs/Subscriber';

const obs = new Observable((subscriber: Subscriber<Response>) => {
  // get Observable from somewhere else
  .subscribe(
    (response: Response) => this.responseToSubscriber(response, subscriber),
    (response: Response) => this.responseToSubscriber(response, subscriber)
  );
}) as Observable<Response>;

private responseToSubscriber(response: Response, subscriber: Subscriber<Response>) {
  // do some manipulation
  subscriber.next(httpJsonResponse);
  subscriber.complete();
}
```
