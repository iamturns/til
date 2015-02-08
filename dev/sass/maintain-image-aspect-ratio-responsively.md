Maintain image aspect ratio responsively
========================================

A couple of methods;

```
.container {
  width: 100%;
  height: 0;
  padding-top: 88%; //aspect ratio
  overflow: hidden;
  position: relative;

  img {

    //1. stay within bounding box:
    max-width: 100%;
    max-height: 100%;

    //or, 2. always full width:
    width: 100%;
    height: auto;

    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;

    margin: auto;
  }
}
```

Using `background-size`:

```
.container {
  width: 100%;
  height: 0;
  padding-top: 88%; //aspect ratio
  overflow: hidden;

  background-image: url(http://path/to/image.jpg);
  background-size: cover;
  -moz-background-size: cover;  /* Firefox 3.6 */
  background-position: center;  /* Internet Explorer 8 and below */
}
```
