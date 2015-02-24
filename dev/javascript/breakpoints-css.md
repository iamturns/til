Breakpoints in CSS
==================

```

window.bp = {
  xs: '(min-width: 320px)'
  s: '(min-width: 480px)'
  m: '(min-width: 768px)'
  l: '(min-width: 960px)'
  xl: '(min-width: 1200px)'
  high_res: '(min--moz-device-pixel-ratio: 1.5),(-o-min-device-pixel-ratio: 3/2),(-webkit-min-device-pixel-ratio: 1.5),(min-device-pixel-ratio: 1.5),(min-resolution: 144dpi),(min-resolution: 1.5dppx)'
}

(($) ->

  window.BreakPointCss = class BreakPointCss

    DEFAULT_OPTIONS = {
      class_prefix: 'bp-'
    }

    constructor: (options = {}) ->
      @options = $.extend(true, {}, DEFAULT_OPTIONS, options)
      @$html = $('html')
      @attach_event_run_on_resize()
      @run()

    attach_event_run_on_resize: ->

      timeout = null

      $(window).on 'resize', =>

        clearTimeout(timeout)

        timeout = setTimeout(
          => @run(),
          250
        );

    run: ->

      for bp_key, bp_val of window.bp
        bp_class = @options.class_prefix + bp_key

        @$html.removeClass(bp_class)

        if Modernizr.mq(bp_val)
          @$html.addClass(bp_class)

)(jQuery)

(($) ->
  $ ->
    new BreakPointCss()
)(jQuery)
```
