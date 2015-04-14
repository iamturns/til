Javascript input events
=======================

- keyup
  - key released from keyboard
- keydown
  - key pressed on keyboard
  - handles special keys (ctrl, alt, shift, etc)
  - case insensitive
  - continues to fire if key held down
- keypress
  - key pressed on keyboard
  - does not handle special keys (ctrl, alt, shift, etc)
  - case sensitive
  - fires once if key is held down
- change
  - fires if element has been changed
  - fires once when element loses focus
- input
  - IE9+
  - fires immediately after modification
- propertychange
  - IE9 

Detecting changes
-----------------

```
jQuery('#some_text_box').on('input propertychange paste'
```

```
jQuery('#some_text_box').on('propertychange change keyup paste input'
```