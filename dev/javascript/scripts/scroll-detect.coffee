define(
  [
    'underscore'
  ],
  (
    _
  ) ->

    class HelperScrollMonitor

      REFRESH_RATE = 100
      SCROLL_SPEED_MINIMUM = 10
      SCROLL_SPEED_MOMENTUM = 250

      constructor: (@$el) ->
        @$window = $(window)
        @scrollTop = @$el.scrollTop()
        @scrollCount = 0
        @$el
          .on('scroll', _.throttle(@_eventScrollStart, REFRESH_RATE))
          .on('scroll', _.debounce(@_eventScrollEnd, REFRESH_RATE))
          .trigger('scroll')

      _eventScrollStart: =>
        if @scrollEndTimeout?
          clearTimeout(@scrollEndTimeout)
          delete @scrollEndTimeout

        return if @isScrolling
        @scrollCount += 1
        return unless @scrollCount > 2
        return unless @_isScrollingFast()
        @_setScrollStart()

      _eventScrollEnd: =>
        return unless @isScrolling

        @scrollCount = 0

        @scrollEndTimeout = setTimeout(
          => @_setScrollEnd()
          SCROLL_SPEED_MOMENTUM
        )

      _isScrollingFast: ->
        scrollTopPrevious = @scrollTop
        scrollTopNow = @$el.scrollTop()

        @scrollTop = scrollTopNow

        speed = Math.abs(scrollTopNow - scrollTopPrevious)

        return speed > SCROLL_SPEED_MINIMUM

      _setScrollEnd: ->
        @isScrolling = false
        @$window
          .data('is-scrolling', false)
          .trigger('scroll-end')

      _setScrollStart: ->
        @isScrolling = true
        @$window
          .data('is-scrolling', true)
          .trigger('scroll-start')

)
