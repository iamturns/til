Mocha
=====

- Javascript unit tester and runner
- Built for testing NodeJS modules
- Can be configured to BDD (jasmine style) or TDD (qUnit style)
 
vs Jasmine
----------

- Mocha has better BDD style
- Mocha is better at testing async
- Mocha has no spies built in. Most use `sinon.js` for this.
- Mocha has no assertion framework. Most use `chai`
- Jasmine is more of a complete all-in-one solution. Mocha goes for basic functionality and extensibility via plugins
