Stampit
=======

https://github.com/stampit-org/stampit/

### Alternatives

- http://justinfagnani.com/2015/12/21/real-mixins-with-javascript-classes/
    - Seems to me like a shortcut for long classical inheritance chains?
- https://github.com/stampit-org/supermixer
    - Go barebones, merge objects with `chain: true`
- http://raganwald.com/2015/06/17/functional-mixins.html

Cheatsheet
----------

    const ExampleStamp = stampit()
      // Map of property names and values to be mixed into each new object using shallow merge
      .refs({
        propertyName: 'propertyVal'
      })
      
      // An object deeply merged into each newly stamped object
      // Will not change any refs data
      .props({
        propertyName: 'propertyVal'
      })
    
      .methods({
        doSomething: function() {}
      })
    
      // Run when instance is created
      init((context) => {
        // context = { instance, stamp, args }
        context.instance.something = {};
      })
    
      // Mix together methods, refs, init, etc
      .compose(Stamp1, Stamp2, etc);
    
    // First param sets properties, remaining params injected into `init.args`
    const exampleInstance = ExampleStamp({ property: 'value' }, 'arg1', 'arg2');


Instead of functions, can all be set within object;


    stampit({
      methods:
      refs:
      etc:
    });
