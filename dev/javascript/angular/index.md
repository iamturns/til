Angular overview
================

Browser compatibility
---------------------

IE6 & 7 = Angular 1.0 & 1.1
IE8 = Angular 1.2
IE9 = Angular 1.3+



Basics
======

Setup
-----

Include the AngularJS javascript file, then;

    var app = angular.module('app', []);

Creates a module, which is the container for all code in Angular

Now to create a 'main' controller;

    app.controller('main', function($scope) {
      $scope.message = 'hello world';
    });

App
---

```
<html ng-app="app">
```

The `ng-app` attribute is an Angular directive named `ngApp`

`ng` stands for 'Angular'

Angular considers this as the root element of the application

Allows you, if you prefer, to allow only a portion of the page to be Angular controlled

Module
------

Modules contain many controllers

The name of this module is 'app'

Controller
----------

Matches the controller name;

```
<body ng-controller="main">
```

Let's Angular know a controller we write will control that portion of the page

Binding expressions
-------------------

Denoted by double curlies

```
Hello {{name}}
```

Efficient continuous updates whenever the result changes

Dollar signs
------------

Parameters that begin with a dollar sign, eg: `$scope` are components / services provided by Angular

Model
-----

aka scope and `$scope`



Expressions
===========

Eg:

- `1 + 2`
- `user.name`
- `items[index]`

vs javascript expressions
-------------------------

- Context is evaluated against object scope, not global window scope
- Forgiving to `undefined` and `null`
- No if statements / conditions
- No loops
- No exceptions
- No functions
- No regular expressions
- No commas or `void`
- Attach a filter!

within HTML
-----------
 
  <img src="{{image.src}}" />
  
The browser will render this and 404, until Angular comes along and fixes it up

Instead;

  <img ng-src="{{image.src}}" />

Undefined
---------

If a binding expression doesn't work, don't throw an error, it'll blank it out



Controller
==========

    <div ng-controller="MainController"></div>

    var MainController = function($scope) {
      $scope.message = "Hello!";
    };


Angular invokes controller functions when it needs to create a controller to manage an area of a webpage

The controller assigns models to the scope object

Binding expressions move data from the scope into the view

Page often has multiple controllers, and controllers can even be nested



Digest cycle
============

Looks to see if any data being rendered on the page has changed

Compares old values to new values (dirty check)

Digest cycles may need to be manually invoked when used with 3rd party code or events triggered outside of Angular



Performance
===========

99% of the time = too many bindings

- Use less bindings
  - Remove bindings from things that aren't displayed all the time
  - Then add bindings when needed
- One time bindings
  - Render model, then leave it as static 
  - Eg: displaying catalogue of items to purchase - that stuff won't really ever change
- Use React rendering engine
  - Not a trivial thing to do
  - May miss out on great Angular features by doing this



Minification
============

Changes variable names, which really confuses parameter name detection

Fix with;

    var MainController = function($scope, $http) {
      //...
    }

    app.controller("MainController", ["$scope", "$http", MainController]);


Directive overview
==================

ngModel
-------

Pass from the frontend to the controller model / $scope

    <div ng-controller="MainController">
      <input type="text" ng-model="username" />
    </div>
    
    // controller
    
    $scope.username


ngClick
-------

Attach a function, with parameters if you like;

    <input type="submit" ng-click="search(username)" />
    
    //controller
    
    $scope.search = function(username) {
      //...
    }

ngSubmit
--------

A better way than the above example

    <form ng-submit="search(username)">
      <input type="submit" />
    </form>

ngRepeat
--------

A 'for' loop

    <tr ng-repeat="repo in repos">
      <td>{{ repo.whateva }}</td>
    </tr>

ngShow & ngHide
---------------

    <div ng-show="user"></div>
    
The div is only displayed if 'user' is truthy

Truthy values;
- true
- {}
- []
- number > 0
- "non empty string"

Falsy values;
- false
- 0
- ""
- null
- undefined
- NaN

ngInclude
---------

Pass in expression to evaluate against scope, which returns the filename to include

Or, pass in a string

    <div ng-include="'filename.html'"></div>

ngAria
------

Great for accessibility

Convert numbers, dates, and currency into local formats



Filters
=======

Basic format:

    {{ expression | filterName:parameter }}

Some examples;
- Currency
- Date
- lowercase
- uppercase
- number
  - Format with local delimiter
- json
  - Handy for dumping json into display
- Filter
  - Yes, a filter filter!
  - Filter a collection based on criteria
- limitTo
- orderBy



Services
========

In web development 'services' are usually connections to an API or web service

A service in Angular is a component that performs a specific job

I think of them as controller helpers

They are called in via controller parameters;

      function($scope, $service) {
      
      }
      
Services are only instantiated once per application (singleton pattern)
      
Some examples
-------------
      

    var myInterval = $interval(functionToRun, ms, intervalCount);
    $interval.cancel(myInterval);

    $log.info('Message');

Build your own
--------------

### Why?

- Package reusable logic within the application
- Store shared data
- Improve maintainability

### How?

    var module = angular.module('mainAppModule');
    module.factory('serviceName', function() {
      // service
    });

    var controller = function($serviceName) {
      
    };



Router
======

Depends on `angular-route.js`

Configure via `$routeProvider`

