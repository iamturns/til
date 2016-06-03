Angular 2 Bindings overview
===========================

Further information within [template syntax](./template-syntax.md).

Intro
-----

Angular processes _all_ data bindings once per JavaScript event cycle, starting from the deepest and travelling up to the root of the application component tree.

Interpolation
-------------

The material between the braces is a **template expression**. These are evaluated and converted to a string.

Expressions often refer to values that exist within the **expression context**, which is usually the component.

### Syntax

* `{{expression}}`
* `<span [innerHTML]="expression"></span>`

### Direction

* One way in
* Data source ---> View target

### Restrictions

* `=` and `+=` 
* `new`
* `;` and `,` for chaining
* `++` and `--`
* `|` and `&`

Property binding
----------------

Note: sets *properties*, not *attributes* (more later)

### Syntax

* `[target]="expression"`
* `bind-target="expression"`
* `target={{expression}}`

### Direction

* One way in
* Data source ---> View target

### Examples

* `<img [src]="imageUrl" />`
* `<example [username]="user.name" />`

Event binding
-------------

Consists of a **target event** on the left, and a **template statement** on the right.

The template statement responds to an event raised by a **binding target** (element, component, directive).

Statements can only refer to what's in the **statement context**, which is usually the component instance.

### Syntax

* `(event)="statement"`
* `on-event="statement"`

### Direction

* One way out
* Data source <--- View target

### Examples

* `<button (click)="doSomething()" />`
* `<input (keyup.enter)="doSomething() />"`

### Restrictions

Has the same restrictions as the expression parser, but supports;

* assignment (`=`)
* chaining (`;` and `,`)
    * `<button (click)="doSomething(); doSomethingElse()" />`

Two way binding
---------------

### Syntax

* `[(target)]="expression"`
* `bindon-target="expression"`

### Direction

* Two way
* Data source <--> View target

### Examples

* `<input [(ngModel)]="user" />`
