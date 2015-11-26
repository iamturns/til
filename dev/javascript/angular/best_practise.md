Angular best practises
======================


Index
=====

- John Papa
  - https://github.com/johnpapa/angular-styleguide
  - 12,871 stars
  - An AngularJS god

- Todd Motto
  - https://github.com/toddmotto/angularjs-styleguide
  - 3,143 stars
  - Very similar to John Papa
  
- mgechev
  - https://github.com/mgechev/angularjs-style-guide
  - 3,668 stars

- GoCardless
  - https://github.com/gocardless/angularjs-style-guide
  - 1,509 stars
  - ES6 love


John Papa
=========

### Declaring modules

Don't use a variable

    //bad
    var app = angular.module('app', [
      'ngAnimate'
    ]);

    //good
    angular.module('app', [
      'ngAnimate'
    ]);

### Avoid fetching module into variable

More readable and avoids collisions and leaks

    //bad
    var app = angular.module('app');
    app.controller('SomeController', SomeController);
    
    //good
    angular
      .module('app')
      .controller('SomeController', SomeController);

### Avoid anonymous functions

Helps with readability, debugging and nested callbacks

    //bad
    angular
      .module('app')
      .controller('DashboardController', function() {});
      
    //good

    angular
      .module('app')
      .controller('DashboardController', DashboardController);

    function DashboardController() {}

### controllerAs syntax

- Provides single instance
- Closer to JavaScript constructor style
- Easier to read where `{{ customer.name }}` comes from
  - Especially if multiple nested controllers used `{{ name }}`

    //bad
    
    <div ng-controller="CustomerController">
      {{ name }}
    </div>
    
    function CustomerController($scope) {
      $scope.name = 'Matt';
    }
    
    //good
    
    <div ng-controller="CustomerController as customer">
      {{ customer.name }}
    </div>
    
    function CustomerController() {
      this.name = 'Matt';
    }

### controllerAs `this` mapping

Capture `this` into a variable (eg: `vm`) to use within all blocks

Unless you're using ES6, then just use fat arrows to keep the `this` context 

    function CustomerController() {
      var vm = this;
      vm.name = 'Matt';
    }

### Bindable members at top

    //bad
    
    function ExampleController() {
      var vm = this;
      
      vm.doSomething = function() {
        //...
      };
      
      vm.title = 'Example';

    }
    
    //good
    
    function ExampleController() {
      var vm = this;
      
      vm.doSomething = doSomething;
      vm.title = 'Example';

      function doSomething() {
        //...      
      };

    }
    
### Use services

- Re-use logic
- Easier to test
- Keep controllers lean

### Assigning controllers

Bad;

    function config($routeProvider) {
      $routeProvider
        .when('/avengers', {
          templateUrl: 'avengers.html'
        });
    }

    <!-- avengers.html -->

    <div ng-controller="AvengersController as vm"></div>

Good;

    function config($routeProvider) {
      $routeProvider
        .when('/avengers', {
          templateUrl: 'avengers.html',
          controller: 'Avengers',
          controllerAs: 'vm'
        });
    }
    
    <!-- avengers.html -->

    <div></div>
    
### Directive prefix

Short, unique and description. Namespace with company name at beginning, in a similar way `ng-` (angular) and `ion-` (ionic) does

### Don't use directive as CSS classes

Just elements and attributes

Element if it's stand-alone, and attribute when it enhances an existing DOM element

### Directive controllers

Use the `controller as` syntax to match views

Notice where `ExampleController` sits - outside of the directive. This eliminates issues where injection is created as unreachable code after the `return`

    // exampleDirective.js

    angular
      .module('app')
      .directive('exampleDirective', exampleDirective);
    
    function exampleDirective() {
    
      var directive = {
        templateUrl: 'example.directive.html', // file example below
        scope: {
          max: '='
        },
        link: link,
        controller: ExampleController,
        controllerAs: 'vm',
        bindToController: true // because the scope is isolated
      };
    
      return directive;
    
      function link(scope, el, attr, ctrl) {
        // undefined
        scope.min;
        scope.max;
        
        // yep
        scope.vm.min;
        scope.vm.max;
      }
    }
    
    function ExampleController() {
      var vm = this;
      vm.min = 3;
    }
    
    // example.directive.html
    
    <div>{{ vm.max }</div>
    <div>{{ vm.min }</div>

### Use `activate()` within controllers

Bad;

    function AvengersController(dataservice) {
      var vm = this;
      vm.avengers = [];
      vm.title = 'Avengers';
  
      dataservice.getAvengers().then(function(data) {
        vm.avengers = data;
        return vm.avengers;
      });
    }
    
Good;

    function AvengersController(dataservice) {
      var vm = this;
      vm.avengers = [];
      vm.title = 'Avengers';
  
      activate();
  
      ////////////
  
      function activate() {
        return dataservice.getAvengers().then(function(data) {
          vm.avengers = data;
          return vm.avengers;
        });
      }
    }

### Controllers that require a resolved promise to activate

Use routes, see example here:

https://github.com/johnpapa/angular-styleguide#style-y081

### ngAnnotate

Use `/* @ngInject */` so ensure it detects all dependencies

### Naming

#### Filenames

- `name.controller.js`
- `name.service.js`
- `name.module.js`
- `name.routes.js`
- `name.config.js`
- `name.directive.js`
- `constants.js`

#### Tests

- `[[original filename]].spec.js`

#### Controllers

- `UpperCamelCaseController`

#### Services & Factories

- `camelCaseService`
- `camelCase` - drop the suffix if it's obviously a service, eg: `logger`

#### Directives

Prefix short namespace

- `xxCamelCase`

#### Modules

Main module: `app.module.js` named `app`

Additional modules, eg: `admin.module.js` named `admin`

#### Config

Config for each module named similar to module file, `app.config.js`

#### Routes

`app.route.js`

### App configuration

Use services to set things up

    angular.module('app').run(runBlock);

    function runBlock(authenticator, translator) {
        authenticator.initialize();
        translator.initialize();
    }

### Tests

Place unit tests with your code

Place other tests within `tests` folder

### Vendor globals

Create constants for vendor libraries that are global variables

    angular
      .module('app.core')
      .constant('moment', moment);



Todd Motto
==========

### One time binding syntax

`{{ ::value }}`

Improves performance for each dirty check



mgechev
=======

- Use `$resource` instead of `$http` when possible
- Do not manipulate DOM in controllers. Use directives instead.
- Make filters as light as possible, as they are called very often during digest cycle
- Careful of `$watch`, keep it simple and light
  - Perhaps try `$watchCollection`



gocardless
==========

### Use resolvers to inject data

Views are rendered when data is available. Avoids empty views whilst data is loading.

See example here: https://github.com/gocardless/angularjs-style-guide#use-resolvers-to-inject-data

