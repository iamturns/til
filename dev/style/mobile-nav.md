Mobile nav
==========

```
<html class="is-sidebar-open is-page-header-hidden">
<head>
<style>

*,
*:before,
*:after {
  box-sizing: border-box;
}

html {
  width: 100%;
  height: 100%;
}

body {
  width: 100%;
  height: 100%;

  /* test colors */
  color: white;
  margin: 0;
  font-size: 30px;
  line-height: 2em;
}

.nav-mobile {
  width: 200px;
  height: 100%;

  overflow-x: hidden;
  overflow-y: scroll;

  position: fixed; /* could be absolute, but in some cases prevents touch devices swiping towards it */
  top: 0;
  left: 0;

  /* test colors */
  background-color: blue;
}

.page-container {
  transition: transform 0.25s;

  width: 100%;
  height: 100%;

  overflow-x: hidden;
  overflow-y: scroll;

  position: relative;

  /* test colors */
  background-color: red;
}

.is-sidebar-open .page-container {
  transform: translateX(200px);
}

.page-header {
  transition: transform 0.25s;

  width: 100%;
  height: 50px;
  overflow: hidden;

  position: fixed;
  top: 0;

  /* test colors */
  background-color: green;
}

.is-page-header-hidden .page-header {
  transform: translateY(-50px);
}

.page-content {
  width: 100%;
  height: 100%;

  overflow-x: hidden;
  overflow-y: scroll;

  padding-top: 50px;

  /* test colors */
  background-color: black;
}
</style>
</head>
<body>
  <nav class="nav-mobile">
    Content 1<br />Content 2<br />Content 3<br />Content 4<br />Content 5<br />Content 6<br />Content 7<br />Content 8<br />Content 9<br />Content 10<br />Content 11<br />Content 12<br />Content 13<br />Content 14<br />Content 15<br />Content 16<br />Content 17<br />Content 18<br />Content 19<br />Content 20
  </nav>
  <div class="page-container">
    <header class="page-header"></header>
    <section class="page-content">
      Content 1<br />Content 2<br />Content 3<br />Content 4<br />Content 5<br />Content 6<br />Content 7<br />Content 8<br />Content 9<br />Content 10<br />Content 11<br />Content 12<br />Content 13<br />Content 14<br />Content 15<br />Content 16<br />Content 17<br />Content 18<br />Content 19<br />Content 20
    </section>
  </div>
</body>
</html>
```