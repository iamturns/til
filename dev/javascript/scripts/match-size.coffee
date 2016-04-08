# $('element').matchSize 'width', $('element-2')
# $('element').matchSize 'height', $('element-2')
# $('element').matchSize(
#   'width',
#   $('element-2'),
#   {
#     callback_adjust_size: (size) ->
#       size + 100
#     refresh_on_window_resize_enabled: true
#     refresh_on_window_resize_throttle: 100
#   }

(($) ->

  class MatchSize

    DEFAULT_OPTIONS =
      callback_adjust_size: undefined
      refresh_on_window_resize_enabled: true
      refresh_on_window_resize_throttle: 100

    EVENT_RUN = 'match_heights:run'

    constructor: (@$el, @size_type, @$target, options = {}) ->

      @options = $.extend(true, {}, DEFAULT_OPTIONS, options)

      return if @$target.length is 0

      if @get_valid_size_types().indexOf(@size_type) is -1
        throw 'invalid size type'

      @$document = $(document)

      @attach_events()

      @$document.trigger(EVENT_RUN)

    get_valid_size_types: ->
      ['width', 'height']

    attach_events: ->
      @attach_event_document_update()
      @attach_event_window_resize()

    attach_event_document_update: ->
      $(document).on EVENT_RUN, => @run()

    attach_event_window_resize: ->

      return unless @options.refresh_on_window_resize_enabled

      timeout = null

      $(window).on 'resize', =>

        clearTimeout(timeout)

        timeout = setTimeout(
          => @$document.trigger(EVENT_RUN),
          @options.refresh_on_window_resize_throttle
        )

    run: ->
      size = @get_target_size()

      if @options.callback_adjust_size?
        size = @options.callback_adjust_size(size)
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
      plugin_instance = new MatchSize($el, size_type, $target, options)
      $el.data('match_size', plugin_instance)

)(jQuery)