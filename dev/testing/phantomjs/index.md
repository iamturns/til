PhantomJS
=========

- Headless browser (via command line)
- Provides JavaScript API for;
  - Navigation
  - Screenshots
  - User behavior and assertions
- Based on Webkit (similar environment to Safari and Chrome)
- Not a test framework, but generally used by test frameworks as quick command line tests before committing code

Related docs
------------

- CasperJS
  - Adds some more great features on top of PhantomJS, including a test suite
- Selenium WebDriver
  - Similar, but uses real browsers & devices
  - Can be used AS WELL - so the same tests can run in PhantomJS or WebDriver
- Karma
  - Can run tests headlessly using PhantomJS
