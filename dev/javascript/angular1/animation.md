Angular Animations
==================

@TODO;
- https://docs.angularjs.org/guide/animations
- https://docs.angularjs.org/api/ngAnimate

ngAnimate
---------

Provides hooks for common directives (eg: ngRepeat, ngSwitch, ngView)

Hooks can trigger CSS transition, CSS keyframes, or JS animation

Eg: ngRepeat will add 'ng-enter', 'ng-leave', 'ng-move' at appropriate times to trigger CSS

Same with adding or removing a class. Eg, adding and removing 'css-class' will;
- ''
- ng-animate css-class-add css-class css-class-add-active
- css-class
- ng-animate css-class-remove css-class-remove-active
- ''