AngularJS Directives
====================

Creates custom elements and events which encapsulates HTML and logic



Basic setup
===========

    app.directive('myDirective', function() {
      return {
        link: function(scope, element, attrs, controller) {
        }
      };
    });

    <div my-directive></div>
    
Let's add some custom HTML

    link: function(scope, element, attrs, controller) { 
      var markup = "<input type='text' ng-model='sampleData' /> {{sampleData}}";
      var markupCompiled = $compile(markup)(scope);
      angular.element(element).html(markupCompiled);
    }

Restrict
--------

Directives can be used an 'elements' and 'attributes' by default

There is a default option named 'restrict' to control this, the default being;

    {
      restrict: 'EA'
    }
    
Override this with 'E' or 'A' if you like

Replace
-------

Wise when using elements, to avoid leaving strange invalid HTML

Replace entire custom directive element with this option;

    {
      replace: true
    }

Template
--------

If the only feature of the directive is to place markup on the page, a shortcut is available;

    return {
      template: "<input type='text' ng-model='sampleData' /> {{sampleData}}"
    }

This could also be a URL to a template file

    templateUrl: 'something.html'



Scope
=====

Generally you want to isolate scope to each directive

    return {
      scope: {}
    }
    
Strings
-------

    <my-directive exampleString="here you go" />
     
    scope: {
      exampleMethod: "@"
    }
    
Expressions
-----------

Could do something like...

    <my-directive exampleString="{{somethingDynamic}}" />
    
Or...

    <my-directive exampleMethod="somethingDynamic" />

    scope: {
      exampleExpression: "="
    }
    
Methods
-------

    <my-directive exampleMethod="doSomething()" />

    scope: {
      exampleExpression: "&"
    }



Events
======

Let's create a directive that shows an alert on click

Normally you'd do this with ng-click, but, whatever, it's a simple hypothetical example;

    <input hello-on-click />
    
    app.directive('helloOnClick', function() {
      return {
        restrict: 'A',
        link: function(scope, element, attrs, controller) {
          element.on('click', function() {
            alert('Hello!');
          });
        }
      };
    });



Attributes
==========

    <gravatar email="{{emailAddress}}" />
    
    app.directive('gravatar', function() {
      return {
        restrict: 'E',
        template: '<img />',
        replace: true,
        link: function(scope, element, attrs, controller) {
          attrs.$observe('email', function(newValue, oldValue) {
            if (newValue !== oldValue) {
              var gravatarUrl = 'something';
              attrs.$set('src', gravatarUrl);
            }
          });
        }
      }
    });


Controllers
===========

    return {
      controller: function($scope) {
      
      }
    }

Or separate the controller

    app.controller('DirectiveController', function DirectiveController($scope) {
      //
    });
    
    return {
      controller: 'DirectiveController'
    }

Or pass in the controller, if it needs to be dynamic

    <my-directive ctrl="DirectiveController" />
    
    return {
      controller: '@',
      name: 'ctrl'
    }
    
Sharing
-------

Use the `require` attribute to share controllers

    <main sub-one sub-two />

    app.
      directive('main', function() {
        controller: function($scope) {
          this.doSomething = function(param) {
            //     
          };
        }
      }).
      directive('sub-one', function() {
        return {
          restrict: 'A',
          require: 'main',
          link: function(scope, element, attrs, controller) {
            controller.doSomething('test 1');          
          }
        };      
      }).
      directive('sub-two', function() {
        return {
          restrict: 'A',
          require: 'main',
          link: function(scope, element, attrs, controller) {
            controller.doSomething('test 2');          
          }
        };
      });
      


Transclusion
============

Imagine something like this:

    <collapsible title="{{session.name}}">
      <div class="author">{{session.author}}</div>
      <p>{{session.intro}}</p>
    </collapsible>

How do we keep the contents within collapsible, by add the title and some events?

    return {
      template: '<div><div class="title">{{title}}</div><div ng-transclude></div></div>',
      transclude: true,
      scope: {
        title: '@'
      }
    }
