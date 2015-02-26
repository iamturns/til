# $('element').matchSize 'width', $('element-2')
# $('element').matchSize 'height', $('element-2')
# $('element').matchSize 'width', $('element-2'),
#   refresh_on_window_resize:
#     enabled: true
#     throttle: 100

(($) ->

  $.matchSize = class MatchSize

    DEFAULT_OPTIONS = {
      refresh_on_window_resize:
        enabled: true
        throttle: 100
    }

    constructor: (@$el, @size_type, @$target, options = {}) ->

      @options = $.extend(true, {}, DEFAULT_OPTIONS, options)

      return if @$target.length is 0

      if @get_valid_size_types().indexOf(@size_type) is -1
        throw 'invalid size type'

      @attach_events()
      @run()

    get_valid_size_types: ->
      ['width', 'height']

    attach_events: ->
      $(document).on 'match_size:update', => @run()

      @attach_event_window_resize() if @options.refresh_on_window_resize.enabled

    attach_event_window_resize: ->

      timeout = null

      $(window).on 'resize', =>

        clearTimeout(timeout)

        timeout = setTimeout(
          => @run(),
          @options.refresh_on_window_resize.throttle
        )

    run: ->
      size = @get_target_size()
      @set_element_size(size)

    get_target_size: ->
      if @size_type is 'width'
        return @$target.outerWidth(true)
      else
        return @$target.outerHeight(true)

    set_element_size: (size) ->
      @$el.css(@size_type, "#{size}px")

  $.fn.matchSize = (size_type, $target, options = {}) ->
    return @.each ->
      $el = $(@)
      plugin_instance = new $.matchSize($el, size_type, $target, options)
      $el.data('match_size', plugin_instance)

)(jQuery)