Angular 2 Template syntax
=========================

Read [bindings overview](./bindings-overview.md) first.



Attributes & properties
=======================

Attributes initialize properties and then are complete. Property values can change.

An example;

    <input type="text" value="Bob" />

The `value` *attribute* initializes the `value` *property* to "Bob".

If the user enters "Sally" into the input, the `value` *attribute* remains as "Bob", but the `value` *property* changes to "Sally".

So with this binding;

    <button [disabled]="isUnchanged">Save</button>

We assume Angular will alter the `disable` *attribute*. No, it is altering the `disable` *property*.

Angular provides attribute bindings, class bindings, and style bindings;

    <button [attr.aria-label]="help">Help</button>
    <button [class.special]="isSpecial">Special</button>
    <button [style.background-color]="canSave ? 'cyan': 'grey'" >Save</button>
    <button [style.font-size.em]="isSpecial ? 3 : 1" >Big</button>
    <button [style.font-size.%]="!isSpecial ? 150 : 50" >Small</button>

One-time initialization
-----------------------

If a component accepts a string, and this value is fixed and never changes, then you can one-time init;

    <user-detail prefix="Hello to" [user]="currentUser" />



Event handling
==============

$event
------

Use an event object named `$event`;
 
    <button (click)="onClickMe($event)"></button>
    
Then;

    onClickMe(event: Event) {
      event.stopPropagation();
    }

Custom events with EventEmitter
-------------------------------

A 'user delete' component has a delete button, but no knowledge on _how_ to delete the user. So it emits an event instead.

Template;

    <div>
        {{user.name}}
        <button (click)="delete()">Delete</button>
    </div>

Within the component;

    constructor() {
      this.deleteRequest = new EventEmitter<User>();    
    }

    delete() {
      this.deleteRequest.emit(this.user);    
    }

Now the hosting parent component;

    <user-detail (deleteRequest)="onDeleteUser($event)" [user]="currentUser" />

The `$event` will contain the user passed into the EventEmitter.

Style guide '05-15': Use `on` prefix for event handlers, but not for events, eg;

    <div (eventName)="onEventName($event)"></div>

ngModel
=======

The format;

    [(x)]="e"

Is shorthand for;

    [x]="e" (xChange)="e = $event"

Eg;

    [(ngModel)]="user.name"
    
Is the same as;

    [ngModel]="user.name"
    (ngModelChange)="user.name = $event"

Most two way binding uses `ngModel`, which is a directive to help with this common scenario;

    <input [value]="user.name" (input)="user.name = $event.target.value" />

These details are hidden within `ngModel` input and `ngModelChange` output properties.

`ngModel` only works for elements (eg: input) that are supported by `ControlValueAccessor`.

Sometimes this needs to be broken apart for more complex scenarios;

    <input [ngModel]="user.name" (ngModelChange)="setUpperCaseFirstName($event)" />



Star templates
==============

The `*` before attributes is syntactic sugar to highlight directives that modify HTML using templates.

Also known as attribute directives.

Powered by the `<template>` tag: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/template

`<template>` tags are hidden within the browser.

Within the app, Angular removes `<template>` tags (and children).

The asterix / star for structural directives (`*ngIf`, `*ngFor`), implies that under the hood, Angular will replace the asterix with a `<template>`.

NgIf
----

The following;

    <user-detail *ngIf="currentUser" [user]="currentUser"><user-detail>
    
Expands to;

    <user-detail template="ngIf: currentUser" [user]="currentUser"></user-detail>
    
And finally expands to;

    <template [ngIf]="currentUser">
      <user-detail [user]="currentUser"></user-detail>
    </template>

NgSwitch
--------

```javascript
<span [ngSwitch]="toeChoice">
  <span *ngSwitchWhen="'Eenie'">Eenie</span>
  <span *ngSwitchWhen="'Meanie'">Meanie</span>
  <span *ngSwitchWhen="'Miney'">Miney</span>
  <span *ngSwitchWhen="'Moe'">Moe</span>
  <span *ngSwitchDefault>Default</span>
</span>
```

Expands to;

```javascript
<span [ngSwitch]="toeChoice">
  <template [ngSwitchWhen]="'Eenie'"><span>Eenie</span></template>
  <template [ngSwitchWhen]="'Meanie'"><span>Meanie</span></template>
  <template [ngSwitchWhen]="'Miney'"><span>Miney</span></template>
  <template [ngSwitchWhen]="'Moe'"><span>Moe</span></template>
  <template ngSwitchDefault><span>other</span></template>
</span>
```

NgFor
-----

    <div *ngFor="let user of users">{{user.name}}</div>
    
With an index;

    <div *ngFor="let user of users; let i = index">{{i + 1}} - {{user.name}}</div>

Other special values exist, including `last`, `even` and `odd`.

### NgForTrackBy

Let Angular know a unique identifier for each item to avoid recreating the entire contents of an `ngFor` when something changes.

Within the component;

    trackByUsers(index: number, user: User) {
      return user.id;    
    }
    
The template;

    <div *ngFor="let user of users; trackBy: trackByUsers">{{ user.name }}</div>
    
Alternative syntax;

    <div *ngFor="let user of users" *ngForTrackBy="trackByUsers">{{ user.name }}</div>

This expands to;

    <div template="ngFor let user of users; trackBy: trackByUsers">{{ user.name }}</div>
    
And finally;

    <template ngFor let-user [ngForOf]="users" [ngForTrackBy]="trackByUsers">
      <div>{{ user.name }}</div>
    </template>



Template reference variables
============================

Grants us direct access to the element.

Prefix identifier with a `#`, eg;

    <input #phone />
    <p>{{phone.value}}</p>
    
Alternative syntax;

    <input ref-phone />

Angular only updates bindings in response to an async event. So, add a `keyup` event which does nothing to trigger this.

    <input #phone (keyup)="0" />

This technique can be used to bypass the `$event` param;

    <input #phone (keyup)="onKey(phone.value)" />



Input and output properties
===========================

There are two sides to a binding, the target and the source. Target is on the left of the `=`, and source to the right, eg;

    [target]="source"
    (target)="source"
    [(target)]="source"

When the binding target is a directive property, it must be declared as **input** or **output***.

Eg;

    <user-detail [user]="currentUser" (deleteRequest)="deleteUser($event)" />

Declare within the component;

    @Input() user: User;
    @Output() deleteRequest = new EventEmitter<User>();

Or within the `@Component` or `@Directive` decorator;

    @Component({
      inputs: ['user'],
      outputs: ['deleteRequest'],
    })

Note: the above goes against the style guide (05-12).

Aliasing
--------

Use this syntax;

    @Output(publicAlias) propertyName = ...

Or;

    @Component({
      outputs: ['propertyName:publicAlias']    
    })

Note: aliasing is marked as 'avoid' in the style guide (05-13).



Template expression operators
=============================

Pipe operator (|)
-----------------

Small transformations. Simple functions that accept an input value and return a transformed value.

    {{title | uppercase | lowercase}}
    
Some pipes take parameters, eg;

    {{user?.birthdate | date: 'longDate'}}

Safe navigation (?)
-------------------

Fluent way to guard against null and undefined values;

    {{user?.firstName}}
     
Can be chained;

    {{a?.b?.c?.d}}
