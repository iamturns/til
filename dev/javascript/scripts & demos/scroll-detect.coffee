# Requires underscore.js

class ScrollDetect

  constructor: ->
    $(document.body).on('scroll', @_getDebounceScrolling())
    $(document.body).on('scroll', @_getDebounceScrollEnd())

  _eventScrollEnd: ->
    console.log 'STOPPED SCROLLING'

  _eventScrolling: ->
    console.log 'SCROLLING'

  _getDebounceScrollEnd: ->
    _.debounce(@_eventScrollEnd, 250)

  _getDebounceScrolling: ->
    _.debounce(@_eventScrolling, 250, true)
