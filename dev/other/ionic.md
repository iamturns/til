Ionic
=====

Flavours;

- Ionic
  - http://ionic.io/
- Framework
  - http://ionicframework.com/
  - For building interactive web apps
  - Build with SASS and AngularJS
- Creator
  - http://creator.ionic.io/
  - Drag and drop interface with code export
- View
  - http://view.ionic.io/
  - Share Ionic and Cordova apps with clients and testers without the App Store
- Label
  - http://lab.ionic.io/
  - Create, build, test, and deploy Ionic apps
  - Desktop app
- Market
  - http://market.ionic.io/
  - Plugins, starters, themes
- Learn
  - http://learn.ionicframework.com/
  - Screencasts and guides



Ionic.io
========

In alpha, will eventually become a paid service

Feature overview
----------------

- Can be viewed instantly using the 'Ionic View' app (available on iOS and Android)
- Can send deploys to app users instantly ('Check for updates' and 'Download updates' and 'Update available' stuff)
- Push notifications to app users phones when criteria matches
- Like Google Analytics

Start
-----

Upload with;

```
ionic upload
```

Or assign settings yourself with;

```
ionic io init
```



Ionic framework
===============

Build native feeling apps with HTML, CSS, and JS

NOT a Phonegap replacement - focused on frontend style and UI interaction

Similar to Twitter Bootstrap

Install
-------

```
npm install -g cordova ionic
ionic start myApp tabs
```

Alternatives;

```
ionic start myApp sidemenu
ionic start myApp blank
```

Dev
---

Start local dev server with live reload; 

```
ionic serve [options]
```

Develop ios and android side by side in browser;

```
ionic serve --lab
```

Run and emulate
---------------

Add platform target

```
ionic platform ios android
```

```
ionic build <PLATFORM>
ionic emulate <PLATFORM>
ionic run <PLATFORM>
ionic package <MODE> <PLATFORM>
```

CSS
---

Lots of things, most interestingly;

- Cards
- Form toggles switches

Platform customization
-----------------------

Adds classes to `<body>` tag, eg;

- platform-ios
- platform-browser
- platform-android
- platform-ipad

Javascript
----------

- Action sheet
  - Native overlay of options
- Backdrop
  - Modal overlay style
- Scroll tweaks
- Gestures
  - Long holds
  - Swipes + directions
  - Drags + directions
- Keyboard zoom to element on focus
- Slide menu
- Full carousel through pages

Sass
----

```
ionic setup sass
```
