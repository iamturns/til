Angular best practises
======================

John Papa
=========

https://github.com/johnpapa/angular-styleguide

- Split into files
- Use IIFE

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

Notice where `ExampleController` sits - outside of the directive. This eliminates issues where injection is created as unreadacble code after the `return`

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

### Up to this

https://github.com/johnpapa/angular-styleguide#resolving-promises-for-a-controller
