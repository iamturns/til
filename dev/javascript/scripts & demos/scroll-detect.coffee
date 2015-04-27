# Requires underscore.js

class ScrollDetect

  constructor: ->
    $(window).on('scroll', @_getDebounceScrollStart())
    $(window).on('scroll', @_getDebounceScrollEnd())

  _eventScrollEnd: ->
    console.log 'STOPPED SCROLLING'

  _eventScrollStart: ->
    console.log 'SCROLLING'

  _getDebounceScrollEnd: ->
    _.debounce(@_eventScrollEnd, 100)

  _getDebounceScrollStart: ->
    _.debounce(@_eventScrollStart, 100, true)
