Angular testing
===============

ngMock
------

- Inject mock Angular services into tests
- Extend core services so they can be inspected and controlled in sync instead of async

Some features;
- `$rootScope.scope` - decorated with helper methods for testing
- `$log` overridden to gather logs as array, available as `$log.error.logs`
- `$interval` mocked
- `$httpBackend` fake backend implementation

Functions, available on global scope;
- `dump`
  - Display objects on debug console
- `module`
  - @TODO, huh?
- `inject`
  - Creates a new instance of `$injector`
    - @TODO - what does injector do?
    - https://docs.angularjs.org/api/auto/service/$injector
  
### Injecting

@TODO

#### Avoiding variable name clashes

Often we'd like to inject a reference ONCE only, within a `beforeEach()`

It makes sense to match the service name to the variable name, eg:

    var myService;

    it('does something with myService', function() {
      myService.doSomething();    
    });

But the inject function will override the outer variable

Solution? Wrap it underscores. The service will still be injected

    beforeEach( inject( function(_myService_) {
      myService = _myService_;
    }));


Karma setup
===========

    npm install karma karma-chrome-launcher karma-jasmine
    npm install karma-cli -g
    karma init

Config stored in `karma.conf.js`

    karma start test/karma.conf.js
    



    