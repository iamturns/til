Redux
=====

Entire state of app is stored inside single *store*.

State is read only.

The only way to change state is to dispatch an action.

An action is a javascript object.

An action could be a network request, user interaction, etc.



Store
=====

```javascript
import { createStore } from 'redux';

const store = createStore(counter);

store.subscribe(() => {
  console.log(store.getState());
});

store.dispatch({ key: 'value' });
```

Pure & Impure Functions
=======================

**Pure functions**

* Consistent and predictable.
* Return same data given the same parameters.
* Do not modify values passed to them.

** Impure functions**

* Has side effects (eg: updates database, changes DOM)
* Alters parameters passed into it

Reducer
=======

Reducer functions are used to modify state.

It is a *pure function* that takes the previous state and the action being dispatched, and returns the next state.

```javascript
function reducerName(state = 'default state', action) {
  // Check action and return modified state
  // If action has no consequences, return state untouched;
  return state;
}
```

```javascript
function addCounter(list = [], action) {
  // WRONG! Impure
  list.push(0);
  return list;

  // Pure
  return list.concat([0]);

  // ES6 way
  return [...list, 0];
}
```

```javascript
function removeCounter(list = [], action) {
  // WRONG! Impure
  delete list[action.index];
  return list;

  // Pure
  return list
    .slice(0, action.index)
    .concat(list.slice(action.index + 1));

  // ES6 way
  return [
    ...list.slice(0, action.index),
    ...list.slice(action.index + 1)
  ];
}
```

```javascript
function incrementCounter(list, action) {
  return [
      ...list.slice(0, action.index),
      list[action.index] + 1,
      ...list.slice(action.index + 1)
  ];
}
```

```javascript
function toggleTodo(todo, action) {
  return Object.assign(
    {},
    todo,
    {
      completed: !todo.completed
    }
  )
}
```
